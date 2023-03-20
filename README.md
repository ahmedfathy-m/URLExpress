# URLExpress

[![CI Status](https://img.shields.io/travis/Ahmed%20Fathy/URLExpress.svg?style=flat)](https://travis-ci.org/Ahmed%20Fathy/URLExpress)
[![Version](https://img.shields.io/cocoapods/v/URLExpress.svg?style=flat)](https://cocoapods.org/pods/URLExpress)
[![License](https://img.shields.io/cocoapods/l/URLExpress.svg?style=flat)](https://cocoapods.org/pods/URLExpress)
[![Platform](https://img.shields.io/cocoapods/p/URLExpress.svg?style=flat)](https://cocoapods.org/pods/URLExpress)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange)](https://cocoapods.org/pods/URLExpress)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-Orange)](https://img.shields.io/badge/Swift-5.7-Orange)

**URLExpress** is a framework built on top of [**URLSession**](https://developer.apple.com/documentation/foundation/urlsession) to enable declarative syntax for URLRequests to reduce unwanted mutability and increase readability.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
    - [Cocoapods](#cocoapods)
    - [Swift Package Manager](#swift-package-manager)
- [Usage](#usage)
- [Documentation](https://github.com/ahmedfathy-m/URLExpress/blob/main/Documentation.md)
- [Developer](#developer)
- [License](#license)

## Features
- [x] Declarative Syntax
- [x] URL / JSON Parameter Encoding
- [x] Multipart Request Support
- [x] Easy Access for request's headers and parameters
- [x] Combine Support
- [x] Support for iOS 13.0+
- [x] Compatibility for [**Cocoapods**](https://cocoapods.org) and [**Swift Package Manager**](https://www.swift.org/package-manager/)
- [ ] [RxSwift]() support (coming soon)
- [ ] Tracking Upload/Download Progress
- [ ] HTTP Response Validation
- [ ] Network Reachability

## Requirements
- iOS 13.0 or higher
- If you're using reactive programming, stick with [Combine](https://developer.apple.com/documentation/combine) for now.
- Support for [RxSwift]() will be added in the future.

## Installation
### Cocoapods

URLExpress is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'URLExpress'
```
### Swift Package Manager
- You can access the package manager interface from `File` > `Add Package` and copying the repository link to the search bar `https://github.com/ahmedfathy-m/URLExpress.git` and press `Add Package` when you're done

- Alternatively, you can add **URLExpress** as a dependency by adding it to the `dependencies` value of your `Package.swift`.
```swift
dependencies: [
    .package(url: "https://github.com/ahmedfathy-m/URLExpress.git", .upToNextMajor(from: "0.1.0"))
]
```

## Usage
**URLExpress** allows you to chain multiple commands as you would in Combine or SwiftUI to produce declarative code that reduces unwanted mutability and side effects.
```swift
        URL(domain: "https://dummyjson.com", path: "auth/login")!
            .makeRequest(with: .post)
            .appendingTextField("username", value: "kminchelle")
            .appendingTextField("password", value: "0lelplR")
            .withContentType(.json)
            .withAcceptType(.json)
            .decodeJSONOnReceive(for: Login.self)
            .send {
                print($0)
            } success: {
                print("Welcome, \($0.firstName) \($0.lastName)")
            }
```

For detailed instructions on how to use **URLExpress** in multiple case check the [**documentation**](https://github.com/ahmedfathy-m/URLExpress/blob/main/Documentation.md).

## Developer

- **URLExpress** is developed and maintained by me personally.
- If you have any questions or suggestions about **URLExpress**, don't hesitate to send me an email: ahmedfathy.mha@gmail.com

## License

URLExpress is available under the MIT license. See the [LICENSE file](https://github.com/ahmedfathy-m/URLExpress/blob/main/LICENSE) for more info.
