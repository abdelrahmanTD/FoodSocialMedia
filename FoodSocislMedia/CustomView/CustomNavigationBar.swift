//
//  CustomNavigationBar.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import SwiftUI

struct CustomNavigationBar: View {
	@Binding var isSearching: Bool
	@Binding var searchingText: String

	let searchAction: (() -> Void)?

	var body: some View {
		VStack {
			HStack {
				// MARK: - Logo
				if !isSearching {
					self.logo
				}

				HStack {
					Image("search")
						.foregroundColor(Color(hexCode: "344054"))
						.opacity(isSearching ? 0.8 : 1)
						.scaleEffect(isSearching ? 0.9 : 1)
						.onTapGesture {
							withAnimation { self.isSearching = true }
						}

					// MARK: - Searching Field
					if isSearching {
						SearchingFieldView(
							isSearching: self.$isSearching,
							searchingText: self.$searchingText
						)
						.onSubmit(of: .search, self.searchAction!)
					}
				}
				.padding(.horizontal)
				.padding(.vertical, 10)
				.background {
					RoundedRectangle(cornerRadius: 15)
						.stroke(self.isSearching ? Color(hexCode: "D0D5DD") : .clear, lineWidth: 2)
				}
			}
			.padding(.horizontal)

			Divider()
		}
	}

	// MARK: - Logo of the app.
	private var logo: some View {
		HStack {
			Text("LOGO")
				.font(.title2)
				.fontWeight(.bold)
				.foregroundStyle(
					LinearGradient(
						colors: [
							Color(hexCode: "4E60EB"),
							Color(hexCode: "C13BDB")
						],
						startPoint: .topLeading,
						endPoint: .bottomTrailing
					)
				)

			Spacer()
		}
	}
}

struct CustomNavigationBar_Previews: PreviewProvider {
	static var previews: some View {
		CustomNavigationBar(
			isSearching: .constant(false),
			searchingText: .constant(""),
			searchAction: nil
		)
	}
}
