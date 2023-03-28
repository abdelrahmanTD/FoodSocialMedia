//
//  LoaderView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import SwiftUI

struct LoaderView: View {
	@Binding var isFailed: Bool

    var body: some View {
		if isFailed {
			Text("Failed. Tap to retry.")
				.foregroundColor(.red)
				.padding()
		} else {
			ProgressView()
				.frame(maxWidth: .infinity)
		}
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
		List {
			LoaderView(isFailed: .constant(false))
		}
    }
}
