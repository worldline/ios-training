<template><div><h1 id="swift-part-1" tabindex="-1"><a class="header-anchor" href="#swift-part-1" aria-hidden="true">#</a> Swift (part 1)</h1>
<p>Swift is the official programming language for developing iOS, iPadOS, macOS, watchOS and AppleTV apps.
It can also target other platforms such as Windows, Linux and Android.</p>
<p>The source code of the language is hosted on <a href="https://github.com/apple/swift" target="_blank" rel="noopener noreferrer">apple/swift<ExternalLinkIcon/></a> GitHub repository.</p>
<h2 id="a-quick-tour-of-some-features" tabindex="-1"><a class="header-anchor" href="#a-quick-tour-of-some-features" aria-hidden="true">#</a> A quick tour of some features</h2>
<p>Swift has modern and interesting features. Here some notable ones:</p>
<ul>
<li>Swift is statically typed and supports implicit typing.</li>
<li><code v-pre>var</code> creates mutable variables.</li>
<li><code v-pre>let</code> creates immutable variables or constants depending on the type.</li>
<li>String interpolation is available with this syntax <code v-pre>\(expression)</code>.</li>
<li>Parenthesis are not required in <code v-pre>if</code>, <code v-pre>for</code>, <code v-pre>while</code> and <code v-pre>switch</code> statements.</li>
<li>for-each is the only type of for loop available</li>
<li>Null safety allows to write code free from null pointer errors.</li>
<li>Functional programming: Higher-order functions and functions as 1st class items, etc.</li>
<li>Object oriented programming is supported. In Swift, interfaces are called protocols.</li>
</ul>
<p><a href="https://swiftfiddle.com/2382a3b3fdc54631140f51bae116dc74" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> illustrates some of the features listed above.</p>
<p>In the following sections, we will delve into more features.</p>
<h2 id="functions" tabindex="-1"><a class="header-anchor" href="#functions" aria-hidden="true">#</a> Functions</h2>
<p>In the following, we use the terms 'argument' and 'parameter' interchangeably.</p>
<p>The declaration of functions in Swift has the following peculiarities:</p>
<ul>
<li>Parameters are named and ordered. This means that when you call a function, you must specify the name of the arguments in the correct order.</li>
<li>A parameter can have different external and internal names by declaring it like this: <code v-pre>externalName internalName: Type</code>. The external name is also called an argument label.</li>
<li>You can make an parameter anonymous by setting this external name: <code v-pre>_</code>.</li>
<li>Arguments can have a default value. These are also called optional arguments.</li>
</ul>
<p><a href="https://swiftfiddle.com/690a3e3bbe580f524f72358ccdb696da" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> illustrates the above features.</p>
<p>Swift allows to use functions as first class items. This allows to store function references into variables, pass functions as arguments to other functions and return a function from a function. Here is a brief summary of the features related to using functions as a 1st class items:</p>
<ul>
<li>A function can be assigned to a variable, passed as a function parameter or returned from a function.</li>
<li>A function type can be expressed as follows: <code v-pre>(typeOfParam1, typeOfParam2, etc) -&gt; returnType</code>.</li>
<li>The empty return type is Void.</li>
<li>We can use <code v-pre>typealias</code> to shorten writing long types.</li>
<li>Swift supports anonymous functions (also called lambda function) with the following syntax <code v-pre>{ argName1, argName2, etc. in // code }</code></li>
</ul>
<p><a href="https://swiftfiddle.com/5d6b837c869bf23615376bc4cc70bcd1" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> illustrates these features.</p>
<p>Let's explore in the next section, one of the most amazing features of Swift which is <em>Optionals</em>.</p>
<h2 id="optionals-aka-null-safety" tabindex="-1"><a class="header-anchor" href="#optionals-aka-null-safety" aria-hidden="true">#</a> Optionals (aka. Null safety)</h2>
<p>In a nutshell, optionals is a compiler feature that allows you to avoid the infamous <em>Null pointer exception</em> or <em>npe</em>.
The Swift compiler provides null safety and reports errors and warning when we manipulate nullable (also called optional) values.
Here is a list of null safety features provided by swift:</p>
<div class="custom-container tip"><p class="custom-container-title">TIP</p>
<p>In Swift, the null value is called <code v-pre>nil</code></p>
</div>
<ul>
<li>All types are non optional by default. This means that we cannot assign <code v-pre>nil</code> to a variable or an argument. For example, this code fails <code v-pre>var s: String = nil</code>.</li>
<li>A type can be made optional by suffixing it with a <em>?</em>. For example: <code v-pre>var s: String? = nil</code>.</li>
<li>You cannot call a method or a property of an optional type, unless you do one of those possibilities:
<ul>
<li>Use optional chaining with the <em>?</em> suffix.</li>
<li>Provide a default value with the <em>??</em> operator.</li>
<li>Unwrap the optional so that if becomes non optional.</li>
<li>Force unwrap the optional using the <em>!</em> suffix. This should never be used as it bypasses null safety checks.</li>
</ul>
</li>
</ul>
<div class="custom-container danger"><p class="custom-container-title">DANGER</p>
<p>You should never force unwrap with the <em>!</em>. Use other unwrapping techniques instead.</p>
</div>
<p><a href="https://swiftfiddle.com/fa7ad8713475c04666462236db939857" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> illustrates null safety and how to use optional types.</p>
<h2 id="enumerations" tabindex="-1"><a class="header-anchor" href="#enumerations" aria-hidden="true">#</a> Enumerations</h2>
<p>Enumerations allow to work with a group of values in a type-safe fashion. Swift provides many interesting features to enumerations:</p>
<ul>
<li>When the compiler can infer it, you can omit the name of the enumeration when you use one of its values.</li>
<li>Switch statements support enumerations.</li>
<li>You can easily iterate over an enum's values by using <code v-pre>: CaseIterable</code>.</li>
<li>You can associate values or provide a raw value to enumeration cases. Raw values can be implicitly assigned.</li>
<li>You can use another enumeration as associated value, this is called <em>recursive enumeration</em>.</li>
</ul>
<p><a href="https://swiftfiddle.com/d508deb3493e9b572eaf00891c91d8f0" target="_blank" rel="noopener noreferrer">This code snippet<ExternalLinkIcon/></a> illustrates some enumeration features. For further reading please consult <a href="https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html" target="_blank" rel="noopener noreferrer">the official documentation<ExternalLinkIcon/></a>.</p>
<h2 id="exercises" tabindex="-1"><a class="header-anchor" href="#exercises" aria-hidden="true">#</a> Exercises</h2>
<h3 id="exercise-1" tabindex="-1"><a class="header-anchor" href="#exercise-1" aria-hidden="true">#</a> Exercise 1</h3>
<p><a href="https://swiftfiddle.com/6a40668c99d1e2cf079be7525548ca60" target="_blank" rel="noopener noreferrer">Please click on this link to view the exercise<ExternalLinkIcon/></a></p>
<p>Please open the details pane to see the solution(s)</p>
<details class="custom-container details">
<p><a href="https://swiftfiddle.com/4e97fc9476694424b0fbab6dd8118c35" target="_blank" rel="noopener noreferrer">Solution<ExternalLinkIcon/></a></p>
</details>
<h3 id="exercise-2" tabindex="-1"><a class="header-anchor" href="#exercise-2" aria-hidden="true">#</a> Exercise 2</h3>
<p><a href="https://swiftfiddle.com/0e980f44cf6855c63f3a9ce772872dde" target="_blank" rel="noopener noreferrer">Please click on this link to view the exercise<ExternalLinkIcon/></a></p>
<p>Please open the details pane to see the solution(s)</p>
<details class="custom-container details">
<p><a href="https://swiftfiddle.com/1bb9a747f719e0f35ca470c079a1e453" target="_blank" rel="noopener noreferrer">Solution<ExternalLinkIcon/></a></p>
</details>
<h2 id="sources" tabindex="-1"><a class="header-anchor" href="#sources" aria-hidden="true">#</a> Sources</h2>
<ul>
<li><a href="https://docs.swift.org" target="_blank" rel="noopener noreferrer">Swift official documentation<ExternalLinkIcon/></a>.</li>
</ul>
</div></template>
