//
//  SearchListView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct SearchListView: View {
	@ObservedObject var searchVM: SearchViewModel

    var body: some View {
		List {
			ForEach(searchVM.posts) { post in
				FeedListRow(post: post, word: searchVM.searchingText)
					.padding(.vertical)
			}

			if searchVM.posts.isEmpty {
				EmptyView()
			} else {
				LoaderView(isFailed: self.$searchVM.isRequestFailed)
					.onAppear(perform: searchVM.search)
					.onTapGesture(perform: searchVM.search)
			}
		}
		.listStyle(.plain)
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(
			searchVM: .init(
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
