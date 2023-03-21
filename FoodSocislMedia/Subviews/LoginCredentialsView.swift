//
//  LoginCredentialsView.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 21/03/2023.
//

import SwiftUI

struct LoginCredentialsView: View {
	@ObservedObject var loginVM: LoginViewModel

    var body: some View {
		VStack(alignment: .leading, spacing: 24) {
			// MARK: - Username Field
			LoginCredentialField(
				label: "Username",
				placeholder: "Enter your user name",
				text: $loginVM.username
			)

			// MARK: - Password Field
			LoginCredentialField(
				label: "Password",
				placeholder: "Enter your password",
				isSecure: true,
				text: $loginVM.password
			)
		}
    }
}

struct LoginCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
		LoginCredentialsView(loginVM: .init())
			.padding()
    }
}
