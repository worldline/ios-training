<template><div><h1 id="mini-project" tabindex="-1"><a class="header-anchor" href="#mini-project" aria-hidden="true">#</a> Mini project</h1>
<p>The final chapter of this training will ask you to create a SwiftUI app from scratch.</p>
<h2 id="requirements" tabindex="-1"><a class="header-anchor" href="#requirements" aria-hidden="true">#</a> Requirements</h2>
<p>The app consists of a movie explorer app with the following features:</p>
<ul>
<li>Search for movies by title.</li>
<li>View the details of the selected movie.</li>
<li>The app requires the user to be logged in.</li>
<li>The app allows a new user to register.</li>
<li>The movie list screen allows to logout from the app.</li>
<li>The app remembers the logged in user after a restart.</li>
<li>The app uses <a href="https://vue-js-backend.herokuapp.com/api-docs/#/" target="_blank" rel="noopener noreferrer">this API<ExternalLinkIcon/></a> for the authenticating and searching for movies (an empty search string returns all the movies).
<ul>
<li>The <strong>/movies/search</strong> endpoint requires to pass the token retrieved from endpoint <strong>/user/login</strong> or <strong>user/register</strong> with this header: <code v-pre>Authorization: Bearer \(userResponse.token)</code></li>
</ul>
</li>
<li>(Optional) The result of previous queries is locally cached.</li>
<li>(Optional) Animate the transition between the login view and the movie list view (<a href="https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition" target="_blank" rel="noopener noreferrer">tutorial<ExternalLinkIcon/></a>).</li>
</ul>
<div class="custom-container danger"><p class="custom-container-title">DANGER</p>
<p>Do not use the Playground app as it does not work well with SwiftUI + Swift Concurrency (async await)</p>
</div>
<p>A preview of the app can be seen here.
<a href="https://youtube.com/shorts/vh5AlaGK0Eo?feature=share" target="_blank" rel="noopener noreferrer">link<ExternalLinkIcon/></a></p>
<iframe>
</iframe>
<h2 id="hints" tabindex="-1"><a class="header-anchor" href="#hints" aria-hidden="true">#</a> Hints</h2>
<ul>
<li>There many techniques to handle the flow from the login view to the movie list view.
On of them is to rely on a logged state.
The following show broadly how if looks like.</li>
</ul>
<div class="language-swift ext-swift line-numbers-mode"><pre v-pre class="language-swift"><code><span class="token keyword">struct</span> <span class="token class-name">ContentView</span><span class="token punctuation">:</span> <span class="token class-name">View</span> <span class="token punctuation">{</span>
    <span class="token attribute atrule">@State</span> <span class="token keyword">var</span> loggedIn<span class="token punctuation">:</span> <span class="token boolean">false</span>
    
    <span class="token keyword">var</span> body<span class="token punctuation">:</span> <span class="token keyword">some</span> <span class="token class-name">View</span> <span class="token punctuation">{</span>
        <span class="token keyword">if</span> loggedIn <span class="token punctuation">{</span>
            <span class="token class-name">MovieListView</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
        <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
            <span class="token class-name">LoginView</span> <span class="token punctuation">{</span> newLoggedIn <span class="token keyword">in</span>
                loggedIn <span class="token operator">=</span> newLoggedIn
            <span class="token punctuation">}</span>
        <span class="token punctuation">}</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><ul>
<li>In the login view, use an enum to track the state of the login view so that you can disable the login button when a request is running.</li>
</ul>
<div class="language-swift ext-swift line-numbers-mode"><pre v-pre class="language-swift"><code><span class="token keyword">enum</span> <span class="token class-name">LoginState</span> <span class="token punctuation">{</span>
    <span class="token keyword">case</span> neutral<span class="token punctuation">,</span> loading<span class="token punctuation">,</span> success<span class="token punctuation">,</span> failure
<span class="token punctuation">}</span>
<span class="token keyword">struct</span> <span class="token class-name">LoginView</span><span class="token punctuation">:</span> <span class="token class-name">View</span> <span class="token punctuation">{</span>
    <span class="token attribute atrule">@State</span> <span class="token keyword">private</span> <span class="token keyword">var</span> loginState<span class="token punctuation">:</span> <span class="token class-name">LoginState</span> <span class="token operator">=</span> <span class="token punctuation">.</span>neutral
    <span class="token comment">// other code</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><ul>
<li>Use a Task object to run async code.</li>
</ul>
<div class="language-swift ext-swift line-numbers-mode"><pre v-pre class="language-swift"><code><span class="token class-name">Button</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"Login"</span></span><span class="token punctuation">)</span> <span class="token punctuation">{</span> 
    loginState <span class="token operator">=</span> <span class="token punctuation">.</span>loading
    <span class="token class-name">Task</span> <span class="token punctuation">{</span>
        <span class="token keyword">if</span> <span class="token keyword">await</span> <span class="token function">login</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token function">onLoginSuccess</span><span class="token punctuation">(</span><span class="token boolean">true</span><span class="token punctuation">)</span>
        <span class="token punctuation">}</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><ul>
<li>Use <a href="https://github.com/Tunous/DebouncedOnChange" target="_blank" rel="noopener noreferrer">DebouncedOnChange<ExternalLinkIcon/></a> Swift package to optimize search.</li>
<li>To generate the initial code for a preview, open a view and then use the Xcode feature <em>Editor -&gt; Create preview</em></li>
<li>The List view requires that you specify an id field <code v-pre>List(movies, id: \.title)</code> or that the items conform to Identifiable protocol</li>
<li>If you can't add SwiftPM packages from Xcode, add them by editing the <em>package.swift</em> file.
Here is an example below.</li>
</ul>
<div class="language-swift ext-swift line-numbers-mode"><pre v-pre class="language-swift"><code><span class="token comment">// swift-tools-version: 5.6</span>

<span class="token comment">// WARNING:</span>
<span class="token comment">// This file is automatically generated.</span>
<span class="token comment">// Do not edit it by hand because the contents will be replaced.</span>

<span class="token keyword">import</span> <span class="token class-name">PackageDescription</span>
<span class="token keyword">import</span> <span class="token class-name">AppleProductTypes</span>

<span class="token keyword">let</span> package <span class="token operator">=</span> <span class="token class-name">Package</span><span class="token punctuation">(</span>
    name<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"Moovy"</span></span><span class="token punctuation">,</span>
    platforms<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">iOS</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"15.2"</span></span><span class="token punctuation">)</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
    products<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">iOSApplication</span><span class="token punctuation">(</span>
            name<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"Moovy"</span></span><span class="token punctuation">,</span>
            targets<span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token string-literal"><span class="token string">"AppModule"</span></span><span class="token punctuation">]</span><span class="token punctuation">,</span>
            displayVersion<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"1.0"</span></span><span class="token punctuation">,</span>
            bundleVersion<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"1"</span></span><span class="token punctuation">,</span>
            appIcon<span class="token punctuation">:</span> <span class="token punctuation">.</span><span class="token function">placeholder</span><span class="token punctuation">(</span>icon<span class="token punctuation">:</span> <span class="token punctuation">.</span>sun<span class="token punctuation">)</span><span class="token punctuation">,</span>
            accentColor<span class="token punctuation">:</span> <span class="token punctuation">.</span><span class="token function">presetColor</span><span class="token punctuation">(</span><span class="token punctuation">.</span>indigo<span class="token punctuation">)</span><span class="token punctuation">,</span>
            supportedDeviceFamilies<span class="token punctuation">:</span> <span class="token punctuation">[</span>
                <span class="token punctuation">.</span>pad<span class="token punctuation">,</span>
                <span class="token punctuation">.</span>phone
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
            supportedInterfaceOrientations<span class="token punctuation">:</span> <span class="token punctuation">[</span>
                <span class="token punctuation">.</span>portrait<span class="token punctuation">,</span>
                <span class="token punctuation">.</span>landscapeRight<span class="token punctuation">,</span>
                <span class="token punctuation">.</span>landscapeLeft<span class="token punctuation">,</span>
                <span class="token punctuation">.</span><span class="token function">portraitUpsideDown</span><span class="token punctuation">(</span><span class="token punctuation">.</span><span class="token function">when</span><span class="token punctuation">(</span>deviceFamilies<span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token punctuation">.</span>pad<span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">)</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
            appCategory<span class="token punctuation">:</span> <span class="token punctuation">.</span>entertainment
        <span class="token punctuation">)</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
    dependencies<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">package</span><span class="token punctuation">(</span>url<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"https://github.com/Tunous/DebouncedOnChange.git"</span></span><span class="token punctuation">,</span> <span class="token string-literal"><span class="token string">"1.0.0"</span></span><span class="token operator">..&lt;</span><span class="token string-literal"><span class="token string">"2.0.0"</span></span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">.</span><span class="token function">package</span><span class="token punctuation">(</span>url<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"https://github.com/kishikawakatsumi/KeychainAccess.git"</span></span><span class="token punctuation">,</span> <span class="token string-literal"><span class="token string">"3.0.0"</span></span><span class="token operator">..&lt;</span><span class="token string-literal"><span class="token string">"4.0.0"</span></span><span class="token punctuation">)</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
    targets<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">executableTarget</span><span class="token punctuation">(</span>
            name<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"AppModule"</span></span><span class="token punctuation">,</span>
            dependencies<span class="token punctuation">:</span> <span class="token punctuation">[</span>
                <span class="token string-literal"><span class="token string">"DebouncedOnChange"</span></span><span class="token punctuation">,</span>
                <span class="token string-literal"><span class="token string">"KeychainAccess"</span></span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
            path<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">"."</span></span>
        <span class="token punctuation">)</span>
    <span class="token punctuation">]</span>
<span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div></div></template>
