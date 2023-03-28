//
//  LoginViewModel.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 21/03/2023.
//

import Foundation

final class LoginViewModel: ObservableObject, RequestDelegate {
	@Published var username: String = ""
	@Published var password: String = ""

	@Published var errorMessage: String = ""

	/// The login coordinator instance.
	private weak var loginCoordinator: LoginCoordinator?

	init(coordinator: LoginCoordinator) {
		self.loginCoordinator = coordinator
	}

	@MainActor
	/// Perform asynchronous login with then given login credentials.
	public func singIn() async throws {
		// Set the type of the request http methods.
		let requestMethod: HTTPMethod = .post
		// Set the headers of the request.
		let headers = ["Content-Type": "application/json"]
		// Set the data of the request body.
		let body = [
			"username": username,
			"password": password
		]

		do {
			// Sending the request with the http method, headers, and the body,
			// and assign the result to app coordinator user.
			self.loginCoordinator!.user = try await sendRequest(
				from: APIServiceEndpoint.login,
				method: requestMethod,
				headers: headers,
				body: body,
				model: User.self
			)

			// Call login coordinator startNavigation method to notify the app
			// to start changing the scene.
			self.loginCoordinator!.startNavigation()
			
		} catch RequestError.invalidURL {
			self.errorMessage = RequestError.invalidURL.errorMessage
		} catch RequestError.noResponse {
			self.errorMessage = RequestError.noResponse.errorMessage
		} catch RequestError.invalidResponse {
			self.errorMessage = RequestError.invalidResponse.errorMessage
		} catch {
			print(error.localizedDescription)
			self.errorMessage = RequestError.unknownError.errorMessage
		}
	}
}
