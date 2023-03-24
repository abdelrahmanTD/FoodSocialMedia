//
//  LoginView.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 20/03/2023.
//

import SwiftUI

struct LoginView: View {
	@ObservedObject var loginVM: LoginViewModel
	
    var body: some View {
		VStack(spacing: 24) {
			Image("login-image")
				.resizable()
				.aspectRatio(contentMode: .fill)

			Text("Welcome")
				.font(.title3)
				.fontWeight(.bold)
				.foregroundColor(.primaryColor)

			// MARK: - Login Credentials
			LoginCredentialsView(loginVM: self.loginVM)
				.padding(.horizontal)

			// MARK: - Login Button
			Button(action: {
				if loginVM.username.isEmpty || loginVM.password.isEmpty {
					self.loginVM.username = ""
					self.loginVM.password = ""
				} else {
					Task { try? await self.loginVM.singIn() }
				}
			}) {
				Text("Sign in")
					.foregroundColor(.white)
					.padding()
					.frame(maxWidth: .infinity)
			}
			.background(Color.primaryColor)
			.clipShape(Capsule())
			.padding(.horizontal)
			.padding(.top, 16)

			Spacer()
		}
		.edgesIgnoringSafeArea(.top)
		.keyboardAdaptive()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		LoginView(loginVM: .init(coordinator: .init(appCoordinator: .init())))
    }
}
