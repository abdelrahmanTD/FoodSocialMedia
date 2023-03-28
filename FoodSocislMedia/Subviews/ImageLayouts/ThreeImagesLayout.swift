//
//  ThreeImagesLayout.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct ThreeImagesLayout: View {
	let images: [String]

	var body: some View {
		HStack(spacing: 5) {
			Image(images[0])
				.resizable()
				.aspectRatio(contentMode: .fill)
				.clipped()

			VStack(spacing: 5) {
				ForEach(images[1...], id: \.self) { image in
					Image(image)
						.resizable()
						.scaledToFill()
						.frame(maxWidth: .infinity)
				}
			}
			.frame(maxWidth: .infinity)
		}
		.frame(maxWidth: .infinity)
	}
}

struct ThreeImagesLayout_Previews: PreviewProvider {
    static var previews: some View {
        ThreeImagesLayout(images: ["post-1", "post-2", "post-3"])
    }
}
