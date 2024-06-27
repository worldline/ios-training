import{_ as i,r as o,o as p,c as l,a as n,b as s,d as t,e}from"./app-CMoPY4kv.js";const c={},u=n("h1",{id:"mini-project",tabindex:"-1"},[n("a",{class:"header-anchor",href:"#mini-project"},[n("span",null,"Mini project")])],-1),r=n("p",null,"The final chapter of this training will ask you to create a SwiftUI app from scratch.",-1),d=n("h2",{id:"requirements",tabindex:"-1"},[n("a",{class:"header-anchor",href:"#requirements"},[n("span",null,"Requirements")])],-1),k=n("p",null,"The app consists of a movie explorer app with the following features:",-1),v=n("li",null,"Search for movies by title.",-1),m=n("li",null,"View the details of the selected movie.",-1),h=n("li",null,"The app requires the user to be logged in.",-1),b=n("li",null,"The app allows a new user to register.",-1),g=n("li",null,"The movie list screen allows to logout from the app.",-1),w=n("li",null,"The app remembers the logged in user after a restart.",-1),f={href:"https://movie-api-ybwl.koyeb.app/api-docs/",target:"_blank",rel:"noopener noreferrer"},_=n("ul",null,[n("li",null,[s("The "),n("strong",null,"/movies/search"),s(" endpoint requires to pass the token retrieved from endpoint "),n("strong",null,"/user/login"),s(" or "),n("strong",null,"user/register"),s(" in this header: "),n("code",null,"Authorization: Bearer \\(userResponse.token)")])],-1),y=n("li",null,"(Optional) The result of previous queries is locally cached.",-1),q=n("li",null,"(Optional) Add movie to local favorites ⭐️",-1),T={href:"https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition",target:"_blank",rel:"noopener noreferrer"},S=n("p",null,"A preview of the app can be seen here.",-1),x=n("iframe",{width:"720",height:"576",src:"https://www.youtube.com/embed/vh5AlaGK0Eo",title:"YouTube video player",frameborder:"0",allow:"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",allowfullscreen:""},null,-1),I=e(`<h2 id="hints" tabindex="-1"><a class="header-anchor" href="#hints"><span>Hints</span></a></h2><ul><li>There are many techniques to handle the flow from the login view to the movie list view. On of them is to rely on a logged state. The following gives an overview how it looks like.</li></ul><div class="language-swift line-numbers-mode" data-ext="swift" data-title="swift"><pre class="language-swift"><code><span class="token keyword">struct</span> <span class="token class-name">ContentView</span><span class="token punctuation">:</span> <span class="token class-name">View</span> <span class="token punctuation">{</span>
    <span class="token attribute atrule">@State</span> <span class="token keyword">var</span> loggedIn<span class="token punctuation">:</span> <span class="token boolean">false</span>
    
    <span class="token keyword">var</span> body<span class="token punctuation">:</span> <span class="token keyword">some</span> <span class="token class-name">View</span> <span class="token punctuation">{</span>
        <span class="token keyword">if</span> loggedIn <span class="token punctuation">{</span>
            <span class="token class-name">MovieListView</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
        <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
            <span class="token comment">// The LoginView takes a callback that is called when the login succeeds</span>
            <span class="token class-name">LoginView</span> <span class="token punctuation">{</span> newLoggedIn <span class="token keyword">in</span>
                loggedIn <span class="token operator">=</span> newLoggedIn
            <span class="token punctuation">}</span>
        <span class="token punctuation">}</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><ul><li>In the login view, use an enum to track the state of the login operation so that you can disable the login button when a request is running.</li></ul><div class="language-swift line-numbers-mode" data-ext="swift" data-title="swift"><pre class="language-swift"><code><span class="token keyword">enum</span> <span class="token class-name">LoginState</span> <span class="token punctuation">{</span>
    <span class="token keyword">case</span> neutral<span class="token punctuation">,</span> loading<span class="token punctuation">,</span> success<span class="token punctuation">,</span> failure
<span class="token punctuation">}</span>
<span class="token keyword">struct</span> <span class="token class-name">LoginView</span><span class="token punctuation">:</span> <span class="token class-name">View</span> <span class="token punctuation">{</span>
    <span class="token attribute atrule">@State</span> <span class="token keyword">private</span> <span class="token keyword">var</span> loginState<span class="token punctuation">:</span> <span class="token class-name">LoginState</span> <span class="token operator">=</span> <span class="token punctuation">.</span>neutral
    <span class="token comment">// other code</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><ul><li>Use a Task object to run async code.</li></ul><div class="language-swift line-numbers-mode" data-ext="swift" data-title="swift"><pre class="language-swift"><code><span class="token class-name">Button</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">&quot;Login&quot;</span></span><span class="token punctuation">)</span> <span class="token punctuation">{</span> 
    loginState <span class="token operator">=</span> <span class="token punctuation">.</span>loading
    <span class="token class-name">Task</span> <span class="token punctuation">{</span>
        <span class="token keyword">if</span> <span class="token keyword">await</span> <span class="token function">login</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token function">onLoginSuccess</span><span class="token punctuation">(</span><span class="token boolean">true</span><span class="token punctuation">)</span>
        <span class="token punctuation">}</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="custom-container danger"><p class="custom-container-title">Swift Concurrency crashes on Swift Playground</p><p>Do not use the Swift Playground app to run you app as it does not work well with SwiftUI + Swift Concurrency (async, await and Task). Instead, you can create an Xcode project of type Playground to combine the power of Xcode and the simplicity of Playground projects.</p></div>`,8),L={href:"https://github.com/Tunous/DebouncedOnChange",target:"_blank",rel:"noopener noreferrer"},V=n("li",null,[s("To generate the initial code for a preview, open a view and then use the Xcode feature "),n("em",null,"Editor -> Create preview")],-1),A=n("li",null,[s("The List view requires that you specify an "),n("code",null,"id"),s(" field "),n("code",null,"List(movies, id: \\.title)"),s(" or that the items conform to Identifiable protocol")],-1),C=n("li",null,[s("If you can't add SwiftPM packages from Xcode, add them by editing the "),n("em",null,"package.swift"),s(" file by hand. Here is an example below.")],-1),O=e(`<div class="language-swift line-numbers-mode" data-ext="swift" data-title="swift"><pre class="language-swift"><code><span class="token comment">// swift-tools-version: 5.6</span>

<span class="token comment">// WARNING:</span>
<span class="token comment">// This file is automatically generated.</span>
<span class="token comment">// Do not edit it by hand because the contents will be replaced.</span>

<span class="token keyword">import</span> <span class="token class-name">PackageDescription</span>
<span class="token keyword">import</span> <span class="token class-name">AppleProductTypes</span>

<span class="token keyword">let</span> package <span class="token operator">=</span> <span class="token class-name">Package</span><span class="token punctuation">(</span>
    name<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;Moovy&quot;</span></span><span class="token punctuation">,</span>
    platforms<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">iOS</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">&quot;15.2&quot;</span></span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">.</span><span class="token function">macOS</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">&quot;13.0&quot;</span></span><span class="token punctuation">)</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
    products<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">iOSApplication</span><span class="token punctuation">(</span>
            name<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;Moovy&quot;</span></span><span class="token punctuation">,</span>
            targets<span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token string-literal"><span class="token string">&quot;AppModule&quot;</span></span><span class="token punctuation">]</span><span class="token punctuation">,</span>
            displayVersion<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;1.0&quot;</span></span><span class="token punctuation">,</span>
            bundleVersion<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;1&quot;</span></span><span class="token punctuation">,</span>
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
            capabilities<span class="token punctuation">:</span> <span class="token punctuation">[</span>
                <span class="token punctuation">.</span><span class="token function">outgoingNetworkConnections</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
            appCategory<span class="token punctuation">:</span> <span class="token punctuation">.</span>entertainment
        <span class="token punctuation">)</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
    dependencies<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">package</span><span class="token punctuation">(</span>url<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;https://github.com/Tunous/DebouncedOnChange.git&quot;</span></span><span class="token punctuation">,</span> <span class="token string-literal"><span class="token string">&quot;1.0.0&quot;</span></span><span class="token operator">..&lt;</span><span class="token string-literal"><span class="token string">&quot;2.0.0&quot;</span></span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">.</span><span class="token function">package</span><span class="token punctuation">(</span>url<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;https://github.com/kishikawakatsumi/KeychainAccess.git&quot;</span></span><span class="token punctuation">,</span> <span class="token string-literal"><span class="token string">&quot;4.0.0&quot;</span></span><span class="token operator">..&lt;</span><span class="token string-literal"><span class="token string">&quot;5.0.0&quot;</span></span><span class="token punctuation">)</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
    targets<span class="token punctuation">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">.</span><span class="token function">executableTarget</span><span class="token punctuation">(</span>
            name<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;AppModule&quot;</span></span><span class="token punctuation">,</span>
            dependencies<span class="token punctuation">:</span> <span class="token punctuation">[</span>
                <span class="token string-literal"><span class="token string">&quot;DebouncedOnChange&quot;</span></span><span class="token punctuation">,</span>
                <span class="token string-literal"><span class="token string">&quot;KeychainAccess&quot;</span></span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
            path<span class="token punctuation">:</span> <span class="token string-literal"><span class="token string">&quot;.&quot;</span></span>
        <span class="token punctuation">)</span>
    <span class="token punctuation">]</span>
<span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div>`,1);function D(P,j){const a=o("ExternalLinkIcon");return p(),l("div",null,[u,r,d,k,n("ul",null,[v,m,h,b,g,w,n("li",null,[s("The app uses "),n("a",f,[s("this API"),t(a)]),s(" for the authenticating and searching for movies. "),_]),y,q,n("li",null,[s("(Optional) Animate the transition between the login view and the movie list view ("),n("a",T,[s("tutorial"),t(a)]),s(").")])]),S,x,I,n("ul",null,[n("li",null,[s("Use "),n("a",L,[s("DebouncedOnChange"),t(a)]),s(" Swift package to optimize search.")]),V,A,C]),O])}const N=i(c,[["render",D],["__file","index.html.vue"]]),E=JSON.parse('{"path":"/mini-project/","title":"Mini project","lang":"en-US","frontmatter":{},"headers":[{"level":2,"title":"Requirements","slug":"requirements","link":"#requirements","children":[]},{"level":2,"title":"Hints","slug":"hints","link":"#hints","children":[]}],"git":{"updatedTime":1701187541000,"contributors":[{"name":"Yassine Benabbas","email":"yassine.benabbas@worldline.com","commits":4},{"name":"yostane","email":"1958676+yostane@users.noreply.github.com","commits":1}]},"filePathRelative":"mini-project/README.md"}');export{N as comp,E as data};