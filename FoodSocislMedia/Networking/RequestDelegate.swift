//
//  RequestDelegate.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation

protocol RequestDelegate {
	func sendRequest<T>(
		from endpoint: Endpoint,
		method: HTTPMethod,
		headers: [String: String]?,
		body: [String: String]?,
		params: [String: String]?,
		model: T.Type
	) async throws -> T where T: Decodable
}

extension RequestDelegate {
	func sendRequest<T>(
		from endpoint: Endpoint,
		method: HTTPMethod = .get,
		headers: [String: String]? = nil,
		body: [String: String]? = nil,
		params: [String: String]? = nil,
		model: T.Type
	) async throws -> T where T: Decodable {
		// Creating a full URL components.
		var urlComponents: URLComponents = URLComponents()
		urlComponents.scheme = endpoint.scheme
		urlComponents.host = urlComponents.host
		urlComponents.path = urlComponents.path

		// Adding query items if not nil.
		if let params {
			let queryItems = params
				.map { URLQueryItem(name: $0.key, value: $0.value) }

			urlComponents.queryItems = queryItems
		}

		// Check if url is created correctly.
		guard let url = urlComponents.url else { throw RequestError.invalidURL }

		// Creating URL request.
		var urlRequest: URLRequest = URLRequest(url: url)
		// Assigning the request method
		urlRequest.httpMethod = method.description

		// Adding request headers if not nil
		if let headers {
			for header in headers {
				urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
			}
		}

		// Adding request body if not nil
		if let body {
			urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body)
		}

		print(urlRequest)

		// Creating the session, and sending the request.
		let (data, response) = try await URLSession.shared.data(for: urlRequest)

		// Check over the response.
		guard let response = response as? HTTPURLResponse else { throw RequestError.noResponse }
		guard (200 ..< 300) ~= response.statusCode else { throw RequestError.invalidResponse }

		print(response.statusCode)

		// Decoding returned JSON response.
		do {
			let decodedData = try JSONDecoder().decode(model, from: data)
			return decodedData
		} catch DecodingError.keyNotFound(let key, let context) {
			fatalError("Failed to decode \(model) from bundle due to missing key '\(key.stringValue)' not found - \(context.debugDescription)")
		} catch DecodingError.typeMismatch(let type, let context) {
			fatalError("Failed to decode \(model) from bundle due to type mismatch \(context.debugDescription) -- \(type)")
		} catch DecodingError.valueNotFound(let type, let context) {
			fatalError("Failed to decode \(model) from bundle to missing \(type) value - \(context.debugDescription)")
		} catch DecodingError.dataCorrupted(_) {
			fatalError("Failed to decode \(model) from bundle becuase it appears to be invalid JSON data")
		} catch {
			fatalError("Failed to decode \(model) from bundle: \(error.localizedDescription)")
		}
	}
}