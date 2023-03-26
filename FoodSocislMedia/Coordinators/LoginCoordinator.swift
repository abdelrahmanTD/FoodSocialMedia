//
//  LoginCoordinator.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

protocol LoginCoordinatorDelegate: AnyObject {
	func loginCoordinatorDidFinishLoggingIn(_ coordinator: LoginCoordinator, withUser user: User)
}

/// The coordinator which response about login process.
final class LoginCoordinator: ObservableObject, Coordinator {
	@Published var loginVM: LoginViewModel!
	@Published var user: User?

	weak var delegate: LoginCoordinatorDelegate?
	private weak var appCoordinator: AppCoordinator?

	init(appCoordinator: AppCoordinator) {
		self.loginVM = LoginViewModel(coordinator: self)
		self.appCoordinator = appCoordinator
	}

	func startNavigation() {
		delegate?.loginCoordinatorDidFinishLoggingIn(self, withUser: self.user!)
	}
}
