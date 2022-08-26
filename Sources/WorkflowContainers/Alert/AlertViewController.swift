// Copyright © Fleuronic LLC. All rights reserved.

import UIKit
import Workflow
import WorkflowUI

extension Alert {
	final class ViewController<Screen: WorkflowUI.Screen>: ScreenViewController<Alert.Screen<Screen>> {
		private let baseScreenViewController: DescribedViewController

		private var alertController: UIAlertController?

		required init(
			screen: Alert.Screen<Screen>,
			environment: ViewEnvironment
		) {
			self.baseScreenViewController = DescribedViewController(screen: screen.baseScreen, environment: environment)
			super.init(screen: screen, environment: environment)
		}

		override func viewDidLoad() {
			super.viewDidLoad()

			addChild(baseScreenViewController)
			view.addSubview(baseScreenViewController.view)
			baseScreenViewController.didMove(toParent: self)
		}

		override func viewDidLayoutSubviews() {
			super.viewDidLayoutSubviews()
			baseScreenViewController.view.frame = view.bounds
		}

		override func screenDidChange(from previousScreen: Alert.Screen<Screen>, previousEnvironment: ViewEnvironment) {
			super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)
			baseScreenViewController.update(screen: screen.baseScreen, environment: environment)

			if let alert = screen.alert {
				guard alertController == nil else { return }
				let alertController = UIAlertController(alert)
				baseScreenViewController.present(alertController, animated: true)
				self.alertController = alertController
			} else  {
				baseScreenViewController.dismiss(animated: true)
				alertController = nil
			}
		}

		override var childForStatusBarStyle: UIViewController? {
			return baseScreenViewController
		}

		override var childForStatusBarHidden: UIViewController? {
			return baseScreenViewController
		}

		override var childForHomeIndicatorAutoHidden: UIViewController? {
			return baseScreenViewController
		}

		override var childForScreenEdgesDeferringSystemGestures: UIViewController? {
			return baseScreenViewController
		}

		override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
			return baseScreenViewController.supportedInterfaceOrientations
		}
	}
}

// MARK: -
private extension UIAlertController {
	convenience init(_ alert: Alert) {
		self.init(
			title: alert.title,
			message: alert.message,
			preferredStyle: .alert
		)

		alert.actions
			.map(UIAlertAction.init)
			.forEach(addAction)
	}
}

// MARK: -
private extension UIAlertAction {
	convenience init(_ alertAction: Alert.Action) {
		self.init(
			title: alertAction.title,
			style: .init(alertAction.style),
			handler: { _ in alertAction.handler() }
		)
	}
}

// MARK: -
private extension UIAlertAction.Style {
	init(_ style: Alert.Action.Style) {
		self.init(rawValue: style.rawValue)!
	}
}
