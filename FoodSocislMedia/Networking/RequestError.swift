//
//  RequestError.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

enum RequestError: Error {
	case invalidURL
	case noResponse
	case invalidResponse
	case unknownError
}

extension RequestError {
	public var errorMessage: String {
		switch self {
			case .invalidURL: return "Request URL is not correct."
			case .noResponse: return "No response from the server."
			case .invalidResponse: return "Response is not valid."
			case .unknownError: return "Unknown error occurred."
		}
	}
}
