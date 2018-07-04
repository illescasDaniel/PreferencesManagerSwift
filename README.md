# PreferencesManagerSwift

[![Swift version](https://img.shields.io/badge/Swift-4-orange.svg)](https://kotlinlang.org/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/illescasDaniel/PreferencesManagerKT/blob/master/LICENSE)

A simple way to manage local values in your iOS apps.

Android version [here](https://github.com/illescasDaniel/PreferencesManagerKT). 

Setup
-----

Add your properties inside the `PreferencesManager` class:
```swift
enum Properties {
    case username
    case password
    // ...
}
```
Usage
-----

### Get saved values:

```swift
let savedUsername = PreferencesManager.shared[.username, default: ""]
// or
let savedUsername = PreferencesManager.shared[.username] ?? ""
```

In Swift 4.2 or above you can also use it like this:

```swift
if PreferencesManager.shared.username == "Daniel" { }
print(PreferencesManager.shared.password ?? "")
```

### **Set** values:

```swift
// When is only one
PreferencesManager.shared[.username] = "daniel"
// Optional for Swift 4.2 or above
PreferencesManager.shared.username = "daniel"

// Easier method when modifying multiple properties
PreferencesManager.shared.set ([
    .username: "daniel",
    .password: "1234"
])
```