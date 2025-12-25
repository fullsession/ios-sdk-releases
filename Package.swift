// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "FullSessionIos",
    platforms: [ .iOS(.v15) ],
    products: [ 
        .library(name: "FullSessionIos", targets: ["FullSessionIos"])
    ],
    targets: [
        .binaryTarget(
            name: "FullSessionIos",
            url: "https://ios-releases.fullsession.io/releases/FullSessionIos-0.1.6.xcframework.zip", 
            checksum: "e9d9416554c9b046fdb6d9cecf886afb10b31658e7f543412e16bd72d96dfea0"
        )
    ]
)
