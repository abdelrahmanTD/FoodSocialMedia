//
//  PostsModel.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 27/03/2023.
//

import Foundation

struct Posts: Decodable {
	let posts: [Post]
	let limit: Int
}

struct Post: Identifiable, Decodable {
	let id: Int
	let body: String
	let userId: Int
	
	var user: User?
}

extension Post {
	var publishedSince: String {
		// Random number of seconds - max 2 days.
		let timeInSeconds = Int.random(in: 1 ... 172_800)

		// Create a date from the number of seconds that generated.
		let calendar = Calendar.current
		let date = calendar.date(byAdding: .second, value: -timeInSeconds, to: Date())

		// Calculate the difference between current date and the published date
		let timeInterval = Date().timeIntervalSince(date!)

		// Format the calculated date and convert it to String
		let formattedString = Formatter.dateFormatter.string(from: timeInterval) ?? "0 sec"

		// Return formatted date
		return "\(formattedString) ago"
	}
}

#if DEBUG
extension Post {
	static let previewPost = Post(
		id: 1,
		body: "Craving something delicious? Try our new dish - a savory mix of roasted vegetables and quinoa, topped with a zesty garlic. Yum!",
		userId: 1,
		user: User.previewUser
	)
}
#endif
