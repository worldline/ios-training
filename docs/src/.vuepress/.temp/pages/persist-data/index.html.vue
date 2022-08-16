<template><div><h1 id="locally-persisting-data" tabindex="-1"><a class="header-anchor" href="#locally-persisting-data" aria-hidden="true">#</a> Locally persisting data</h1>
<p>Persisting data locally consists of storing data after the app has been killed and the variables removed from memory.
The persisted data offers many advantages.
We can use it to show initial data when the app starts and waits for the first batch data to be fetched from the server.
It can also be used to allow for offline app usage.</p>
<p>There are many to persist data in SwiftUI:</p>
<h2 id="userdefaults" tabindex="-1"><a class="header-anchor" href="#userdefaults" aria-hidden="true">#</a> UserDefaults</h2>
<p>It is a very simple key-value storage that persists in a file.
The API surface is very small and the developer does not need to manage the persisted file.
This makes this technique very efficient for simple storage use cases.
You can find a short <a href="https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults" target="_blank" rel="noopener noreferrer">guide here<ExternalLinkIcon/></a>.</p>
<p>Here is sample code that shows how to persist and load data.</p>
<div class="language-swift ext-swift line-numbers-mode"><pre v-pre class="language-swift"><code><span class="token class-name">UserDefaults</span><span class="token punctuation">.</span>standard<span class="token punctuation">.</span><span class="token keyword">set</span><span class="token punctuation">(</span><span class="token keyword">self</span><span class="token punctuation">.</span>tapCount<span class="token punctuation">,</span> forKey<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"Tap"</span></span><span class="token punctuation">)</span>
<span class="token attribute atrule">@State</span> <span class="token keyword">private</span> <span class="token keyword">var</span> tapCount <span class="token operator">=</span> <span class="token class-name">UserDefaults</span><span class="token punctuation">.</span>standard<span class="token punctuation">.</span><span class="token function">integer</span><span class="token punctuation">(</span>forKey<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"Tap"</span></span><span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="codable-saved-in-a-file" tabindex="-1"><a class="header-anchor" href="#codable-saved-in-a-file" aria-hidden="true">#</a> Codable saved in a file</h2>
<p>A more advanced and powerful technique is to manually load and persist a Codable into a file.
This technique is useful if you want to store complex objects (such as the state or model) in a JSON file.
There are two steps in this process, the first one consists of decoding / encoding the object from / into JSON using <code v-pre>JSONDecoder().decode</code> and <code v-pre>JSONEncoder().encode</code>.
The second step consists of loading / saving the encoded data and we can think of two ways to achieve this.
The first one consists of user defaults' <code v-pre>dataForKey:</code> to load the data and <code v-pre>setObject:ForKey</code> to persist it.
Another one consists of creating and managing a file by the developer using file APIs such as <code v-pre>fileHandle.availableData</code> to load the data from a file and <code v-pre>data.write</code> to save it.</p>
<h2 id="sophisticated-data-persistence-libraries" tabindex="-1"><a class="header-anchor" href="#sophisticated-data-persistence-libraries" aria-hidden="true">#</a> Sophisticated data persistence libraries</h2>
<p>For storing data in a database or similar fashion, SQLite is available as a low level library
It is not recommended to use unless there is a performance concern of for very niche reason.
Instead, it is recommended to use libraries specialized in data persistence. Some can be assimilated to an ORM library (Object Relational Mapper).
The remainder of this section describes some of them.</p>
<h3 id="core-data" tabindex="-1"><a class="header-anchor" href="#core-data" aria-hidden="true">#</a> Core Data</h3>
<p><a href="https://developer.apple.com/documentation/coredata" target="_blank" rel="noopener noreferrer">Core Data<ExternalLinkIcon/></a> is the official library to &quot;Persist or cache data on a single device, or sync data to multiple devices with CloudKit&quot;.
It existed since iOS 3 and Apple continuously updates it to keep it relevant.
It also has the reputation of having a steep learning curve, but it remains famous among developers.
It works similarly as an ORM where classes are mapped into tables.
Xcode provides a graphical editor that allow to specify the tables, the relations and generate the necessary code (in Swift or Objective-C).</p>
<p><img src="https://docs-assets.developer.apple.com/published/fbb9767e96/rendered2x-1622022015.png" alt="Core date editor"></p>
<p>Even though Core Date existed before SwiftUI, Apple made sure that both of them can be used together.
This article shows <a href="https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui" target="_blank" rel="noopener noreferrer">how to use Core Data in a SwiftUI project<ExternalLinkIcon/></a>.</p>
<h3 id="realm" tabindex="-1"><a class="header-anchor" href="#realm" aria-hidden="true">#</a> Realm</h3>
<p><a href="https://realm.io/" target="_blank" rel="noopener noreferrer">Realm<ExternalLinkIcon/></a> is a high level alternative to SQLite.
It can be seen as alternative to Core Data as they seem to provide a similar list of features.
Most notably, the possibility to store data locally or in the cloud.
The points where Realm wins is that the library seems simpler to learn and to use and that it is also available in Android.
However, please be careful about the pricing of the cloud storage.</p>
<h3 id="firebase-datastore-or-any-other-cloud-based-storage" tabindex="-1"><a class="header-anchor" href="#firebase-datastore-or-any-other-cloud-based-storage" aria-hidden="true">#</a> Firebase datastore (or any other cloud based storage)</h3>
<p>As opposed to Realm and Core Data, which are local first databases, Firebase datastore is a cloud first database.
This means that Firebase Datastore requires an internet connection to store and load the data.
However, the library is simple to use and supports real time updates.</p>
<div class="custom-container tip"><p class="custom-container-title">TIP</p>
<p>Firebase datastore is part of a bigger suite of service called Firebase.
For example, we can <em>Firebase App Distribution</em> in Firebase, which is a service that allows to deploy and distribute apps without going the burden of using TestFlight.</p>
</div>
<h2 id="pw-complete-the-official-ios-persisting-data-tutorial" tabindex="-1"><a class="header-anchor" href="#pw-complete-the-official-ios-persisting-data-tutorial" aria-hidden="true">#</a> PW: complete the official iOS persisting data tutorial</h2>
<p>This PW shows how to save a codable in a manually managed file using JSON encoder and filesystem APIs.</p>
<p><a href="https://developer.apple.com/tutorials/app-dev-training/persisting-data" target="_blank" rel="noopener noreferrer">https://developer.apple.com/tutorials/app-dev-training/persisting-data<ExternalLinkIcon/></a></p>
</div></template>
