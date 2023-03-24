//
//  FoodSocialMediaApp.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 20/03/2023.
//

import SwiftUI

@main
struct FoodSocialMediaApp: App {
	@State private var appCoordinator: AppCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
			ContentView(appCoordinator: self.appCoordinator)
        }
    }
}
