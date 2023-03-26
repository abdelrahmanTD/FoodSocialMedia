//
//  AppCoordinator.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 22/03/2023.
//

import Foundation

/// The coordinator which responsible for the whole app.
final class AppCoordinator: ObservableObject, Coordinator {
	/// A property to detect if user logged in successfully or not.
	@Published var isLoggedIn : Bool = false
	/// A user who logged in.
	@Published var user: User?

	// MARK: - Coordinators

	/// The login coordinator instance.
	@Published var loginCoordinator: LoginCoordinator!
	/// The main coordinator instance.
	@Published var mainCoordinator: MainCoordinator?

	init() {
		self.loginCoordinator = LoginCoordinator(appCoordinator: self)
		self.loginCoordinator.delegate = self
	}

	/// Change the scenes if user logged in successfully, or logged out.
	func startNavigation() -> Void {
		if isLoggedIn {
			self.loginCoordinator = nil
			self.mainCoordinator = MainCoordinator(appCoordinator: self)
		} else {
			self.mainCoordinator = nil
			self.loginCoordinator = LoginCoordinator(appCoordinator: self)
			self.loginCoordinator.delegate = self
		}
	}
}

extension AppCoordinator: LoginCoordinatorDelegate {
	func loginCoordinatorDidFinishLoggingIn(_ coordinator: LoginCoordinator, withUser user: User) {
		self.isLoggedIn = true
		self.user = user
	}
}
