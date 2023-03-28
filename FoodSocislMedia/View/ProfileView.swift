//
//  ProfileView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI
import UIKit

struct ProfileView: View {
	@ObservedObject var profileVM: ProfileViewModel

	var body: some View {
		VStack(spacing: 20) {
			VStack(spacing: 10) {
				Image(profileVM.user.profilePicture)
					.resizable()
					.frame(width: 100, height: 100)

				Text(profileVM.user.username)
					.font(.headline)
					.foregroundColor(.gray)

				Text(profileVM.user.email)
					.font(.callout)
					.fontWeight(.medium)
					.foregroundColor(.gray)

				Text(profileVM.user.firstName + " " + profileVM.user.lastName)
					.font(.largeTitle)
					.fontWeight(.bold)
			}
			.padding(20)
			.background(.white)
			.cornerRadius(20)

			Button(action: self.profileVM.logout) {
				Text("Log Out")
					.font(.system(.title, design: .rounded))
					.fontWeight(.bold)
					.foregroundColor(.red)
					.frame(maxWidth: .infinity)
			}
			.padding(20)
			.background(.white)
			.cornerRadius(20)
			.padding()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.gray.opacity(0.5))
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView(
			profileVM: .init(
				user: .previewUser,
				tabsCoordinator: .init(
					user: .previewUser,
					mainCoordinator: .init(
						user: .previewUser,
						appCoordinator: .init()
					)
				)
			)
		)
		.previewLayout(.sizeThatFits)
	}
}
