// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Secp256k1.swift",
    products: [
        .library(
            name: "Secp256k1.swift",
            targets: ["Secp256k1.swift"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Secp256k1.swift",
            dependencies: []),
        .testTarget(
            name: "Secp256k1.swiftTests",
            dependencies: ["Secp256k1.swift"]),
    ]
)
