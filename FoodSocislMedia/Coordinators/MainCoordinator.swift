//
//  MainCoordinator.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

/// The coordinator which responsible for the whole scenes
/// after user logged in successfully.
final class MainCoordinator: ObservableObject, Coordinator {
	/// An instance of TabsCoordinator
	@Published var tabsCoordinator: TabsCoordinator!

	/// The user who logged in
	private let user: User

	/// An instance of AppCoordinator.
	private weak var appCoordinator: AppCoordinator?

	init(user: User, appCoordinator: AppCoordinator) {
		self.user = user
		self.appCoordinator = appCoordinator
		self.tabsCoordinator = TabsCoordinator(user: self.user, mainCoordinator: self)
	}

	deinit {
		print(self, "is deallocated")
	}

	func startNavigation() {
		self.tabsCoordinator?.startNavigation()
	}
}

extension MainCoordinator: TabsCoordinatorDelegate {
	func tabsCoordinatorDidFinish(_ coordinator: TabsCoordinator) {
		print("User logged out")
		self.appCoordinator?.isLoggedIn.toggle()
	}
}
