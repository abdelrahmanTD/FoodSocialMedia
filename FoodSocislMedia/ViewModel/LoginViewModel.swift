//
//  LoginViewModel.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 21/03/2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
	@Published var username: String = ""
	@Published var password: String = ""
}
