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
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.primaryColor)

			// MARK: - Login Credentials
			LoginCredentialsView(loginVM: self.loginVM)
				.padding(.horizontal)

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
