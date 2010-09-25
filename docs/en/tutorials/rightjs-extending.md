# RightJS Extending Guide

Since version 2.0.0 all units in RightJS are essentially normal JavaScript
classes. At this angle there is nothing special about them and you can just
go and change any unit's `prototype` property right away

    String.prototype.isBob = function() {
      return this.indexOf('Bob') > -1;
    };

    "Bob".isBob();  // true
    "Mary".isBob(); // false

    Array.prototype.hasBob = function() {
      return this.indexOf('Bob') > -1;
    };

    ["Bob"].hasBob();   // true
    ["Mary"].hasMary(); // true

    Element.prototype.isBob = function() {
      return this.hasClass('bob');
    };

    Event.prototype.isBob = function() {
      return this.target.hasClass('bob');
    };

    Document.prototype.hasBob = function() {
      return this.find('.bob').length > 0;
    };

    Xhr.prototype.getBob = function() {
      return this.load('/bob');
    };

You've got the picture. Basically any class in RightJS can be extended this
way. But it is not 1999 anymore and we have much more for you to play with.


## Ruby Style Mixins, :mixins

First of all, all the classes in RightJS support Ruby style functionality
injection using shared modules. If you are not familiar with the terminology
don't get scared it is very simple. Say you have a hash of commonly used
functions like this one

    var BobOrNot = {
      hasBob: function() {
        return this.indexOf('Bob') > -1;
      },

      hasNoBob: function() {
        return !this.hasBob();
      }
    };

We call such hashes a `shared module` or shortly `mixin`. Manly, because it's
a module and you can share it by injecting into other classes like that

    String.include(BobOrNot);
    Array.include(BobOrNot);

    "Bob".hasBob();    // true
    ["Bob"].hasBob();  // true

    "Mary".hasBob();   // false
    ["Mary"].hasBob(); // false

Using `.include()` you can extend any units in RightJS and you also can feed
them with several modules at once.

    Element.include(Module1, Module2, ...);
    Number.include(Module1, ..);
    Window.include(....);
    Xhr.include(...);
    Fx.include(...);

This way you can easily share functionality between any classes including your
own and keep your extensions library clean and organized


## Class Level Extensions, :class

As you saw above, you can extend any class instances with additional
functionality using the `.include()` method. But there is also another method
to extend the class itself. It's called `.extend()`

    String
      .include({ method1: function() {} })
      .extend({  method2: function() {} });

    // as the result you'll have the following
    "string".method1();
    String.method2();

The `.extend()` method also can take several modules if you need.


## Post Injection Callbacks, :callbacks

Then, there is also post-injection callbacks support. You might need it in
case if you want to use the same module with different classes that have
different API.

For that reason you can add into your modules, methods named like
`selfIncluded` or `selfExtended` (underscored versions `self_included` and
`self_extended` are also supported). Once your module was injected into a
class this method will receive the class as a parameter, and then you will be
able to adjust the the things to make it working.

For example. Say, for some reason I want to use that `BobOrNot` module not
just with the {String} and {Array} classes, but also with {Element} and
{Document} instances as well. I don't know, maybe I want some common
polymorphic interface. I can do that easily using the post-injection callbacks
like so

    var BobOrNot = {
      selfIncluded: function(klass) {
        if (klass === Element) {
          Element.prototype.hasBob = function() {
            return this.hasClass('bob');
          };
        } else if (klass === Document) {
          Document.prototype.hasBob = function() {
            return this.find('div.bob').length > 0;
          };
        }
      },

      // the rest of the methods...
    };

    // now we can inject the module anywhere
    String.include(BobOrNot);
    Array.include(BobOrNot);
    Element.include(BobOrNot);
    Document.include(BobOrNot);

Note though, the callback method itself won't be transferred to the class, the
`.include()` method will simply skip it.


## Methods Overloading, :overloading

And the last topic for this article. It doesn't have anything to do with
RightJS itself, but it is a frequently asked question, so I'll just show how
you do that.

Sometimes you need to not just insert a new method, but overload an existing
one. And not just overload, but you also might want to call the original
method on some conditions. You can do the trick the following way

    var old_append = Element.prototype.append;

    Element.prototype.append = function() {
      if (my_conditions) {
        // do something special in here
      } else {
        return old_append.apply(this, arguments);
      }
    };

As you can see the trick is simple. You just store the old method in some
variable of yours, and then call it when you need by using the JavaScript's
`.apply` method.


That's all.


