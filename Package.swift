// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Intro",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Intro",
            targets: ["Intro"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MalyshevMaksim/CommonUI", from: "0.0.2")
    ],
    targets: [
        .target(
            name: "Intro",
            dependencies: ["CommonUI"]
        ),
        .testTarget(
            name: "IntroTests",
            dependencies: ["Intro"]
        ),
    ]
)
