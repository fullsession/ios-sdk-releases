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
            url: "https://ios-releases.fullsession.io/releases/FullSessionIos-0.1.5.xcframework.zip", 
            checksum: "1e054fc1cb7649cad5b61606c9fa86167e2795800c907e2bb7bda2032c692bdd"
        )
    ]
)
