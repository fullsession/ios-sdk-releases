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
            url: "https://ios-releases.fullsession.io/releases/FullSessionIos-0.1.4.xcframework.zip", 
            checksum: "5e99c4e0fdeac464a43de9c17b1fff7c96f1824db4aedb7760d0e72a6e0e3f30"
        )
    ]
)
