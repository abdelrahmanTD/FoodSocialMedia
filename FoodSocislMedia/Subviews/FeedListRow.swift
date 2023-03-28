//
//  FeedListRow.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct FeedListRow: View {
	let post: Post

	let shouldBold: Bool?
	let word: String?

	let lineLimit: Int?

	private var fullName: String {
		post.user != nil ? "\(post.user!.firstName) \(post.user!.lastName)" : ""
	}

	init(post: Post) {
		self.post = post
		self.shouldBold = nil
		self.word = nil
		self.lineLimit = 3
	}

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack(alignment: .top, spacing: 10) {
				if let user = post.user {
					Image(user.profilePicture)
						.resizable()
						.frame(width: 50, height: 50)

					VStack(alignment: .leading) {
						Text(fullName)
							.font(.headline)

						Text(post.publishedSince)
							.font(.subheadline)
							.foregroundColor(.gray)
					}
				}
			}

			if shouldBold != nil && shouldBold == true {
				if let word {
					Text(self.boldText(word: word))
						.lineLimit(3)
						.multilineTextAlignment(.leading)
				}
			} else {
				Text(self.post.body)
					.lineLimit(self.lineLimit)
					.multilineTextAlignment(.leading)
			}

			if let images = post.images {
				ImagesPreview(layout: ImageLayout(rawValue: images.count)!, images: images)
					.cornerRadius(10)
			}
		}
	}

	private func boldText(word: String) -> AttributedString {
		var attributedString = AttributedString(post.body)
		if let range = attributedString.range(of: word) {
			attributedString[range].font = .body.bold()
		}
		return attributedString
	}
}

struct FeedListRow_Previews: PreviewProvider {
	static var previews: some View {
		FeedListRow(post: Post.previewPost)
		FeedListRow(post: Post.previewPost, word: "something")
	}
}

// MARK: - Initialisers
extension FeedListRow {
	init(post: Post, word: String) {
		self.post = post
		self.shouldBold = true
		self.word = word
		self.lineLimit = 3
	}

	init(post: Post, lineLimit: Int?) {
		self.post = post
		self.lineLimit = lineLimit
		self.shouldBold = nil
		self.word = nil
	}
}
