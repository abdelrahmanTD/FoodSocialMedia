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
	@Published var tab: TabBar = .home

	/// An instance of AppCoordinator.
	private weak var appCoordinator: AppCoordinator?

	init(appCoordinator: AppCoordinator) {
		self.appCoordinator = appCoordinator
	}

	func startNavigation() {}
}
