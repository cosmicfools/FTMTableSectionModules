// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleServices",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "ModuleServices", targets: ["ModuleServices"]),
        .library( name: "ModuleSnapshotServices", targets: ["ModuleSnapshotServices"]),
        .library(name: "ModuleGenericServices", targets: ["ModuleGenericServices"]),
    ],
    dependencies: [
        .package(name: "CombinationGenerator", url: "https://github.com/cosmicfools/CombinationGenerator", from: "0.2.3"),
    ],
    targets: [
        .target(
            name: "ModuleServices",
            dependencies: []),
        .target(
            name: "ModuleSnapshotServices",
            dependencies: ["CombinationGenerator", "ModuleServices"]),
        .target(
            name: "ModuleGenericServices",
            dependencies: ["ModuleServices"]),
        .testTarget(
            name: "ModuleServicesTests",
            dependencies: ["ModuleServices"]),
        .testTarget(
            name: "ModuleSnapshotServicesTests",
            dependencies: ["ModuleServices", "ModuleSnapshotServices"]),
        .testTarget(
            name: "ModuleGenericServicesTests",
            dependencies: ["ModuleServices", "ModuleGenericServices", "ModuleSnapshotServices"]),
    ]
)
