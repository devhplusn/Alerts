# Alerts

[![Swift](https://img.shields.io/badge/Swift-5-orange.svg)](https://img.shields.io/badge/Swift-5-orange.svg)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-black?style=flat)](https://img.shields.io/badge/Platforms-iOS-black?style=flat)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/devhplusn/Alerts/blob/master/LICENSE)

Alerts is a library that handles UIAlertController using the Method Chain pattern.

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- Swift 5
- iOS 11.0+


## Installation

#### Swift Package Manager

You can use The Swift Package Manager to install Alerts by adding the proper description to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/devhplusn/Alerts.git", from: "1.0.0")
    ]
)
```

Then run swift package update.


#### Cocoapods

Alerts is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'Alerts', :tag => '1.0.0', :git => 'https://github.com/devhplusn/Alerts'
```


## Usage

> Alert Type

- Basic

```swift

Alert(title: "Title", message: "Message", tintColor: .black)
    .addAction("OK", style: .default, isEnabled: true, titleColor: .black) { controller in
        // you can handle here when user tapped this UIAlertAction
    }.addAction("Cancel", style: .cancel)
    .present(at: self)
```

- With textField

```swift

Alert(title: "Title", message: "Message", tintColor: .black)
    .addTextField { textField in
        // you can configuration textField.
    } textDidChange: { controller, textField in
        // you can handle it when the text of the textField changes.

    }.textFieldDidChange { controller, index in
        // you can handle it when the text of the textFields changes.

    }.addAction("OK", style: .default, isEnabled: true, titleColor: .black) { controller in
        // you can handle it when the user taps this UIAlertAction.

    }.addAction("Cancel", style: .cancel)
    .present(at: self)
```

> ActionSheet Type

```swift
ActionSheet(title: "Title", message: "Message")
    .addAction("OK", isEnabled: false) { controller in
        // you can handle here when user tapped this UIAlertAction
    }.addAction("Cancel", style: .cancel)
    .present(at: self)
```


## License

Alerts is available under the MIT license. See the [LICENSE][license] file for more info.


[license]: LICENSE
