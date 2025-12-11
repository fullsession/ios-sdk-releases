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
            url: "https://ios-releases.fullsession.io/releases/FullSessionIos-0.1.2.xcframework.zip", 
            checksum: "f72500d3d24bf5593f0c15bd4553516618a6b668dffa316a3cfce48684615675"
        )
    ]
)
