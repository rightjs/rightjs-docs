# Comparison

A few words on differences and similarities between RightJS and other major
JavaScript frameworks.


## Disclaimer

Besides the obvious purpose of brainwashing and making you use RightJS,
this article is meant to give you an idea where RightJS is situated (or
supposed to be situated) relatively to other JavaScript frameworks.

And I have the humble hope that you understand this as the author's
opinion which for obvious reasons doesn't have anything to do with other
people's reality and therefore should not be trusted.


## RightJS vs. jQuery

Both are modular and rely on plugins and extensions, both have quite a lot of short
and handy methods and both help you write compact code.

The main difference is that jQuery is more oriented towards procedural and
functional approaches. RightJS on the other hand provides basic functional and
procedural programming features too, but it's more object-oriented and designed
to be familiar to server-side developers who work with dynamic languages like Ruby
and Python.


### Pros and Cons

* \+ Extensive object-oriented abilities
* \+ OO Dom-wrappers with inheritance and correct typization
* \+ Immediately available JavaScript core extensions
* \+ Additional handy features like [call-by-name](/tutorials/call-by-name)
* \+ Shared modules {Observer} and {Options}
* \+ Unformed events and options handling
* \+ More readable and cleaner syntax
* \+ Much better performance
* \+ Much smaller size (15k against 24)
* \+ Has cookies, forms and full-features UJS support out of box
* \+ Much more compact and modular UI library



## RightJS vs. Prototype/Scriptaculous

RightJS is a direct descendant of Prototype, it was started as an attempt to make
a more compact and fast version of Prototype and it inherited lots of features,
syntaxes and method names.

The main difference between them is that RightJS is a modular framework and rely
on plugins, when Prototype is more like a monolithic all-in-one build. The other
difference is that RightJS uses dom-wrappers to work with dom elements instead of
direct prototype extensions. And RightJS also have a safe-mode version.

### Pros and Cons

* \+ Modular and plugin oriented structure
* \+ Much smaller size
* \+ Much better performance
* \+ No rarely used code and obsolete features
* \+ Cleaner and more compact syntax
* \+ Additional features like [call-by-name](/tutorials/call-by-name) and function extensions
* \+ Better and more flexible Fx library out of box
* \+ Basic Fx and cookies support out of box
* \+ Own UI library and plugins collection


## RightJS vs. Mootools

RightJS and Mootools are pretty similar too. Both started with the goal of making
a better Prototype and as a matter of fact RightJS cherry-picked quite a few
interesting things from Mootools.

But there are several differences between them as well. Mootools brings quite a lot
of functional features like carrying and call-chains. And it tends to mix them with
the object-oriented approach which provides some interesting features and its own
way of doing things. Having said that, RightJS is a simpler tool. It has both functional
and object-oriented features, but RightJS keeps them separated in order to allow the
developer to choose how he wants to deal with things.

Another difference is that Mootools tries to bring its own naming system for methods,
classes and modules when RightJS tries to stay as close to the more or less standard
Prototype and Ruby/Python naming system.

### Pros and Cons

* \+ A bit more compact core and modules
* \+ DOM-Wrappers instead of dom-extensions
* \+ Better performance
* \+ More standard, clean and readable syntax
* \+ Simplified way of dealing with everyday problems
* \+ Better Fx library where you just specify the end result
* \- I don't really see any significant cons here


## RightJS vs. YUI and Dojo

Dojo and YUI frameworks are similar and both differ quite noticeable from RightJS, which
is a modern framework in the spirit of Ruby. YUI on the other hand is more the equivalent
of Java, and Dojo is probably closer to Python.

The key difference between them is that YUI and Dojo work inside their own namespaces
and you are supposed to work through their nested APIs. RightJS, on the other hand,
provides you instant access to most of its features on the objects themselves and thus
makes it very easy to call or chain these features.

### Pros and Cons

* \+ Smaller and modular library
* \+ Let you write much more compact application code
* \+ Instant access to the functionality
* \+ Dynamic approach like extensions of core classes
* \+ Functional approach features

