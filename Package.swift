// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdwaitaUI",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        // Declarative UI framework for GNOME's Libadwaita. Inspired by Owlkettle and SwiftUI.
        .library(
            name: "AdwaitaUI",
            targets: ["AdwaitaUI"]
        ),
        // Imperative bindings for GNOME's Libadwaita.
        .library(
            name: "Libadwaita",
            targets: ["Libadwaita"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AdwaitaUI",
            dependencies: []
        ),
        .target(
            name: "Libadwaita",
            dependencies: [
                .target(name: "CLibadwaita"),
                .target(name: "CAdwHelper"),
            ]
        ),
        .systemLibrary(
            name: "CLibadwaita",
            pkgConfig: "libadwaita-1"
        ),
        .target(
            name: "CAdwHelper",
            dependencies: [.target(name: "CLibadwaita")]
        ),
        .testTarget(
            name: "AdwaitaUITests",
            dependencies: ["AdwaitaUI"]
        ),
        // TODO: (janvhs): Add a test target for Libadwaita
    ]
)
