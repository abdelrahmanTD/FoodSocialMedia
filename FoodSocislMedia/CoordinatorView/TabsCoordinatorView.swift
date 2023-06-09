//
//  TabsCoordinatorView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 25/03/2023.
//

import SwiftUI

struct TabsCoordinatorView: View {
	@ObservedObject var tabsCoordinator: TabsCoordinator

    var body: some View {
		VStack {
			self.tabView(for: tabsCoordinator.selectedTab)

			// MARK: - Custom Tab Bar
			CustomTabBar(selectedTab: self.$tabsCoordinator.selectedTab)
				.padding(.bottom)
		}
		.onAppear { self.tabsCoordinator.startNavigation() }
		.onChange(of: self.tabsCoordinator.selectedTab) { _ in
			self.tabsCoordinator.startNavigation()
		}
    }

	@ViewBuilder
	private func tabView(for tab: TabBar) -> some View {
		switch tab {
			case .home:
				if let feedCoordinator = tabsCoordinator.feedCoordinator {
					FeedCoordinatorView(feedCoordinator: feedCoordinator)
				} else {
					ProgressView()
				}

			case .profile:
				if let profileVM = tabsCoordinator.profileVM {
					ProfileView(profileVM: profileVM)
				} else {
					ProgressView()
				}
				
			default: PlaceholderView(title: tab.rawValue.capitalized)
		}
	}
}

struct TabsCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
		TabsCoordinatorView(
			tabsCoordinator: .init(
				user: User.previewUser,
				mainCoordinator: .init(
					user: User.previewUser,
					appCoordinator: .init()
				)
			)
		)
    }
}
