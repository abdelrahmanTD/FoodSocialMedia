//
//  MainCoordinatorView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import SwiftUI

struct MainCoordinatorView: View {
	@ObservedObject var mainCoordinator: MainCoordinator

	init(mainCoordinator: MainCoordinator) {
		self.mainCoordinator = mainCoordinator
	}

	var body: some View {
		TabsCoordinatorView(tabsCoordinator: mainCoordinator.tabsCoordinator!)
			.edgesIgnoringSafeArea(.bottom)
			.onAppear { mainCoordinator.startNavigation() }
	}
}

struct MainCoordinatorView_Previews: PreviewProvider {
	static var previews: some View {
		MainCoordinatorView(mainCoordinator: .init(user: User.previewUser, appCoordinator: .init()))
	}
}
