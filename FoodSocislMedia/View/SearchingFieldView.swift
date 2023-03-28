//
//  SearchingFieldView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct SearchingFieldView: View {
	@Binding var isSearching: Bool
	@ObservedObject var searchVM: SearchViewModel

	var body: some View {
		HStack {
			TextField("Enter a word", text: $searchVM.searchingText)
				.submitLabel(.search)
				.onSubmit { searchVM.search() }

			Spacer()

			Button(action: {
				withAnimation {
					if searchVM.searchingText.isEmpty {
						self.isSearching = false
					} else {
						searchVM.searchingText = ""
						searchVM.posts = []
					}
				}
			}) {
				Image("close")
					.foregroundColor(Color(hexCode: "667085"))
			}
		}
	}
}
