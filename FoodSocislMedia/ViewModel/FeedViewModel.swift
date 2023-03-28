//
//  FeedViewModel.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 26/03/2023.
//

import Foundation
import Combine

final class FeedViewModel: ObservableObject, RequestDelegate {
	@Published var posts: [Post] = []
	@Published var isRequestFailed: Bool = false

	var isLoading: Bool {
		totalPosts != lastLimit
	}

	private var pageLimit: Int = 30
	private var lastLimit: Int = 0
	private var totalPosts: Int?

	// MARK: - Cancellable
	private var postsCancellable: AnyCancellable?
	private var usersCancellable: AnyCancellable?
	private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

	private weak var feedCoordinator: FeedCoordinator?

	init(feedCoordinator: FeedCoordinator) {
		self.feedCoordinator = feedCoordinator
	}

	deinit {
		cancellable.forEach {
			$0.cancel()
		}

		print(self, "is deallocated")
	}

	func getPosts() {
		self.postsCancellable = sendRequest(
			from: APIServiceEndpoint.posts,
			params: [
				"limit": "\(pageLimit)",
				"skip": "\(lastLimit)"
			],
			for: Posts.self
		)
		// Apply the change in main thread because the change will updated UI.
		.receive(on: DispatchQueue.main)
		// Subscribe to the publisher
		.sink { completion in
			switch completion {
				case .failure(let error):
					self.isRequestFailed = true
					print(error)

				case .finished: return
			}
		} receiveValue: { postsResponse in
			self.posts.append(contentsOf: postsResponse.posts)
			self.getUserNames()
			self.lastLimit += postsResponse.limit
			self.totalPosts = postsResponse.total
		}

		self.cancellable.insert(postsCancellable!)
	}

	func getUserNames() {
		// Getting all users ids in a separate array
		let userIDs = Set(posts.map { $0.userId })

		// Making request for each user id without duplicates
		let requests = userIDs
			.map { sendRequest(from: APIServiceEndpoint.user(id: $0), for: User.self) }

		self.usersCancellable = Publishers.MergeMany(requests)
			.receive(on: DispatchQueue.main)
			// Create an array from all received elements
			.collect()
			.sink(
				receiveCompletion: { completion in
					switch completion {
						case .failure(let error):
							self.isRequestFailed = true
							print(error)

						case .finished: break
					}
				},
				receiveValue: { users in
					users.forEach { user in
						self.posts.enumerated()
							.filter { $0.element.userId == user.id }
							.forEach { self.posts[$0.offset].user = user }
					}
				}
			)

		self.cancellable.insert(usersCancellable!)
	}
}
