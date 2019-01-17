// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tyler.Action",
    products: [
        .library(name: "Tyler.Action", targets: ["Action"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IgorMuzyka/Type-Preserving-Coding-Adapter", .branch("master")),
    ],
    targets: [
        .target(name: "Action", dependencies: ["TypePreservingCodingAdapter"]),
    ]
)
