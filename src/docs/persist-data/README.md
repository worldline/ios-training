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

## Codable saved in a file

A more advanced and powerful technique is to manually load and persist a Codable into a file. 
This technique is useful if you want to store complex objects (such as the state or model) in a JSON file.
There are two steps in this process, the first one consists of decoding / encoding the object from / into JSON using `JSONDecoder().decode` and `JSONEncoder().encode`.
The second step consists of loading / saving the encoded data and we can think of two ways to achieve this.
The first one consists of user defaults' `dataForKey:` to load the data and `setObject:ForKey` to persist it.
Another one consists of creating and managing a file by the developer using file APIs such as `fileHandle.availableData` to load the data from a file and `data.write` to save it.

## Sophisticated data persistence libraries

For storing data in a database or similar fashion, SQLite is available as a low level library
It is not recommended to use unless there is a performance concern of for very niche reason.
Instead, it is recommended to use libraries specialized in data persistence. Some can be assimilated to an ORM library (Object Relational Mapper).
The remainder of this section describes some of them. 

### Core Data

[Core Data](https://developer.apple.com/documentation/coredata) is the official library to "Persist or cache data on a single device, or sync data to multiple devices with CloudKit".
It existed since iOS 3 and Apple continuously updates it to keep it relevant.
It also has the reputation of having a steep learning curve, but it remains famous among developers.
It works similarly as an ORM where classes are mapped into tables.
Xcode provides a graphical editor that allow to specify the tables, the relations and generate the necessary code (in Swift or Objective-C).

![Core date editor](https://docs-assets.developer.apple.com/published/fbb9767e96/rendered2x-1622022015.png)

Even though Core Date existed before SwiftUI, Apple made sure that both of them can be used together.
This article shows [how to use Core Data in a SwiftUI project](https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui).

### Realm

[Realm](https://realm.io/) is a high level alternative to SQLite.
It can be seen as alternative to Core Data as they seem to provide a similar list of features.
Most notably, the possibility to store data locally or in the cloud.
The points where Realm wins is that the library seems simpler to learn and to use and that it is also available in Android.
However, please be careful about the pricing of the cloud storage.

### Firebase datastore (or any other cloud based storage)

As opposed to Realm and Core Data, which are local first databases, Firebase datastore is a cloud first database.
This means that Firebase Datastore requires an internet connection to store and load the data.
However, the library is simple to use and supports real time updates.

::: tip
Firebase datastore is part of a bigger suite of service called Firebase.
For example, we can *Firebase App Distribution* in Firebase, which is a service that allows to deploy and distribute apps without going the burden of using TestFlight.
:::

## PW: complete the official iOS persisting data tutorial

This PW shows how to save a codable in a manually managed file using JSON encoder and filesystem APIs.

[https://developer.apple.com/tutorials/app-dev-training/persisting-data](https://developer.apple.com/tutorials/app-dev-training/persisting-data)
