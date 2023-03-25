//
//  CustomTabBar.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 25/03/2023.
//

import SwiftUI

struct CustomTabBar: View {
	private let tabs: [TabBar] = [.home, .shop, .discount, .gallery, .profile]

	@Binding var selectedTab: TabBar
	@Namespace var animation

    var body: some View {
		VStack(spacing: 0) {
			Divider()
			HStack(spacing: 0) {
				ForEach(tabs, id: \.self) { tab in
					// Tab Button
					TabBarButton(label: tab, selectedTab: self.$selectedTab, animation: animation)

					if tab != tabs.last { Spacer() }
				}
			}
			.padding(.horizontal, 30)
			.padding(.bottom)
			.background(.white)
		}
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
		CustomTabBar(selectedTab: .constant(.home))
			.previewLayout(.sizeThatFits)
    }
}
