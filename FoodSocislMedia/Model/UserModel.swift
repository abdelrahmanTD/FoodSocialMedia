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

extension User {
	/// Count of instances
	private static var count: Int = 0

	var profilePicture: String {
		let images: [String] = ["profile-1", "profile-2", "profile-3"]
		let index = User.count % images.count
		User.count += 1
		return images[index]
	}
}

#if DEBUG
extension User {
	static let previewUser = User(
		id: 1,
		username: "abdelrahman_99adm",
		email: "abdelrahman99adm@gmail.com",
		firstName: "Abdelrahman",
		lastName: "Talaat",
		gender: "Male"
	)
}
#endif
