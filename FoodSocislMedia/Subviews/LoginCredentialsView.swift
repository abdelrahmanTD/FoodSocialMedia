//
//  LoginCredentialsView.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 21/03/2023.
//

import SwiftUI

struct LoginCredentialsView: View {
	@ObservedObject var loginVM: LoginViewModel

	@FocusState private var focusedField: FocusField?

	var body: some View {
		VStack(alignment: .leading, spacing: 24) {
			// MARK: - Username Field
			LoginCredentialField(
				label: "Username",
				placeholder: "Enter your user name",
				text: $loginVM.username
			)
			.textContentType(.username)
			.focused($focusedField, equals: .username)
			.onSubmit { focusedField = .password }

			// MARK: - Password Field
			LoginCredentialField(
				label: "Password",
				placeholder: "Enter your password",
				isSecure: true,
				text: $loginVM.password
			)
			.textContentType(.password)
			.focused($focusedField, equals: .password)
			.onSubmit {
				Task { try await self.loginVM.singIn() }
			}
		}
	}
}

// MARK: - Previews
struct LoginCredentialsView_Previews: PreviewProvider {
	static var previews: some View {
		LoginCredentialsView(loginVM: .init())
			.padding()
	}
}

// MARK: - FocusField Enum
extension LoginCredentialsView {
	private enum FocusField: Hashable {
		case username
		case password
	}
}
