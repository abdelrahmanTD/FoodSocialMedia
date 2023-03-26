//
//  CustomNavigationBar.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import SwiftUI

struct CustomNavigationBar: View {
    var body: some View {
		VStack {
			HStack {
				Text("LOGO")
					.font(.title2)
					.fontWeight(.bold)
					.foregroundStyle(
						LinearGradient(
							colors: [
								Color(hexCode: "4E60EB"),
								Color(hexCode: "C13BDB")
							],
							startPoint: .topLeading,
							endPoint: .bottomTrailing
						)
					)

				Spacer()

				Image("search")
					.foregroundColor(Color(hexCode: "344054"))
			}
			.padding()

			Divider()
		}
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
