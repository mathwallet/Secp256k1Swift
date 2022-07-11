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
            targets: ["Secp256k1Swift"]),
        .library(
            name: "BIP32Swift",
            targets: ["BIP32Swift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.4.1")
    ],
    targets: [
        .target(
            name: "CSecp256k1",
            dependencies: []),
        .target(
            name: "Secp256k1Swift",
            dependencies: ["CSecp256k1"]),
        .target(
            name: "BIP32Swift",
            dependencies: ["Secp256k1Swift", "BigInt", "CryptoSwift"]),
        .testTarget(
            name: "CSecp256k1Tests",
            dependencies: ["CSecp256k1"]),
        .testTarget(
            name: "Secp256k1SwiftTests",
            dependencies: ["Secp256k1Swift"]),
        .testTarget(
            name: "BIP32SwiftTests",
            dependencies: ["Secp256k1Swift","BIP32Swift"]),
    ]
)
