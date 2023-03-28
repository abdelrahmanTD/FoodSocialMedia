//
//  SingleImageLayout.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct SingleImageLayout: View {
	let image: String

	var body: some View {
		Image(image)
			.resizable()
			.scaledToFit()
			.frame(maxWidth: .infinity)
	}
}

struct SingleImageLayout_Previews: PreviewProvider {
    static var previews: some View {
		SingleImageLayout(image: "post-4")
    }
}
