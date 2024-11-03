// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "general-types",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
    .visionOS(.v1)
  ],
  products: [
    .library(name: "AsyncStreamTypes", targets: ["AsyncStreamTypes"]),
    .library(name: "DebuggingTypes", targets: ["DebuggingTypes"])
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "AsyncStreamTypes"),
    .target(name: "DebuggingTypes"),
    .testTarget(
      name: "AsyncStreamTypesTests",
      dependencies: [
        "AsyncStreamTypes",
      ]
    ),
  ]
)
