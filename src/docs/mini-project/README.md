# Mini project

The final chapter of this training will ask you to create a SwiftUI app from scratch.

## Requirements

The app consists of a movie explorer app with the following features:

- Search for movies by title.
- View the details of the selected movie.
- The app requires the user to be logged in.
- The app allows a new user to register.
- The app remembers the logged in user after a restart.
- The app uses [this API](https://vue-js-backend.herokuapp.com/api-docs/#/) for the authenticating and searching for movies (an empty search string returns all the movies).
  - The **/movies/search** endpoint requires to pass the token retrieved from endpoint **/user/login** or **user/register** with this header: `Authorization: Bearer \(userResponse.token)`
- (Optional) The result of previous queries is locally cached.

::: danger
Do not use the Playground app as it does not work well with SwiftUI + Swift Concurrency (async await)
:::

## Hints

- There many techniques to handle the flow from the login view to the movie list view.
On of them is to rely on a logged state.
The following show broadly how if looks like. 

```swift
struct ContentView: View {
    @State var loggedIn: false
    
    var body: some View {
        if loggedIn {
            MovieListView()
        } else {
            LoginView { newLoggedIn in
                loggedIn = newLoggedIn
            }
        }
    }
}
```

- In the login view, use an enum to track the state of the login view so that you can disable the login button when a request is running.

```swift
enum LoginState {
    case neutral, loading, success, failure
}
struct LoginView: View {
    @State private var loginState: LoginState = .neutral
    // other code
}
```

- Use a Task object to run async code.

```swift
Button("Login") { 
    loginState = .loading
    Task {
        if await login() {
            onLoginSuccess(true)
        }
    }
}
```

- Use [DebouncedOnChange](https://github.com/Tunous/DebouncedOnChange) Swift package to optimize search.
- To generate the initial code for a preview, open a view and then use the Xcode feature *Editor -> Create preview* 
- The List view requires that you specify an id field `List(movies, id: \.title)` or that the items conform to Identifiable protocol
- If you can't add SwiftPM packages from Xcode, add them by editing the *package.swift* file.
Here is an example below.

@[code swift](../../../corrections/iOS-training%20Moovy.swiftpm/Package.swift)