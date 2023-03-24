//
//  KeyboardAdaptive+Extension.swift
//  FoodSocislMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import SwiftUI

struct KeyboardAdaptive: ViewModifier {
	@State private var keyboardHeight: CGFloat = 0
	
	func body(content: Content) -> some View {
		content
			.padding(.bottom, keyboardHeight)
			.edgesIgnoringSafeArea(keyboardHeight > 0 ? .bottom : [])
			.onAppear(perform: {
				NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
					let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? CGRect()
					keyboardHeight = keyboardFrame.height
				}
				
				NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (_) in
					keyboardHeight = 0
				}
			})
	}
}

extension View {
	func keyboardAdaptive() -> ModifiedContent<Self, KeyboardAdaptive> {
		return modifier(KeyboardAdaptive())
	}
}
