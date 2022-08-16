<template><div><h1 id="swift-part-2" tabindex="-1"><a class="header-anchor" href="#swift-part-2" aria-hidden="true">#</a> Swift (part 2)</h1>
<h2 id="object-oriented-programming-features" tabindex="-1"><a class="header-anchor" href="#object-oriented-programming-features" aria-hidden="true">#</a> Object oriented programming features</h2>
<p>Swift supports most Object oriented features: classes, instances, encapsulation, simple inheritance, overriding, overloading, compositions, polymorphism and access control.
There are some differences and additional features that are highlighted below:</p>
<ul>
<li>Multiple inheritance of classes and abstract classes are not supported.</li>
<li><em>Interfaces</em> are named <em>protocols</em> and they are used a lot by swift developers to the point that there is a programming technique called <strong>Protocol oriented programming</strong>.</li>
<li>Extensions allow to add functions and conform to additional protocols outside of the original class declaration.
This has many uses.
For example, we can add methods to the standard String class.</li>
</ul>
<p><a href="https://swiftfiddle.com/05f4d4d3c8235299a875e08dcb3992f8" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> illustrates the above features.</p>
<p>In additions to classes, structs in swift are very powerful and provide similar features than classes with some exceptions.</p>
<h2 id="structs" tabindex="-1"><a class="header-anchor" href="#structs" aria-hidden="true">#</a> Structs</h2>
<p>In Swift, structs have similar features than classes.
They support properties, methods, <a href="https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html" target="_blank" rel="noopener noreferrer">subscripts<ExternalLinkIcon/></a>, initializers, extensions and conforming to protocols.
The features that are only available in classes <a href="https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html" target="_blank" rel="noopener noreferrer">are as follows<ExternalLinkIcon/></a>:</p>
<ul>
<li>Inheritance enables one class to inherit the characteristics of another.</li>
<li>Type casting enables you to check and interpret the type of a class instance at runtime.</li>
<li>Deinitializers enable an instance of a class to free up any resources it has assigned.</li>
<li>Reference counting allows more than one reference to a class instance.</li>
</ul>
<p><a href="https://swiftfiddle.com/d72ea73dcbae5cc25908c56bdabcf877" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> sample shows how to use structs with protocols.</p>
<h2 id="opaque-types" tabindex="-1"><a class="header-anchor" href="#opaque-types" aria-hidden="true">#</a> Opaque types</h2>
<p>This feature seems advanced to understand but since it's used a lot in SwiftUI, let's explore a simple explanation and we'll provide some links to study it further.</p>
<p>In a base level, opaque types allow to return Protocols while keeping the concrete type information known by the compiler.
It is enabled by prefixing the type with <code v-pre>some</code> keyword.</p>
<p>This allows to keep the benefits of abstracting the code on a developer level while maintaining the performance and optimization benefits of concrete typing.
In addition to that, it allows the compiler to better handle some cases such as Self or associated type requirements.
Please note that explaining all the features that opaque types bring to the code is an advanced topic.
For more information and details, please read the articles mentioned in the <a href="#sources-and-more-reading">Sources and more reading section</a>.</p>
<p>For this training, we'll assume that opaque help the compiler perform better optimizations with protocols and is used a lot in SwiftUI.
In addition to that, we'll show below a simple use case where we can see a concrete benefit of opaque types.</p>
<div class="language-swift ext-swift line-numbers-mode"><pre v-pre class="language-swift"><code><span class="token comment">// https://www.educative.io/answers/what-is-opaque-type-in-swift</span>

<span class="token comment">// create a function that returns some Equatable</span>
<span class="token keyword">func</span> <span class="token function-definition function">makeInteger</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">-></span> <span class="token keyword">some</span> <span class="token class-name">Equatable</span><span class="token punctuation">{</span> 
  <span class="token class-name">Int</span><span class="token punctuation">.</span><span class="token function">random</span><span class="token punctuation">(</span><span class="token keyword">in</span><span class="token punctuation">:</span> <span class="token number">0</span><span class="token operator">...</span><span class="token number">10</span><span class="token punctuation">)</span>
<span class="token punctuation">}</span> 

<span class="token keyword">let</span> firstInteger <span class="token operator">=</span> <span class="token function">makeInteger</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
<span class="token keyword">let</span> secondInteger <span class="token operator">=</span> <span class="token function">makeInteger</span><span class="token punctuation">(</span><span class="token punctuation">)</span>

