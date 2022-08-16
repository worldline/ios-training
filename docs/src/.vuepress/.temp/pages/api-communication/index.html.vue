<template><div><h1 id="communicate-with-a-rest-api" tabindex="-1"><a class="header-anchor" href="#communicate-with-a-rest-api" aria-hidden="true">#</a> Communicate with a REST API</h1>
<h2 id="some-useful-concepts" tabindex="-1"><a class="header-anchor" href="#some-useful-concepts" aria-hidden="true">#</a> Some useful concepts</h2>
<p>Communicating with a REST API relies on multiple concepts that we'll cover briefly below:</p>
<ul>
<li><a href="https://www.json.org/json-en.html" target="_blank" rel="noopener noreferrer">JSON<ExternalLinkIcon/></a>: a standard data interchange format used a lot in the HTTP messages of REST APIs.</li>
<li><a href="https://www.redhat.com/en/topics/api/what-is-a-rest-api" target="_blank" rel="noopener noreferrer">REST API<ExternalLinkIcon/></a>: it is a standard communication interface between a client and conforms to the constraints of REST architectural style. In a REST API, HTTP messages are stateless and use JSON data format.</li>
<li><a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages" target="_blank" rel="noopener noreferrer">HTTP messages<ExternalLinkIcon/></a>: an http message is a textual message that contains different parts and can be either a request or a response. A request is the HTTP message that the client sends to the server and response is the HTTP message that the server sends to the client in reaction to the request. Both requests and responses have a part called a <em>body</em>. In rest APIs, the body is generally formatted in JSON.</li>
<li><a href="https://developer.apple.com/documentation/swift/codable" target="_blank" rel="noopener noreferrer">Codable<ExternalLinkIcon/></a>: it is a type that can convert itself into and out of an external representation. It is equivalent to <code v-pre>Serializable</code> in Java. This type is helpful if we want to convert an object into an out of a JSON string.</li>
<li><code v-pre>async</code> and <code v-pre>await</code>: these keywords are used to call an asynchronous function using a synchronous. This means that no more callbacks are needed !</li>
<li><a href="https://developer.apple.com/documentation/foundation/urlsession" target="_blank" rel="noopener noreferrer">URLSession<ExternalLinkIcon/></a>: The official iOS HTTP client which is part of the Foundation library. This library is not part of the Swift standard library but there is an implementation for non-Apple platforms which is called <a href="https://github.com/apple/swift-corelibs-foundation" target="_blank" rel="noopener noreferrer">swift-corelibs-foundation<ExternalLinkIcon/></a>.</li>
</ul>
<h2 id="pw-call-a-rest-api" tabindex="-1"><a class="header-anchor" href="#pw-call-a-rest-api" aria-hidden="true">#</a> PW: call a REST API</h2>
<p>This PW relies on the <a href="https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui" target="_blank" rel="noopener noreferrer">excellent tutorial from hackingwithswift<ExternalLinkIcon/></a>.
It guides you on how to fetch JSON data from <a href="https://itunes.apple.com/search?term=taylor+swift&amp;entity=song" target="_blank" rel="noopener noreferrer">iTunes's API<ExternalLinkIcon/></a>.
Please find and excerpt of the response body below.</p>
<div class="language-json ext-json line-numbers-mode"><pre v-pre class="language-json"><code><span class="token punctuation">{</span>
   <span class="token property">"resultCount"</span><span class="token operator">:</span><span class="token number">50</span><span class="token punctuation">,</span>
   <span class="token property">"results"</span><span class="token operator">:</span><span class="token punctuation">[</span>
      <span class="token punctuation">{</span>
         <span class="token property">"wrapperType"</span><span class="token operator">:</span><span class="token string">"track"</span><span class="token punctuation">,</span>
         <span class="token property">"kind"</span><span class="token operator">:</span><span class="token string">"song"</span><span class="token punctuation">,</span>
         <span class="token property">"artistId"</span><span class="token operator">:</span><span class="token number">159260351</span><span class="token punctuation">,</span>
         <span class="token property">"collectionId"</span><span class="token operator">:</span><span class="token number">1440913923</span><span class="token punctuation">,</span>
         <span class="token property">"trackId"</span><span class="token operator">:</span><span class="token number">1440914010</span><span class="token punctuation">,</span>
         <span class="token property">"artistName"</span><span class="token operator">:</span><span class="token string">"Taylor Swift"</span><span class="token punctuation">,</span>
         <span class="token property">"collectionName"</span><span class="token operator">:</span><span class="token string">"Taylor Swift (Bonus Track Version)"</span><span class="token punctuation">,</span>
         <span class="token property">"trackName"</span><span class="token operator">:</span><span class="token string">"Our Song"</span><span class="token punctuation">,</span>
         <span class="token property">"collectionCensoredName"</span><span class="token operator">:</span><span class="token string">"Taylor Swift (Bonus Track Version)"</span><span class="token punctuation">,</span>
      <span class="token punctuation">}</span>
   <span class="token punctuation">]</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div></div></template>
