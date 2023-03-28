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
	case user(id: Int)
	case search
}

extension APIServiceEndpoint: Endpoint {
	public var path: String {
		switch self {
			case .login: return "/auth/login"
			case .posts: return "/posts"
			case .user(let id): return "/users/\(id)"
			case .search: return "/posts/search/"
		}
	}
}
