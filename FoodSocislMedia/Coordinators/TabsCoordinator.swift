//
//  TabsCoordinator.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 25/03/2023.
//

import Foundation

// MARK: - App TabBar Icons
/// The available tabs in tab bar.
enum TabBar: String {
	case home
	case shop
	case discount
	case gallery
	case profile
}

// MARK: - Tabs Coordinator Delegate
protocol TabsCoordinatorDelegate: AnyObject {
	func tabsCoordinatorDidFinish(_ coordinator: TabsCoordinator)
}

// MARK: - TabsCoordinator
/// The coordinator which responsible for changing the view when changing a
/// the selected tab.
final class TabsCoordinator: ObservableObject, Coordinator {
	/// Selected tab from tab bar
	@Published var selectedTab: TabBar = .home

	/// The user who logged in
	private let user: User

	@Published var profileVM: ProfileViewModel!
	@Published var feedCoordinator: FeedCoordinator!

	weak var delegate: TabsCoordinatorDelegate?
	/// The instance of main coordinator.
	private weak var mainCoordinator: MainCoordinator?

	init(user: User, mainCoordinator: MainCoordinator) {
		self.user = user
		self.mainCoordinator = mainCoordinator
		self.delegate = mainCoordinator
	}

	deinit {
		print(self, "is deallocated")
	}

	func startNavigation() {
		// Based of selected tab, initialise corresponding tab coordinator
		switch selectedTab {
			case .home: self.feedCoordinator = FeedCoordinator(tabsCoordinator: self)
			case .profile: self.profileVM = ProfileViewModel(user: self.user, tabsCoordinator: self)
			default: return
		}
	}

	func logOut() {
		delegate?.tabsCoordinatorDidFinish(self)
	}
}
