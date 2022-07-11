// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Secp256k1Swift",
    products: [
        .library(
            name: "CSecp256k1",
            targets: ["CSecp256k1"]),
        .library(
            name: "Secp256k1Swift",
            targets: ["Secp256k1Swift"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CSecp256k1",
            dependencies: []),
        .target(
            name: "Secp256k1Swift",
            dependencies: ["CSecp256k1"]),
        .testTarget(
            name: "CSecp256k1Tests",
            dependencies: ["CSecp256k1"]),
        .testTarget(
            name: "Secp256k1SwiftTests",
            dependencies: ["Secp256k1Swift"])
    ]
)
