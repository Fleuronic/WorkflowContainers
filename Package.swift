// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WorkflowContainers",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "WorkflowContainers",
            targets: [
				"WorkflowContainers"
			]
		)
    ],
    dependencies: [
        .package(url: "https://github.com/Fleuronic/workflow-swift", branch: "main")
	],
    targets: [
        .target(
            name: "WorkflowContainers",
			dependencies: [
				.product(name: "WorkflowUI", package: "workflow-swift")
			]
		)
    ]
)
