import UIKit
import WorkflowUI

public extension Alert {
	struct Screen<BaseScreen: WorkflowUI.Screen> {
		let baseScreen: BaseScreen
		let alert: Alert?

		public init(
			baseScreen: BaseScreen,
			alert: Alert?
		) {
			self.baseScreen = baseScreen
			self.alert = alert
		}
	}
}

// MARK: -
extension Alert.Screen: Screen {
	public func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
		Alert.ViewController.description(for: self, environment: environment)
	}
}
