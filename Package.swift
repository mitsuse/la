// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "La",
    targets: [
        .target(name: "La", dependencies: []),
        .testTarget(name: "LaTests", dependencies: ["La"])
    ],
    swiftLanguageVersions: [4]
)
