//
//  SearchViewModel.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject, RequestDelegate {
	@Published var searchingText: String = ""
	@Published var posts: [Post] = []
	@Published var isRequestFailed: Bool = false

	private var cancellable: AnyCancellable?

	private weak var feedCoordinator: FeedCoordinator?

	init(feedCoordinator: FeedCoordinator) {
		self.feedCoordinator = feedCoordinator
	}

	deinit {
		print(self, "is deallocated")
	}

	func search() {
		self.cancellable = sendRequest(
			from: APIServiceEndpoint.search,
			params: ["q": searchingText],
			for: Posts.self
		)
		.receive(on: DispatchQueue.main)
		.sink(
			receiveCompletion: { completion in
				switch completion {
					case .failure(let error):
						self.isRequestFailed = true
						print(error)

					case .finished: break
				}
			},
			receiveValue: { postsResponse in
				self.posts.append(contentsOf: postsResponse.posts)
			}
		)
	}
}
