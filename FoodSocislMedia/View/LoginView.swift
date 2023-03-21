//
//  LoginView.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 20/03/2023.
//

import SwiftUI

struct LoginView: View {
	@StateObject private var loginVM: LoginViewModel = LoginViewModel()
	
    var body: some View {
		VStack(spacing: 24) {
			Image("login-image")
				.resizable()
				.aspectRatio(contentMode: .fit)

			Text("Welcome")
				.font(.title3)
				.fontWeight(.bold)
				.foregroundColor(.primaryColor)

			// MARK: - Login Credentials
			LoginCredentialsView(loginVM: self.loginVM)
				.padding(.horizontal)

			Button(action: {}) {
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
