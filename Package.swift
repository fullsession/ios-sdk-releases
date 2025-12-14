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
            url: "https://ios-releases.fullsession.io/releases/FullSessionIos-0.1.3.xcframework.zip", 
            checksum: "06bc14fecdb132d22abf2a3f09d3d999a7656d31f17bc108c6737dbea0f8cd9c"
        )
    ]
)
