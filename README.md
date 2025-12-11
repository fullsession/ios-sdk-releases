# FullSessionIos

**Version:** 0.1.2  
**Date:** 2025-12-11

## Installation

### Option 1: Xcode
1. Open your project.
2. Navigate to **File > Add Package Dependencies...**
3. Paste the Repository URL:
   `https://github.com/fullsession/ios-sdk-releases`
4. Select Version: **0.1.2** (or "Up to Next Major")

### Option 2: Swift Package Manager
Add the following to your `Package.swift` manifest:

```swift
dependencies: [
    .package(url: "https://github.com/fullsession/ios-sdk-releases", from: "0.1.2")
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

## Initialization

Before using FullSession, initialize it with your configuration:

```swift
import FullSessionIos
```

```swift
let config = FullSessionConfig(
    customerId: "your-customer-id",
    siteUrl: "https://yoursite.com"
)

FullSession.shared.initRecording(config: config)
```

### FullSessionConfig

Configuration object for initializing FullSession.

**Parameters:**
- `customerId` (String): Your unique customer identifier
- `siteUrl` (String): The URL the your site you want the sessions to be recorded on

**Example:**

```swift
let config = FullSessionConfig(
    customerId: "customer-123",
    siteUrl: "https://myapp.com"
)
```

---

## Core Methods

### `identify(userInfo:)`

Identify the current user with metadata. Use this method when a user logs in or when you want to associate session data with a specific user.

**Signature:**
```swift
public func identify(userInfo: IdentifyUserMetaEventData) async
```

**Parameters:**
- `userInfo` ([IdentifyUserMetaEventData](#identifyusermetaeventdata)): User identification information

**Example:**

```swift
let userInfo = IdentifyUserMetaEventData(
    username: "john_doe",
    name: "John Doe",
    email: "john.doe@example.com"
)

await FullSession.shared.identify(userInfo: userInfo)
```

---

### `setSessionAttributes(attributes:)`

Set custom attributes for the entire session. These attributes persist across all pages/screens in the current session.

**Signature:**
```swift
public func setSessionAttributes(attributes: AttributeMap) async
```

**Parameters:**
- `attributes` ([AttributeMap](#attributemap)): Key-value pairs of session-level attributes

**Example:**

```swift
let sessionAttrs: AttributeMap = [
    "plan": .string("premium"),
    "trial_days_left": .int(14),
    "is_beta_user": .bool(true),
    "session_score": .double(4.5)
]

await FullSession.shared.setSessionAttributes(attributes: sessionAttrs)
```

**Use Cases:**
- User subscription tier
- A/B test variants
- Feature flags
- Session-level metadata

---

### `setPageAttributes(attributes:)`

Set custom attributes for the current page/screen. These attributes are specific to the current view and reset when navigating to a new page.

**Signature:**
```swift
public func setPageAttributes(attributes: AttributeMap) async
```

**Parameters:**
- `attributes` ([AttributeMap](#attributemap)): Key-value pairs of page-level attributes

**Example:**

```swift
let pageAttrs: AttributeMap = [
    "page_name": .string("Product Details"),
    "product_id": .string("prod-12345"),
    "category": .string("Electronics"),
    "price": .double(299.99),
    "in_stock": .bool(true)
]

await FullSession.shared.setPageAttributes(attributes: pageAttrs)
```

**Use Cases:**
- Content metadata
- Product information
- Page-specific context

---

### `event(name:data:)`

Track custom events with associated data. Use this for tracking user actions, business events, or any custom analytics.

**Signature:**
```swift
public func event(name: String, data: CustomEventData) async
```

**Parameters:**
- `name` (String): The name of the event (e.g., "button_clicked", "purchase_completed")
- `data` ([CustomEventData](#customeventdata)): Key-value pairs of event-specific data

**Example:**

```swift
let eventData: CustomEventData = [
    "button_id": .string("checkout_btn"),
    "items_count": .int(3),
    "cart_total": .double(149.97)
]

await FullSession.shared.event(name: "checkout_initiated", data: eventData)
```

**Common Event Examples:**

```swift
// User action
await FullSession.shared.event(
    name: "video_played",
    data: [
        "video_id": .string("vid-789"),
        "duration": .int(120),
        "quality": .string("1080p")
    ]
)

// Business event
await FullSession.shared.event(
    name: "purchase_completed",
    data: [
        "order_id": .string("order-456"),
        "amount": .double(99.99),
        "currency": .string("USD"),
        "items": .int(2)
    ]
)

// Error tracking
await FullSession.shared.event(
    name: "api_error",
    data: [
        "endpoint": .string("/api/users"),
        "status_code": .int(500),
        "error_message": .string("Internal server error")
    ]
)
```

---

## Data Types

### IdentifyUserMetaEventData

User identification information passed to the `identify()` method.

**Properties:**
- `username` (String): The user's username or unique identifier
- `name` (String): The user's full name
- `email` (String): The user's email address

**Example:**

```swift
let userInfo = IdentifyUserMetaEventData(
    username: "john_doe",
    name: "John Doe",
    email: "john.doe@example.com"
)
```

---

### AttributeMap

A dictionary-like structure for setting attributes. Supports multiple value types.

**Supported Value Types:**
- `.string(String)` - Text values
- `.int(Int)` - Integer numbers
- `.double(Double)` - Decimal numbers
- `.bool(Bool)` - Boolean values

**Usage:**

```swift
let attributes: AttributeMap = [
    "key1": .string("value"),
    "key2": .int(42),
    "key3": .double(3.14),
    "key4": .bool(true)
]

// Access values
attributes["key1"] // Optional<AttributeValue>
```

---

### CustomEventData

A dictionary-like structure for event data. Similar to AttributeMap but without boolean support.

**Supported Value Types:**
- `.string(String)` - Text values
- `.int(Int)` - Integer numbers
- `.double(Double)` - Decimal numbers

**Usage:**

```swift
let eventData: CustomEventData = [
    "action": .string("click"),
    "count": .int(1),
    "timestamp": .double(Date().timeIntervalSince1970)
]
```

## Details
- **Minimum iOS:** 15.0
- **Minimum Swift:** 6.0
