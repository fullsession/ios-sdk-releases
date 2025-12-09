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
            url: "https://ios-releases.fullsession.io/releases/FullSessionIos-0.1.1.xcframework.zip", 
            checksum: "91f7c72bfa7751fb45b237af996048e62f1fde143480611f936419520636e660"
        )
    ]
)
