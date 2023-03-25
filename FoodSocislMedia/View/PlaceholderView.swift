//
//  PlaceholderView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 25/03/2023.
//

import SwiftUI

struct PlaceholderView: View {
	let title: String

	var body: some View {
		Text(title)
			.font(.largeTitle)
			.fontWeight(.black)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

struct PlaceholderView_Previews: PreviewProvider {
	static var previews: some View {
		PlaceholderView(title: "Shop")
	}
}
