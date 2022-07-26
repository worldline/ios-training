# Locally persisting data

Persisting data locally consists of storing data after the app has been killed and the variables removed from memory.
The persisted data offers many advantages.
We can use it to show initial data when the app starts and waits for the first batch data to be fetched from the server.
It can also be used to allow for offline app usage.

There are many to persist data in SwiftUI:

## UserDefaults

It is a very simple key-value storage that persists in a file. 
The API surface is very small and the developer does not need to manage the persisted file. 
This makes this technique very efficient for simple storage use cases. 
You can find a short [guide here](https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults). 

Here is sample code that shows how to persist and load data.

```swift
UserDefaults.standard.set(self.tapCount, forKey: "Tap")
@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
```

## Codable with manually managed file 

A more advanced and powerful technique is to manually load and persist a codable into a file.

## Sophisticated database management systems

### Core Data

### Realm

### Firebase datastore (or any other cloud based storage)


## PW: complete the official iOS persisting data tutorial

https://developer.apple.com/tutorials/app-dev-training/persisting-data
