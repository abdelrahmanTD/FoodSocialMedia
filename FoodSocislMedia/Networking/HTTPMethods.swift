//
//  HTTPMethods.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

enum HTTPMethod: String {
	case post
	case get
	case put
	case delete

	var description: String {
		rawValue.uppercased()
	}
}
