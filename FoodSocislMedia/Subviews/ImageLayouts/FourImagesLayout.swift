//
//  FourImagesLayout.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct FourImagesLayout: View {
	let images: [String]

	private let columns: [GridItem] = [
		GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2)),
		GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2))
	]

	var body: some View {
		LazyVGrid(columns: columns, spacing: 5) {
			ForEach(images, id: \.self) { image in
				Image(image)
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.overlay {
						if images.count >= 4 {
							if image == images.last {
								Color.black.opacity(0.5)
								Text("+2")
									.font(.title)
									.fontWeight(.medium)
									.foregroundColor(.white)
							}
						}
					}
			}
		}
	}
}

struct FourImagesLayout_Previews: PreviewProvider {
    static var previews: some View {
		FourImagesLayout(images: ["post-6", "post-7", "post-8", "post-9"])
    }
}
