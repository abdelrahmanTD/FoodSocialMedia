//
//  AppCoordinator.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 22/03/2023.
//

import Foundation

final class AppCoordinator: ObservableObject, Coordinator {
	// A property to check if user logged in or not.
	//
	// According to that property the coordinator will decide which view will
	// appear to user.

	/// A property to detect if user logged in successfully or not.
	@Published var isLoggedIn : Bool = false

	func startNavigation() -> Void { }
}
