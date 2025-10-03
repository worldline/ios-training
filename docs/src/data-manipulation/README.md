# Data manipulation

::: tip Estimated time
1/2 day
:::

## Http Client

Communicating with a REST API relies on multiple concepts that we'll cover briefly below:

- [JSON](https://www.json.org/json-en.html): a standard data interchange format used a lot in the HTTP messages of REST APIs.
- [REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api): it is a standard communication interface between a client and conforms to the constraints of REST architectural style. In a REST API, HTTP messages are stateless and use JSON data format.
- [HTTP messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages): an http message is a textual message that contains different parts and can be either a request or a response. A request is the HTTP message that the client sends to the server and response is the HTTP message that the server sends to the client in reaction to the request. Both requests and responses have a part called a *body*. In rest APIs, the body is generally formatted in JSON.
- [Codable](https://developer.apple.com/documentation/swift/codable): it is a type that can convert itself into and out of an external representation. It is equivalent to `Serializable` in Java. This type is helpful if we want to convert an object into an out of a JSON string.
- `async` and `await`: these keywords are used to call an asynchronous function using a synchronous coding fashion. This means that callbacks are needed no more!
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession): The official iOS HTTP client which is part of the Foundation library. This library is not part of the Swift standard library but there is an implementation for non-Apple platforms which is called [swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation).

A typical post request that send and receives a JSON body looks like this:

First, we define the request and response body objects that conform to `(En/De)Codable`. We also define the error enum that represents the different errors that can happen.

```swift
// Codable allows to serialize to JSON
struct RequestBody: Encodable {
  let prop: String
}

// Codable allows to deserialize to JSON
struct ResponseBody: Decodable {
  let prop: String
}

// Error enum to represent the different errors that can happen
enum AppError: Error {
  case incorrectUrl
  case encodingFailed
  case emptyResponseBody
  case decodingFailed(String)
}
````

Then, we define the function that sends the request and receives the response.

```swift
func postBody(requestBody: RequestBody) async -> Result<String, AppError> {
  // Create the URL object (which can fail if the string in not a valid URL for example)
  let url = URL(string: "https://.../api")
  guard let url else {
    return .failure(.incorrectUrl)
  }
  // Create the request object
  var request = URLRequest(url: url)
  // Set the method and some headers
  request.httpMethod = "POST"
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.setValue("application/json", forHTTPHeaderField: "Accept")
  // Encode the request body
  let encoded = try? JSONEncoder().encode(requestBody)
  guard let encoded else {
    return .failure(.encodingFailed)
  }
  // set the body of the request to a byte array (called Data in Swift)
  request.httpBody = encoded
  // Send the request and wait for the response. This return an optional tuple (data, response)?
  let responseTuple = try? await URLSession.shared.data(for: request)
  guard let responseTuple else {
    return .failure(.emptyResponseBody)
  }
  // Extract the data from the tuple if it is not nil
  let (data, _) = responseTuple
  // Decode the response body into a ResponseBody object
  let decoded = try? JSONDecoder().decode(ResponseBody.self, from: data)
  guard let decoded else {
    // Try to decode the data into a string to provide more information about the error
    let stringBody = String(data: data, encoding: .utf8)
    return .failure(.decodingFailed(stringBody ?? "Cannot decode to string"))
  }
  // Return the information we want from the decoded object or the whole object if needed
  return .success(decoded.prop)
}
```

Example of calling the function

```swift
let result = await postBody(requestBody: RequestBody(prop: "value"))
switch result {
case .success(let prop):
    print("Success: \(prop)")
case .failure(.decodingFailed(let responseBody)):
    // we can use the response body to understand what went wrong in case of decoding error
    print("Decoding Error: \(responseBody)")
case .failure(let error):
    print("Error: \(error)")
}
```

### Exercises

- [Please click on this link to view the exercise](https://swiftfiddle.com/oyn7ii7dvne37h5uqiqoti5xou)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/7fsyuiu5fzdwtj2dhenxx3x5xm)
:::

- Show a list of songs fetched from iTunes's API: [https://itunes.apple.com/search?term=bernard+minet&entity=song](https://itunes.apple.com/search?term=bernard+minet&entity=song)
    - You can use [jsonformatter.org](https://jsonformatter.org/) to format the response of the API and understand its structure.
    - A solution is provided by [hackingwithswift](https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui).

## Data persistence

Persisting data locally consists of keeping app data after the app has been killed and the variables removed from memory.
The persisted data offers many advantages.
We can use it to show initial data when the app starts and waits for the first batch data to be fetched from the server.
It can also be used to allow for offline app usage.

::: warning iOS isolates app data from other apps
For security reasons, each app is isolated from the rest of the apps.
This is called sandboxing.
[This article](https://medium.com/@dinesh.kachhot/different-ways-to-share-data-between-apps-de75a0a46d4a) shows the different ways that allow two or more apps to share their data
:::

There are many ways to persist data in SwiftUI that we cover below.

### UserDefaults

It is a very simple key-value storage that persists data in a file.
The API surface is very small and the developer does not need to manage the persisted file.
This makes this technique very efficient for simple storage use cases.
You can find a short [guide here](https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults).

Here is sample code that shows how to persist and load data.

```swift
UserDefaults.standard.set(self.tapCount, forKey: "Tap")
@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
```

### `Codable` saved in a file

A more advanced and powerful technique is to manually load and persist a `Codable` into a file.
This technique is useful if you want to store complex objects (such as the state or model) in a JSON file.
There are two steps in this process, the first one consists of decoding / encoding the object from / into JSON using `JSONDecoder().decode` and `JSONEncoder().encode`.
The second step consists of loading / saving the encoded data and we can think of two ways to achieve this.
The first one consists of user defaults' `dataForKey:` to load the data and `setObject:ForKey` to persist it.
Another one consists of creating and managing a file by the developer using file APIs such as `fileHandle.availableData` to load the data from a file and `data.write` to save it.

### Swift Data

Swift Data is a framework introduced by Apple since iOS 17.0 to simplify data management in Swift applications.
It inherits many concepts from Core Data (read more about Core Data below) but it is more straightforward to use.

This project shows an example of using [Swift Data in a SwiftUI application](https://github.com/worldline/ios-training/tree/main/samples/SwiftData-01.swiftpm).

### Data persistence libraries

For storing data in a database or similar fashion, SQLite is available as a low level library.
It is not recommended to use it unless there is a strong performance concern.
Instead, it is recommended to use libraries specialized in data persistence. Some can be assimilated to an ORM library (Object Relational Mapper).
The remainder of this section describes some of them.

::: warning Please be careful about the pricing of cloud storage
Sophisticated databases generally provide cloud storage to provide a complete offer.
If you're interested in storing data in the cloud, please take some time to read the pricing page to avoid any bad surprises when your app runs in production.
:::

#### Firebase datastore

Firebase datastore is a cloud first database.
This means that Firebase Datastore requires an internet connection to store and load the data.
However, the library is simple to use and supports real time updates.

::: tip
Firebase datastore is part of a bigger suite of service called Firebase.
For example, we can *Firebase App Distribution* in Firebase, which is a service that allows to deploy and distribute apps without going the burden of using TestFlight.
:::

#### Core Data (legacy)
 
[Core Data](https://developer.apple.com/documentation/coredata) is the official library to "Persist or cache data on a single device, or sync data to multiple devices with CloudKit".
It existed since iOS 3 and Apple continuously updates it to keep it relevant.
It also has the reputation of having a steep learning curve, but it remains famous among developers.

It works similarly as an ORM where classes are mapped into tables.
Xcode provides a graphical editor that allows to specify the tables, the relations and generate the necessary code (in Swift or Objective-C).

![Core date editor](https://docs-assets.developer.apple.com/published/fbb9767e96/rendered2x-1622022015.png)

Even though Core Date existed before SwiftUI, Apple made sure that both of them can be used together.
This article shows [how to use Core Data in a SwiftUI project](https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui).

#### Realm / Atlas Device (deprecated)

[Realm](https://realm.io/) is a high level alternative to SQLite.
It can be seen as alternative to Core Data as they seem to provide a similar list of features.
Most notably, the possibility to store data locally or in the cloud.
The points where Realm wins is that the library seems simpler to learn and to use and that it is also available in Android.

### PW: complete the official iOS persisting data tutorial

This PW shows how to save a `Codable` in a manually managed file using JSON encoder and filesystem APIs.

[https://developer.apple.com/tutorials/app-dev-training/persisting-data](https://developer.apple.com/tutorials/app-dev-training/persisting-data)
