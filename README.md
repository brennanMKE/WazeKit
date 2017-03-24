# WazeKit

![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/WazeKit.svg)](https://img.shields.io/cocoapods/v/WazeKit.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/WazeKit.svg?style=flat)](http://cocoadocs.org/docsets/WazeKit)
[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=58d1e8cefc033600016bc85d&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/58d1e8cefc033600016bc85d/build/latest?branch=master)

Swift implementation of the Waze URL Schemes. See [Waze Developer Documention].

## Configurating Your App

It is necessary to add some details to your Info.plist so that your app is allowed to check if the URL for Waze can be opened. This is a new requirement as of iOS 9. See [LSApplicationQueriesSchemes] for more details.

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>waze</string>
</array>
```

## CocoaPods

[WazeKit] is available through [CocoaPods]. To install it, simply add the following line to your Podfile:

```ruby
pod 'WazeKit'
```

## Carthage

WazeKit can also be built using [Carthage]. 

Add the following line to your Cartfile:

```sh
github "brennanMKE/WazeKit"
```

You can also use [Swift Package Manager] if you like.

## Author

Brennan Stehling - 2017

---

[Waze Developer Documention]: https://www.waze.com/about/dev
[Change Log]: https://github.com/WazeKit/WazeKit/blob/master/CHANGELOG.md
[WazeKit]: https://github.com/WazeKit/WazeKit
[CocoaPods]: http://cocoapods.org
[Carthage]: https://github.com/carthage/carthage
[Swift Package Manager]: https://swift.org/package-manager/
[LSApplicationQueriesSchemes]: https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/LaunchServicesKeys.html#//apple_ref/doc/uid/TP40009250-SW14