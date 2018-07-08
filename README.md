# PreferencesManagerSwift

[![Swift version](https://img.shields.io/badge/Swift-4-orange.svg)](https://kotlinlang.org/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/illescasDaniel/PreferencesManagerSwift/blob/master/LICENSE)

A simple way to manage local values in your iOS apps.

Android version [here](https://github.com/illescasDaniel/PreferencesManagerKT). 

Setup
-----

Add your properties and default values inside the `PreferencesManager` class:
```swift
enum Properties {

    case username
    case password

    // It is highly recommended to add the default values too    
    var defaultvalue: Any {
        switch self {
        case .username: return "" as String
        case .password: return "" as String
        }
    }
}
```
Usage
-----

### Get saved values:

```swift
let savedUsername = PreferencesManager.standard[.username, default: "none"]
// or
let savedUsername = PreferencesManager.standard[.username] ?? ""
// or
let savedUsername: String = PreferencesManager.standard.valueOrDefault(for: .username)
```

In Swift 4.2 or above you can also use it like this:

```swift
let preferences = PreferencesManager.standard

if preferences.username == "Daniel" {
    print(preferences.password ?? "")
}
```

### **Set** values:

```swift
// When is only one
PreferencesManager.standard[.username] = "daniel"
// Optional for Swift 4.2 or above
PreferencesManager.standard.username = "daniel"

// Easier method when modifying multiple properties
PreferencesManager.standard.set ([
    .username: "daniel",
    .password: "1234"
])
```