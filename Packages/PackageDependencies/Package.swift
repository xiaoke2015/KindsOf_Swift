// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PackageDependencies",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PackageDependencies",
            targets: ["PackageDependencies"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.10.2"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "8.5.0"),
//        .package(url: "https://github.com/marmelroy/Zip", from: "2.1.2"),
//        .package(url: "https://github.com/realm/realm-swift", from: "20.0.0"),
    ],
    targets: [
        .target(
            name: "PackageDependencies",
            dependencies: [
                "UMCommon",
                "UMDevice",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Kingfisher", package: "Kingfisher"),
//                .product(name: "Zip", package: "Zip"),
//                .product(name: "RealmSwift", package: "realm-swift"),
            ],
            linkerSettings: [
                // 声明依赖的系统 Framework 和动态库
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("Security"),
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("z"),       // 对应 libz.tbd
                .linkedLibrary("c++")      // 对应 libc++.tbd
            ]
        ),
        .binaryTarget(name: "UMCommon", path: "BinaryTargetLib/UMCommon.xcframework"),
        .binaryTarget(name: "UMDevice", path: "BinaryTargetLib/UMDevice.xcframework"),
    ]
)
