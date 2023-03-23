//
//  Endpoint.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

protocol Endpoint {
	var scheme: String { get }
	var host: String { get }
	var path: String { get }
}

extension Endpoint {
	var scheme: String { "https" }
	var host: String { "dummyjson.com" }
}
