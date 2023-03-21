//
//  LoginCredentialField.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 21/03/2023.
//

import SwiftUI

struct LoginCredentialField: View {
	let label: String
	let placeholder: String
	let isSecure: Bool

	@Binding var text: String
	@State private var isShow: Bool = false

	init(
		label: String,
		placeholder: String,
		isSecure: Bool = false,
		text: Binding<String>
	) {
		self.label = label
		self.placeholder = placeholder
		self.isSecure = isSecure
		self._text = text
	}

	var body: some View {
		VStack(alignment: .leading, spacing: 6) {
			Text(label)
				.fontWeight(.medium)

			ZStack(alignment: .trailing) {
				if !isSecure {
					TextField(placeholder, text: $text)
				} else {
					if isShow {
						TextField(placeholder, text: $text)
					} else {
						SecureField(placeholder, text: $text)
					}

					Image("eye")
						.onTapGesture { self.isShow.toggle() }
				}
			}
			.padding(.horizontal)
			.padding(.vertical, 10)
			.background {
				RoundedRectangle(cornerRadius: 5)
					.stroke(.gray, lineWidth: 1)
			}
		}
	}
}

struct LoginCredentialField_Previews: PreviewProvider {
    static var previews: some View {
		LoginView()

		LoginCredentialField(
			label: "Password",
			placeholder: "Enter your password",
			isSecure: true,
			text: .constant("")
		)
    }
}
