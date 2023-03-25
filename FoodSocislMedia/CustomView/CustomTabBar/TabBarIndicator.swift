//
//  TabBarIndicator.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 25/03/2023.
//

import SwiftUI

struct TabBarIndicator: Shape {
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
		return Path(path.cgPath)
	}
}

struct TabBarIndicator_Previews: PreviewProvider {
	static var previews: some View {
		TabBarIndicator()
			.frame(width: 25, height: 5)
	}
}
