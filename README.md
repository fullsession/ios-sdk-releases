# FullSessionIos

**Version:** 0.1.1  
**Date:** 2025-12-09

## Installation

### Option 1: Xcode
1. Open your project.
2. Navigate to **File > Add Package Dependencies...**
3. Paste the Repository URL:
   `https://github.com/fullsession/ios-sdk-releases`
4. Select Version: **0.1.1** (or "Up to Next Major")

### Option 2: Swift Package Manager
Add the following to your `Package.swift` manifest:

```swift
dependencies: [
    .package(url: "https://github.com/fullsession/ios-sdk-releases", from: "0.1.1")
],
targets: [
    .target(
        name: "<YOUR_TARGET_NAME>",
        dependencies: [
            .product(name: "FullSessionIos", package: "FullSessionIos")
        ]
    )
]
```

## Artifact Details
- **Minimum iOS:** 15.0
- **Minimum Swift:** 6.0
