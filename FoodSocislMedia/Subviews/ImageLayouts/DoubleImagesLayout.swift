//
//  DoubleImagesLayout.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct DoubleImagesLayout: View {
	let images: [String]

	var body: some View {
		HStack(spacing: 5) {
			ForEach(images, id: \.self) { image in
				Image(image)
					.resizable()
					.scaledToFit()
					.frame(maxWidth: .infinity)
			}
		}
	}
}

struct DoubleImagesLayout_Previews: PreviewProvider {
    static var previews: some View {
        DoubleImagesLayout(images: ["post-1", "post-1"])
    }
}
