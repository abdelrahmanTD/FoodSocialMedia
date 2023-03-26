//
//  ContentView.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 20/03/2023.
//

import SwiftUI

/// The main coordinator view in the app, and responsible for changing views
/// after user has been authenticated successfully.
struct ContentView: View {
	@EnvironmentObject private var appCoordinator: AppCoordinator
	
    var body: some View {
		Group {
			if appCoordinator.isLoggedIn {
				if let mainCoordinator = appCoordinator.mainCoordinator {
					MainCoordinatorView(mainCoordinator: mainCoordinator)
				} else {
					// Show ProgressView until main coordinator finish
					// initialisation
					ProgressView()
				}
			} else {
				LoginView(loginVM: appCoordinator.loginCoordinator.loginVM)
			}
		}
		.onChange(of: self.appCoordinator.isLoggedIn) { _ in
			self.appCoordinator.startNavigation()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
			.environmentObject(AppCoordinator())
    }
}
