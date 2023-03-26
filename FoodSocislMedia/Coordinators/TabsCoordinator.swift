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

// MARK: - TabsCoordinator
/// The coordinator which responsible for changing the view when changing a
/// the selected tab.
final class TabsCoordinator: ObservableObject, Coordinator {
	/// Selected tab from tab bar
	@Published var selectedTab: TabBar = .home

	/// The user who logged in
	private let user: User

	// MARK: - Coordinators

	/// The instance of main coordinator.
	private weak var mainCoordinator: MainCoordinator?

	// Tabs Coordinator

	init(user: User, mainCoordinator: MainCoordinator) {
		self.user = user
		self.mainCoordinator = mainCoordinator
	}

	deinit {
		print(self, "is deallocated")
	}

	func startNavigation() {
		// Based of selected tab, initialise corresponding tab coordinator
	}
}