<span class="token comment">// comparing the firstInteger and secondInteger return type</span>
<span class="token comment">//  this returns a result "false" because they are of the same return type else, Xcode will scream at us.</span>
<span class="token function">print</span><span class="token punctuation">(</span>firstInteger <span class="token operator">==</span> secondInteger<span class="token punctuation">)</span> 
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>As of Swift 5.1 <a href="https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md" target="_blank" rel="noopener noreferrer">opaque types are only available for return values<ExternalLinkIcon/></a>.
As of Swift 5.7 <a href="https://github.com/apple/swift-evolution/blob/main/proposals/0341-opaque-parameters.md" target="_blank" rel="noopener noreferrer">opaque arguments have been implemented<ExternalLinkIcon/></a></p>
<h2 id="use-structs-by-default" tabindex="-1"><a class="header-anchor" href="#use-structs-by-default" aria-hidden="true">#</a> Use structs by default</h2>
<p>As surprising as it seems, Apple recommends using <a href="https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes" target="_blank" rel="noopener noreferrer">structs by default instead of classes<ExternalLinkIcon/></a>.
More precisely, when we want to add a new data type, we should not assume that it should be a class and check if a structure is more relevant.
Apple provides the following recommendations:</p>
<ul>
<li>Use structures by default.</li>
<li>Use classes when you need Objective-C interoperability.</li>
<li>Use classes when you need to control the identity of the data you’re modeling.</li>
<li>Use structures along with protocols to adopt behavior by sharing implementations.</li>
</ul>
<p>We note that structures are the default choice mostly because they value types.
This makes the code more predictable because changes cannot come somewhere from a parent call.
Another advantage of structs is that they are more friendly with functional programming.
We'll talk about functional programming in the next section.</p>
<h2 id="functional-programming-features" tabindex="-1"><a class="header-anchor" href="#functional-programming-features" aria-hidden="true">#</a> Functional programming features</h2>
<p>Functional programming revolves around <a href="https://flexiple.com/ios/introduction-to-functional-programming-using-swift/" target="_blank" rel="noopener noreferrer">three main concepts<ExternalLinkIcon/></a>: pure functions, immutable objects and declarative programming.</p>
<p>Pure functions are functions that do not have side effects and will thus return always the same output given the same input.
Swift allows to create pure functions but does not provide compile time guarantees that a function is pure.</p>
<p>Immutable objects can be created using classes with constant properties (declared with <code v-pre>let</code>).
Another common practice is to use structs for <a href="https://stackoverflow.com/a/24232845" target="_blank" rel="noopener noreferrer">many good reasons<ExternalLinkIcon/></a>.
One of the most notable ones is that structs are passed around by value and thus are more relevant in the functional paradigm where we want to avoid side effects.</p>
<p>Declarative programming can be easily explained as a way of programming that is centered <a href="https://blog.ndepend.com/declarative-programming-depth/" target="_blank" rel="noopener noreferrer">around telling what to do and not how to do it<ExternalLinkIcon/></a>.
This allows to obtain a clear and more maintainable code.
For example, when we want to filter a table, a for loop is not declarative (we say imperative in this case) while the SQL syntax is considered declarative.
Declarative programing is possible in Swift through chaining functions and passing functions as arguments.
Indeed, we have seen earlier, Swift has 1st class support for functions.
In addition to that, we can find declarative APIs in the standard Swift library and in Swift UI.
The latter will be explored in a different chapter.
For now, let's illustrate <a href="https://swiftfiddle.com/4cebea7bfea3d58600df30f1af325663" target="_blank" rel="noopener noreferrer">with this code snippet<ExternalLinkIcon/></a> how to process a list of strings using only declarative APIs provided by Swift and no for loops.</p>
<p>Swift has many more features and provides a rich standard library.
We'll explore them as needed in the next sections.
For now, let's create some UIs in the next chapter.</p>
<h2 id="exercises" tabindex="-1"><a class="header-anchor" href="#exercises" aria-hidden="true">#</a> Exercises</h2>
<h3 id="exercise-1" tabindex="-1"><a class="header-anchor" href="#exercise-1" aria-hidden="true">#</a> Exercise 1</h3>
<p><a href="https://swiftfiddle.com/5d65286d3db0ccf08f7ca3bf1cef31fe" target="_blank" rel="noopener noreferrer">Please click on this link to view the exercise<ExternalLinkIcon/></a></p>
<p>Please open the details pane to see the solution(s)</p>
<details class="custom-container details">
<p><a href="https://swiftfiddle.com/41469e54bc7c025b003341a0e96f16a3" target="_blank" rel="noopener noreferrer">Solution<ExternalLinkIcon/></a></p>
</details>
<h3 id="exercise-2" tabindex="-1"><a class="header-anchor" href="#exercise-2" aria-hidden="true">#</a> Exercise 2</h3>
<p><a href="https://swiftfiddle.com/43fc226645abb5457d26c7176fb6009d" target="_blank" rel="noopener noreferrer">Please click on this link to view the exercise<ExternalLinkIcon/></a></p>
<p>Please open the details pane to see the solution(s)</p>
<details class="custom-container details">
<p><a href="https://swiftfiddle.com/a1227e17989ad80da5137a31aa6dfbeb" target="_blank" rel="noopener noreferrer">Solution<ExternalLinkIcon/></a></p>
<h2 id="sources-and-more-reading" tabindex="-1"><a class="header-anchor" href="#sources-and-more-reading" aria-hidden="true">#</a> Sources and more reading</h2>
<ul>
<li><a href="https://docs.swift.org" target="_blank" rel="noopener noreferrer">Swift official documentation<ExternalLinkIcon/></a>.</li>
<li><a href="https://tanaschita.com/20220206-understanding-opaque-types-in-swift/" target="_blank" rel="noopener noreferrer">Understanding opaque types in Swift<ExternalLinkIcon/></a></li>
<li><a href="https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md" target="_blank" rel="noopener noreferrer">Swift evolution Opaque Result Types<ExternalLinkIcon/></a></li>
</ul>
</details>
</div></template>
