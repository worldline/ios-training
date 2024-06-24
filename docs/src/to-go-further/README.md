# Going further

## Server side development

- Vapor is a Swift framework that allows to develop servers
- Install the Vapor cli `brew install vapor`
- Create a vapor project `vapor new hello-vapor -n`
- Run the server: cd `hello-vapor` and `swift run`

```sh
Building for debugging...
Build complete! (1.25s)
[ NOTICE ] Server starting on http://127.0.0.1:8080
```

- Test the server

```sh
➜  curl http://127.0.0.1:8080
It works!
➜ curl http://127.0.0.1:8080/hello
Hello, world!
```

## Advanced Swift

- [Swift actors](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/#Actors)
- [Swift 6 strict concurrency](https://developer.apple.com/documentation/Swift/AdoptingSwift6)
- [Attributes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/)
- [Macros allow to run actions on code at compile time](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/)

## Conclusion

This training was introduction on Swift and SwiftUI.
It just scratched the surface of developing for the Apple development.
There are many things that we didn't explore such as the accessibility, hardware features such as geolocation and the technical aspects of the developer account (certificates, provisioning profiles, etc.).

To go further, it is advised to watch the videos from Apple's [WWDC](https://developer.apple.com/videos/) (WorldWide Developer Conference - pronounced "dubdub dee cee").
There many other resources available online that you should pick and choose depending on the needs.
Here are some of them:

- [raywenderlich.com](https://www.raywenderlich.com/)
- [hackingwithswift.com](https://www.hackingwithswift.com/)
- [Swift playgrounds](https://developer.apple.com/swift-playgrounds/)
- [Official iOS App Dev Tutorials](https://developer.apple.com/tutorials/app-dev-training)
