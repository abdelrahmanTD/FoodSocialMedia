//
//  RequestDelegate.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import Foundation
import Combine

protocol RequestDelegate {
	func sendRequest<T>(
		from endpoint: Endpoint,
		method: HTTPMethod,
		headers: [String: String]?,
		body: [String: String]?,
		params: [String: String]?,
		model: T.Type
	) async throws -> T where T: Decodable

	func sendRequest<T>(
		from endpoint: Endpoint,
		params: [String: String]?,
		for model: T.Type
	) -> AnyPublisher<T, Error> where T: Decodable
}

extension RequestDelegate {
	/// Send a request for a retrieving a data from the server.
	///
	/// - Parameters:
	///   - endpoint: The request URL.
	///   - method: The type of HTTP method for the request.
	///   - headers: The headers of the request.
	///   - body: The body of the request.
	///   - params: The parameters for the request.
	///   - model: The model that response will decoded to.
	/// - Returns: A decoded model.
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
		urlComponents.host = endpoint.host
		urlComponents.path = endpoint.path

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

		// Creating the session, and sending the request.
		let (data, response) = try await URLSession.shared.data(for: urlRequest)

		// Check over the response.
		guard let response = response as? HTTPURLResponse else { throw RequestError.noResponse }
		guard (200 ..< 300) ~= response.statusCode else { throw RequestError.invalidResponse }

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

	func sendRequest<T>(
		from endpoint: Endpoint,
		params: [String: String]? = nil,
		for model: T.Type
	) -> AnyPublisher<T, Error> where T: Decodable {
		// Creating a full URL components.
		var urlComponents: URLComponents = URLComponents()
		urlComponents.scheme = endpoint.scheme
		urlComponents.host = endpoint.host
		urlComponents.path = endpoint.path

		// Adding query items if not nil.
		if let params {
			let queryItems = params
				.map { URLQueryItem(name: $0.key, value: $0.value) }

			urlComponents.queryItems = queryItems
		}

		guard let url = urlComponents.url else {
			print("No URL")
			return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
		}

		let request = URLRequest(url: url)
		print(url)

		return URLSession.shared.dataTaskPublisher(for: request)
			.map(\.data)
			.decode(type: T.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
}
