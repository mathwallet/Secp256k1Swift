// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Secp256k1Swift",
    products: [
        .library(
            name: "Secp256k1Swift",
            targets: ["Secp256k1Swift"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Secp256k1Swift",
            dependencies: []),
        .testTarget(
            name: "Secp256k1SwiftTests",
            dependencies: ["Secp256k1Swift"]),
    ]
)
