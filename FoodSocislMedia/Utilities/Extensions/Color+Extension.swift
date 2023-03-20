//
//  Color+Extension.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 20/03/2023.
//

import SwiftUI

extension Color {
	/// Initialize a new Color from its hexadecimal code.
	///
	/// - Parameters:
	///   - colorSpace: The color space which color will be rendered in.
	///   - hexCode: Color hexadecimal code that will be converted to rgb values.
	///
	/// - Note: If you are going to use this color often in the project, it's better to add the color to the project assets.
	public init(
		_ colorSpace: Color.RGBColorSpace = .displayP3,
		hexCode: String
	) {
		let scanner = Scanner(string: hexCode)
		var rgbValues: UInt64 = 0
		scanner.scanHexInt64(&rgbValues)

		let r = (rgbValues & 0xff0000) >> 16
		let g = (rgbValues & 0xff00) >> 8
		let b = rgbValues & 0xff

		self.init(
			colorSpace,
			red: Double(r) / 255,
			green: Double(g) / 255,
			blue: Double(b) / 255
		)
	}
}
