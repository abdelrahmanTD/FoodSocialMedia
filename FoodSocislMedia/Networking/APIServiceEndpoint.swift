//
//  APIServiceEndpoint.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import Foundation

enum APIServiceEndpoint {
	case login
	case posts
}

extension APIServiceEndpoint: Endpoint {
	public var path: String {
		switch self {
			case .login: return "/auth/login"
			case .posts: return "/posts"
		}
	}
}
