// Copyright © Fleuronic LLC. All rights reserved.

import UIKit

public extension Bar.ButtonItem {
	enum Content {
		case text(String)
		case icon(UIImage)
		case spinner
		case back(title: String?)
	}
}
