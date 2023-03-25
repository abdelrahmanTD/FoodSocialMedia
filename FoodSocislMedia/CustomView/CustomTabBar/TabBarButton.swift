//
//  TabBarButton.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 25/03/2023.
//

import SwiftUI

struct TabBarButton: View {
	let label: TabBar
	@Binding var selectedTab: TabBar

	var animation: Namespace.ID

    var body: some View {
        Button(action: {
			withAnimation {
				self.selectedTab = self.label
			}
		}) {
			VStack {
				// MARK: - Top Indicator
				ZStack {
					TabBarIndicator()
						.fill(.clear)

					if selectedTab == label {
						TabBarIndicator()
							.fill(Color.primaryColor)
							.matchedGeometryEffect(id: "tab_change", in: animation)
					}
				}
				.frame(width: 25, height: 5)

				// MARK: - Tab Icon
				Image(label.rawValue)
					.foregroundColor(selectedTab == label ? .primaryColor : .iconColor)
			}
		}
    }
}

struct TabBarButton_Previews: PreviewProvider {
	@Namespace static var animation

    static var previews: some View {
		TabBarButton(label: .home, selectedTab: .constant(.home), animation: animation)
    }
}
