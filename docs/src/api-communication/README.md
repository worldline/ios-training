# Communicate with a REST API

## Some useful concepts

Communicating with a REST API relies on multiple concepts that we'll cover briefly below:

- [JSON](https://www.json.org/json-en.html): a standard data interchange format used a lot in the HTTP messages of REST APIs.
- [REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api): it is a standard communication interface between a client and conforms to the constraints of REST architectural style. In a REST API, HTTP messages are stateless and use JSON data format.
- [HTTP messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages): an http message is a textual message that contains different parts and can be either a request or a response. A request is the HTTP message that the client sends to the server and response is the HTTP message that the server sends to the client in reaction to the request. Both requests and responses have a part called a *body*. In rest APIs, the body is generally formatted in JSON.
- [Codable](https://developer.apple.com/documentation/swift/codable): it is a type that can convert itself into and out of an external representation. It is equivalent to `Serializable` in Java. This type is helpful if we want to convert an object into an out of a JSON string.
- `async` and `await`: these keywords are used to call an asynchronous function using a synchronous. This means that no more callbacks are needed !
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession): The official iOS HTTP client which is part of the Foundation library. This library is not part of the Swift standard library but there is an implementation for non-Apple platforms which is called [swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation).

## PW: call a REST API

This PW relies on the [excellent tutorial from hackingwithswift](https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui).
It guides you on how to fetch JSON data from [iTunes's API](https://itunes.apple.com/search?term=taylor+swift&entity=song).
Please find and excerpt of the response body below.

```json
{
   "resultCount":50,
   "results":[
      {
         "wrapperType":"track",
         "kind":"song",
         "artistId":159260351,
         "collectionId":1440913923,
         "trackId":1440914010,
         "artistName":"Taylor Swift",
         "collectionName":"Taylor Swift (Bonus Track Version)",
         "trackName":"Our Song",
         "collectionCensoredName":"Taylor Swift (Bonus Track Version)",
      }
   ]
}
```