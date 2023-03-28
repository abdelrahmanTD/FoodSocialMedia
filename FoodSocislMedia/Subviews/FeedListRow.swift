//
//  FeedListRow.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct FeedListRow: View {
	let post: Post

	private var fullName: String {
		post.user != nil ? "\(post.user!.firstName) \(post.user!.lastName)" : ""
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

			Text(post.body)
				.lineLimit(4)
		}
	}
}

struct FeedListRow_Previews: PreviewProvider {
    static var previews: some View {
		FeedListRow(post: Post.previewPost)
    }
}
