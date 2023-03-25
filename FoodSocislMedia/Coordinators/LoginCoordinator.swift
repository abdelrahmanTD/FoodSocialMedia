//
//  LoginCoordinator.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

/// The coordinator which response about login process.
final class LoginCoordinator: ObservableObject, Coordinator {
	@Published var loginVM: LoginViewModel!
	@Published var user: User?

	private weak var appCoordinator: AppCoordinator?

	init(appCoordinator: AppCoordinator) {
		self.loginVM = LoginViewModel(coordinator: self)
		self.appCoordinator = appCoordinator
	}

	func startNavigation() {
		// When user logged in change isLoggedIn flag in app coordinator to
		// true, in order to change the scene.
		appCoordinator!.isLoggedIn = true
		// Passing the user data who logged in to the app coordinator.
		appCoordinator!.user = self.user
	}
}
