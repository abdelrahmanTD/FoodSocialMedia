//
//  UserModel.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

struct User: Identifiable, Decodable {
	let id: Int
	let username: String
	let email: String
	let firstName: String
	let lastName: String
	let gender: String
}
