# Mini project

The final chapter of this training will ask you to create a SwiftUI app from scratch.

## Requirements

The app consists of a movie explorer app with the following features:

- Search for movies by title.
- View the details of the selected movie.
- The app requires the user to be logged in.
- The app allows a new user to register.
- The movie list screen allows to logout from the app.
- The app remembers the logged in user after a restart.
- The app uses [this API](https://movie-api-ybwl.koyeb.app/api-docs/) for the authenticating and searching for movies.
  - The **/movies/search** endpoint requires to pass the token retrieved from endpoint **/user/login** or **user/register** in this header: `Authorization: Bearer \(userResponse.token)`
- (Optional) The result of previous queries is locally cached.
- (Optional) Add movie to local favorites ⭐️
- (Optional) Animate the transition between the login view and the movie list view ([tutorial](https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition)).

A preview of the app can be seen here.

<iframe
 width="720"
 height="576"
 src="https://www.youtube.com/embed/vh5AlaGK0Eo"
 title="YouTube video player"
 frameborder="0"
 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
 allowfullscreen />

## Hints

- There are many techniques to handle the flow from the login view to the movie list view.
On of them is to rely on a logged state.
The following gives an overview how it looks like.

```swift
struct ContentView: View {
    @State var loggedIn: false
    
    var body: some View {
        if loggedIn {
            MovieListView()
        } else {
            // The LoginView takes a callback that is called when the login succeeds
            LoginView { newLoggedIn in
                loggedIn = newLoggedIn
            }
        }
    }
}
```

- In the login view, use an enum to track the state of the login operation so that you can disable the login button when a request is running.

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

::: danger Swift Concurrency crashes on Swift Playground
Do not use the Swift Playground app to run you app as it does not work well with SwiftUI + Swift Concurrency (async, await and Task).
Instead, you can create an Xcode project of type Playground to combine the power of Xcode and the simplicity of Playground projects.
:::

- Use [DebouncedOnChange](https://github.com/Tunous/DebouncedOnChange) Swift package to optimize search.
- To generate the initial code for a preview, open a view and then use the Xcode feature *Editor -> Create preview*
- The List view requires that you specify an `id` field `List(movies, id: \.title)` or that the items conform to Identifiable protocol
- If you can't add SwiftPM packages from Xcode, add them by editing the *package.swift* file by hand.
Here is an example below.

@[code swift](../../../corrections/iOS-training-Moovy.swiftpm/Package.swift)
