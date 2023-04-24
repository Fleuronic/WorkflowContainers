// Copyright © Fleuronic LLC. All rights reserved.

import UIKit
import WorkflowUI

public extension BackStack {
	typealias Item = Screen<AnyScreen>.Item

	struct Screen<ScreenType: WorkflowUI.Screen> {
		let items: [Item]

		public init(items: [Item]) {
			self.items = items
		}
	}
}

// MARK: -
extension BackStack.Screen: Screen {
	public func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
		BackStack.Container.description(for: self, environment: environment)
	}
}
