// Copyright © Fleuronic LLC. All rights reserved.

extension BackStack.Screen {
	public struct Item {
		let key: AnyHashable
		let screen: ScreenType
		let barVisibility: Bar.Visibility
	}
}

// MARK: -
public extension BackStack.Screen.Item {
	init<Key: Hashable>(
		key: Key? = AnyHashable?.none,
		screen: ScreenType,
		barContent: Bar.Content = .init()) {
		self.screen = screen

		if let key {
			self.key = .init(key)
		} else {
			self.key = .init(ObjectIdentifier(ScreenType.self))
		}

		barVisibility = .visible(barContent)
	}
}
