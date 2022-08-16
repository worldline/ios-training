<template><div><h1 id="swift" tabindex="-1"><a class="header-anchor" href="#swift" aria-hidden="true">#</a> Swift</h1>
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
<p>The following code illustrates some of the features listed above.</p>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3tZJ"></iframe>
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
<p>The following code snippet illustrates the above features.</p>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3v1n"></iframe>
<p>Swift allows to use functions as first class items. This allows to store function references into variables, pass functions as arguments to other functions and return a function from a function. Here is a brief summary of the features related to using functions as a 1st class items:</p>
<ul>
<li>A function can be assigned to a variable, passed as a function parameter or returned from a function.</li>
<li>A function type can be expressed as follows: <code v-pre>(typeOfParam1, typeOfParam2, etc) -&gt; returnType</code>.</li>
<li>The empty return type is Void.</li>
<li>We can use <code v-pre>typealias</code> to shorten writing long types.</li>
<li>Swift supports anonymous functions (also called lambda function) with the following syntax <code v-pre>{ argName1, argName2, etc. in // code }</code></li>
</ul>
<p>The following code snippet illustrates these features.</p>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3v1y"></iframe>
<p>Let's explore in the next section, one of the most amazing features of Swift which is <em>optionals</em>.</p>
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
<p>The following code illustrates null safety and how to use optional types:</p>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3IDP"></iframe>
<h3 id="exercise" tabindex="-1"><a class="header-anchor" href="#exercise" aria-hidden="true">#</a> Exercise</h3>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/50Td"></iframe>
<h2 id="enumerations" tabindex="-1"><a class="header-anchor" href="#enumerations" aria-hidden="true">#</a> Enumerations</h2>
<p>Enumerations allow to work with a group of values in a type-safe fashion. Swift provides many interesting features to enumerations:</p>
<ul>
<li>When the compiler can infer it, you can omit the name of the enumeration when you use one of its values.</li>
<li>Switch statements support enumerations.</li>
<li>You can easily iterate over an enum's values by using <code v-pre>: CaseIterable</code>.</li>
<li>You can associate values or provide a raw value to enumeration cases. Raw values can be implicitly assigned.</li>
<li>You can use another enumeration as associated value, this is called <em>recursive enumeration</em>.</li>
</ul>
<p>The following code illustrates some enumeration features. For further reading please consult <a href="https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html" target="_blank" rel="noopener noreferrer">the official documentation<ExternalLinkIcon/></a>.</p>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3K66"></iframe>
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
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/41uW"></iframe>
<p>In additions to classes, structs in swift are very powerful and provide similar features than classes with some exceptions.</p>
<h2 id="use-structs-by-default" tabindex="-1"><a class="header-anchor" href="#use-structs-by-default" aria-hidden="true">#</a> Use structs by default</h2>
<p>As the title says and as surprising as it seems for developers coming from other languages, Apple recommends using <a href="https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes" target="_blank" rel="noopener noreferrer">structs by default instead of classes<ExternalLinkIcon/></a>.
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
In addition to that, structures have similar features than classes in Swift.
They support properties, methods, <a href="https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html" target="_blank" rel="noopener noreferrer">subscripts<ExternalLinkIcon/></a>, initializers, extensions and conforming to protocols.
The features that are only available in classes <a href="https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html" target="_blank" rel="noopener noreferrer">are as follows<ExternalLinkIcon/></a>:</p>
<ul>
<li>Inheritance enables one class to inherit the characteristics of another.</li>
<li>Type casting enables you to check and interpret the type of a class instance at runtime.</li>
<li>Deinitializers enable an instance of a class to free up any resources it has assigned.</li>
<li>Reference counting allows more than one reference to a class instance.</li>
</ul>
<p>Another advantage of structs is that they are more friendly with functional programming.
We'll talk about this in the next section.</p>
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
For now, let's illustrate this part by processing a list of strings using only declarative APIs provided by Swift and no for loops.</p>
<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/42L8"></iframe>
<p>Swift has many more features and provides a rich standard library.
We'll explore them as needed in the next sections.
For now, let's create some UIs in the next chapter.</p>
<h2 id="sources" tabindex="-1"><a class="header-anchor" href="#sources" aria-hidden="true">#</a> Sources</h2>
<ul>
<li><a href="https://docs.swift.org" target="_blank" rel="noopener noreferrer">Swift official documentation<ExternalLinkIcon/></a>.</li>
</ul>
</div></template>
