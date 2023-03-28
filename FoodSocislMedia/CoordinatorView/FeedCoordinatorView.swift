//
//  FeedCoordinatorView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 27/03/2023.
//

import SwiftUI

struct FeedCoordinatorView: View {
	@ObservedObject var feedCoordinator: FeedCoordinator

    var body: some View {
		NavigationView {
			VStack {
				// MARK: - Custom Navigation Bar
				CustomNavigationBar()

				FeedListView(feedVM: feedCoordinator.feedVM)
			}
		}
		.navigationBarHidden(true)
    }
}

struct FeedCoordinatorView_Previews: PreviewProvider {
	static let user = User.previewUser

    static var previews: some View {
		FeedCoordinatorView(
			feedCoordinator: .init(
				tabsCoordinator: .init(
					user: user,
					mainCoordinator: .init(
						user: user,
						appCoordinator: .init()
					)
				)
			)
		)
    }
}
