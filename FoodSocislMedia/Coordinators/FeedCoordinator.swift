//
//  FeedCoordinator.swift
//  FoodSocialMedia
//
//  Created by Abdelrahman Abo Al Nasr on 28/03/2023.
//

import Foundation

final class FeedCoordinator: ObservableObject, Coordinator {
	@Published var isSearching: Bool = false
	@Published var searchingText: String = ""
	
	@Published var feedVM: FeedViewModel!
	@Published var searchVM: SearchViewModel!

	private weak var tabsCoordinator: TabsCoordinator?

	init(tabsCoordinator: TabsCoordinator) {
		self.tabsCoordinator = tabsCoordinator
		self.feedVM = FeedViewModel(feedCoordinator: self)
		self.searchVM = SearchViewModel(feedCoordinator: self)
	}

	deinit {
		print(self, "is deallocated")
	}

	func startNavigation() {
		
	}
}
