//
//  ImagesPreview.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

enum ImageLayout: Int {
	case one = 1
	case two
	case three
	case four
}

struct ImagesPreview: View {
	let layout: ImageLayout
	let images: [String]

	var body: some View {
		switch layout {
			case .one: SingleImageLayout(image: images[0])
			case .two: DoubleImagesLayout(images: images)
			case .three: ThreeImagesLayout(images: images)
			case .four: FourImagesLayout(images: images)
		}
	}
}

struct ImagesPreview_Previews: PreviewProvider {
    static var previews: some View {
		ImagesPreview(layout: .one, images: ["post-4"])
    }
}
