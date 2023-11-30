// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Adwaita",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Adwaita",
            targets: ["Adwaita"]
        ),
        .library(name: "Libadwaita", targets: ["Libadwaita"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Adwaita",
            dependencies: []
        ),
        .target(
            name: "Libadwaita",
            dependencies: [.target(name: "CLibadwaita")]
        ),
        .systemLibrary(
            name: "CLibadwaita",
            path: "Sources/CLibadwaita",
            pkgConfig: "libadwaita-1"
        ),
        .testTarget(
            name: "AdwaitaTests",
            dependencies: ["Adwaita"]
        ),
    ]
)
