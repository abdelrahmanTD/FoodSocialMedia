//
//  ProfileViewModel.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import Foundation

final class ProfileViewModel: ObservableObject {
	@Published var user: User!

	private weak var tabsCoordinator: TabsCoordinator?

	init(user: User, tabsCoordinator: TabsCoordinator) {
		self.user = user
		self.tabsCoordinator = tabsCoordinator
	}

	func logout() {
		tabsCoordinator!.logOut()
	}

}
