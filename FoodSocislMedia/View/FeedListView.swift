//
//  FeedListView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import SwiftUI

struct FeedListView: View {
	@ObservedObject var feedVM: FeedViewModel
	
	var body: some View {
		List {
			ForEach(feedVM.posts) { post in
				FeedListRow(post: post)
			}
			
			if feedVM.isLoading {
				LoaderView(isFailed: self.$feedVM.isRequestFailed)
					.onAppear(perform: feedVM.getPosts)
					.onTapGesture(perform: feedVM.getPosts)
			}
		}
		.listStyle(.plain)
	}
}

struct FeedListView_Previews: PreviewProvider {
	static var previews: some View {
		FeedListView(
			feedVM: .init(
				feedCoordinator: .init(
					tabsCoordinator: .init(
						user: User.previewUser,
						mainCoordinator: .init(
							user: User.previewUser,
							appCoordinator: .init()
						)
					)
				)
			)
		)
	}
}
