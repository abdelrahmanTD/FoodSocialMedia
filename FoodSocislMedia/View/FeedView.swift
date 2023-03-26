//
//  FeedView.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 24/03/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
		NavigationView {
			VStack {
				// MARK: - Custom Navigation Bar
				CustomNavigationBar()

				ScrollView {
					LazyVStack {
						ForEach(0 ..< 100, id: \.self) { number in
							Text("\(number)")
								.font(.largeTitle)
						}
					}
				}
			}
		}
		.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
