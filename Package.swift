// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "WorkflowContainers",
    platforms: [
        .iOS(.v13)
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
		.package(url: "https://github.com/square/workflow-swift", from: "1.0.0-rc.1")
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
