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
        .package(url: "https://github.com/MalyshevMaksim/CommonUI", from: "0.0.2"),
        .package(url: "https://https://github.com/SnapKit/SnapKit", from: "5.6.0"),
        .package(url: "https://github.com/amirdew/CollectionViewPagingLayout.git", from: "1.1.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.1.3")
    ],
    targets: [
        .target(
            name: "Intro",
            dependencies: ["CommonUI", "SnapKit", "CollectionViewPagingLayout", .product(name: "Lottie", package: "lottie-spm")]
        ),
        .testTarget(
            name: "IntroTests",
            dependencies: ["Intro"]
        ),
    ]
)
