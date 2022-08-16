<template><div><h1 id="ui-development" tabindex="-1"><a class="header-anchor" href="#ui-development" aria-hidden="true">#</a> UI development</h1>
<p>There are two official UI frameworks provided by Apple: UIKit and SwiftUI.</p>
<p>UIKit is the originally used framework for UI development. It relies on defining the UI in a separate file (storyboard or xib) and the behavior in a swift file. In 2019, Apple release the first version of SwiftUI.</p>
<p>The remainder of this training focuses on SwiftUI.</p>
<h2 id="swiftui" tabindex="-1"><a class="header-anchor" href="#swiftui" aria-hidden="true">#</a> SwiftUI</h2>
<p>SwiftUI brings a new approach to build UIs that we can summarize as follows:</p>
<ul>
<li>All the UI is defined in Swift code. Storyboards or xibs are not needed anymore.</li>
<li>The UI is defined in a declarative style.</li>
<li>States and bindings allow to hold the app data. The app UI updates automatically when these data change.</li>
<li>UI elements are structs that inherit from View.</li>
<li>Complex views can be defined by breaking them into smaller views. This is called view composition.</li>
<li>The modifier technique is used to apply modifications to a view. A modifier returns a new view each time.</li>
</ul>
<p>The <a href="https://developer.apple.com/documentation/swiftui" target="_blank" rel="noopener noreferrer">official documentation of SwiftUI is available here<ExternalLinkIcon/></a>.</p>
<h2 id="prerequisites" tabindex="-1"><a class="header-anchor" href="#prerequisites" aria-hidden="true">#</a> Prerequisites</h2>
<p>It is recommended to use Xcode to learn and create SwiftUI apps.
There is a <a href="https://swiftui-playground.kishikawakatsumi.com/" target="_blank" rel="noopener noreferrer">web playground<ExternalLinkIcon/></a> that can do the job, but it looks like it's unstable sometimes.
You can see a screenshot of the tool below.</p>
<p><img src="@source/assets/swftui-playground.png" alt="SwiftUI web playground"></p>
<p>Another promising alternative to watch is <a href="https://github.com/compnerd/swift-win32" target="_blank" rel="noopener noreferrer">compnerd's windows port<ExternalLinkIcon/></a> of UIKit and SwiftUI.
So, if you can have a recent version Xcode running, this would be the best way to experience SwiftUI.</p>
<h2 id="pw-complete-the-official-swiftui-tutorial" tabindex="-1"><a class="header-anchor" href="#pw-complete-the-official-swiftui-tutorial" aria-hidden="true">#</a> PW: complete the official SwiftUI tutorial</h2>
<p>Apple provides a <a href="https://developer.apple.com/tutorials/swiftui" target="_blank" rel="noopener noreferrer">SwiftUI tutorial<ExternalLinkIcon/></a> that covers most of the basic use cases such as creating views and handling inputs, animations and transitions.</p>
<p>You can start the tutorial by clicking on &quot;Get started&quot;.</p>
<p><img src="@source/assets/swift-ui-tuto-start.png" alt="swiftui get started"></p>
<p>You can also navigate between the different tutorials by using the top bar.</p>
<p><img src="@source/assets/swift-ui-tuto-navoigate.png" alt="navigate swiftui tutorial"></p>
<h2 id="a-summary-of-important-concepts" tabindex="-1"><a class="header-anchor" href="#a-summary-of-important-concepts" aria-hidden="true">#</a> A summary of important concepts</h2>
<ul>
<li>State:</li>
<li>Binding</li>
<li>EnvironmentObject</li>
<li>Observable</li>
</ul>
</div></template>
