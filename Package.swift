// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "WorkflowContainers",
    platforms: [
        .iOS(.v16)
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
		.package(url: "https://github.com/square/workflow-swift", branch: "tomb/swiftui-2023")
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
