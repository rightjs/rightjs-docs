# Comparison

A few words on differences and similarities between RightJS and other major
JavaScript frameworks.


## Disclaimer

Besides the obvious purpose of brainwashing and having you choose RightJS,
this article is meant to give you an idea where RightJS is situated (or 
supposed to be situated) in relation to other JavaScript frameworks.


Furthermore, I have the humble hope that you understand this as the author's
opinion which for obvious reasons doesn't have anything to do with other
people's realities and therefore should not be trusted.


## RightJS vs. jQuery

Both are quite small, modular and rely on plugins and extensions. Both have 
quite a lot of short and handy methods. And both help you write compact code.


The main difference is that jQuery is more oriented towards procedural and
functional approaches. RightJS on the other hand provides basic functional and 
procedural programming features, too, but it's more object-oriented and designed
to be familiar to server-side developers who work with dynamic languages like Ruby
and Python.


Another major difference is that jQuery internally isolates all its processes 
inside of an own scope whereas RightJS extends the JavaScript unit prototypes 
and thus provides instant and more semantic access to most of its features.


### Pros and Cons

* \+ Extensive object-oriented abilities
* \+ Immediately available native class extensions
* \+ Additional handy features like 'call-by-name'
* \+ Shared modules {Observer} and {Options}
* \+ More readable and cleaner syntax
* \+ Much better performance
* \+ Much more compact and modular UI library
* \+ Cleaner and better organization of internal code
* \- No safe-mode (at least not yet)


## RightJS vs. Prototype/Scriptaculous

Prototype and RightJS have quite a lot in common and are based on the same principle 
of `prototype` extensions. Moreover, RightJS inherited the naming principles and many
method and class names from what you might see in Prototype.

The differences are that RightJS is a modular framework with a small simple core and 
plugins, whereas Prototype is more of a monolithic all-in-one framework. And RightJS
mostly aims at modern browsers keeping all the old browsers support in a separate
module with patches. Prototype on the other hand has a special public API for faster
elements processing on old browsers.

### Pros and Cons

* \+ Modular and plugin oriented structure
* \+ Much smaller size
* \+ Much better performance
* \+ No rarely used code and obsolete features
* \+ Cleaner and more compact syntax
* \+ Additional features like call-by-name and function extensions
* \+ Better and more flexible Fx library
* \+ Basic Fx and cookies support out of box
* \+ Own UI library and plugins collection
* \- No fast class-level functions (needed only for old IE 6 and 7 browsers)


## RightJS vs. Mootools

RightJS and Mootools are pretty similar, too. Both started with the goal of making 
a better Prototype and as a matter of fact RightJS cherry-picked quite a few 
interesting things from Mootools.


But there are several differences between them as well. Mootools brings quite a lot 
of functional features like carrying and call-chains. And it tends to mix them with 
the object-orented approach which provides some interesting features and its own 
way of doing things. Having said that, RightJS is a simpler tool. It has both functional
and object-oriented features, but RightJS keeps them separated in order to allow the
developer to choose how he wants to deal with things.

Another difference is that Mootools tries to bring its own naming system for methods,
classes and modules when RightJS tries to stay as close to the more or less standard
Prototype and Ruby/Python naming principles.

### Pros and Cons

* \+ A bit more compact core and modules
* \+ Better performance
* \+ More standard, clean and readable syntax
* \+ Simplified way of dealing with everyday problems
* \+ Better Fx library where you just specify the end result
* \- I don't really see any significant cons here


## RightJS vs. YUI and Dojo

Dojo and YUI frameworks are similar and both differ quite noticable from RightJS which
is a modern framework in the spirit of Ruby. YUI on the other hand is more the equivalent
of Java and Dojo probably closer to Python.

The key difference between them is that YUI and Dojo work inside their own namespaces
and you are supposed to work through their nested APIs. RightJS provides you instant access
to most of its features on the objects themselves and thus makes it very easy to call or
chain these features.

### Pros and Cons

* \+ Smaller and modular library
* \+ Let you write much more compact application code
* \+ Instant access to the functionality
* \+ Dynamic approach like extensions of core classes
* \+ Functional approach features
* \- Doesn't have its own namespace
