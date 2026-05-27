// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_sharing_intent",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(
            name: "flutter_sharing_intent",
            targets: ["flutter_sharing_intent"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "flutter_sharing_intent",
            dependencies: [],
            resources: [
                .process("../../Resources/PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
