# What's New In RightJS 2.2

RightJS 2.2 is the next major update of the RightJS core and plugins, it
brings lots of new small and large changes, fixes, optimizations and certainly
sweet little features.

<%= anchors_index %>


## Native CSS Transitions Support In Fx, :fx

Native css-transitions were out there for a while now, we have them in Safari,
Chrome, FF4 and latest versions of Opera, so it's time to put them in a good
use for real.

RightJS now uses this native feature to handle element animations like
{Element#morph}, {Element#slide}, {Element#fade} and so one. There is
practically no change in the existing API, RightJS will automatically
determine if the feature is supported and use it internally when available.

Currently we use native css-transitions as default engine on Safari, Chrome
and FF4. Although the feature is supported in Opera, it was disabled by
default in this browser because of incomplete support and poor performance.

To handle this sort of things there is a new option in the {Fx} module called
`'engine'`. You can set it to `'javascript'` for disabling native support or
you can set it to `'native'` for enabling native feature support anyways.


## Fx.Attr Class, :attr

The built in {Fx} collection of RightJS was extended with one more class
{Fx.Attr}, which is used to gradually change all sorts of element
attributes. Currently, it is used as the parent for the {Fx.Scroll} class, but
generally it can be used for any sort of element properties


## Better UJS, :ujs

The UJS module of RightJS was reworked in many ways, first of all it was
optimized to provide better response time. And secondly, UJS
handlers are now react not to the specified elements only, but to all their
subelements as well. Just like it happens with normal event listeners.

For example, say if you have an elements structure like that

    <div class="something">
      <div class="corners">
        <div class="paddings">
          The actual text
        </div>
      </div>
    </div>

And you attach your UJS listener to the top element like this one

    "div.something".onClick('toggleClass', 'clicked');

In previous versions of RightJS it would react only if the user clicks the
`div.something` element itself, now it will also react to clicks on any
internal elements as well, which is more standard/predictable behavior and
very handy in many situations.


## Mouseenter/Mouseleave Handlers, :mouseio

Since version 2.2 RightJS will provide the `mouseenter`/`mouseleave` events
emulation out of the box, which are very useful say with dynamic menus, popups
and all sorts of things.

There is nothing special in our implementation, no need for any specific
methods or anything. Just use those two `'mouseenter'` and `'mouseleave'`
names as you do with any other events

    $('element').on('mouseenter', func1);
    $('element').on('mouseleave', func2);

    // or with shortcuts
    $('element').onMouseenter(func1);
    $('element').onMouseleave(func2);

And it also works with UJS features as well

    "div.something".onMouseenter(func1);
    "div.something".onMouseleave(func2);


## DOM-Shortcuts For Strings, :shortcuts

Everyone who tried our {String#on} shortcuts to handle UJS features finds it
quite weird, but likes it right away. RightJS 2.2 extends the feature and now
allows you to run any dom-wrapper methods from strings.

There are basically two modes for that. First is a collection alteration.
When you call any method that changes an element it will be applied to _every_
matching element.

    "div.something".addClass('boo-hoo');
    "div.something".update('Boo Hoo!');
    "div.something".highlight();
    "div.something".remove();
    // ...

You also can call data-retrieval methods to access attributes, navigate and so
one. In this case the string shortcuts will return data from the _first_
element that matches the rule

    "div.something".get('id');  // -> String
    "div.something".parent();   // -> String
    "div.something".children(); // -> String
    // ...

Basically the deal is pretty much the same as they have in jQuery. So if you
managed to scramble your brains over it, but still love RightJS, this is your
chance to be happy :)


## Class And Wrapper Merge, :class

When dom-wrappers were first introduced in RightJS 2.0 they were monkeying
existing {Class} unit, but presented a completely separated block of code
specifically tuned to handle dom wrapping processes.

In RightJS 2.2 dom-wrappers and {Class} unit were properly merged into a
single, uniformed structure, with the {Class} unit being on the top of the
hierarchy. That gives us a few interesting advantages.

First of all now you can use the standard `new Class` calls no matter whether
you define a dom-wrapper or a plain class:

    var MyKlass = new Class({
      // ...
    });

    var MyElement = new Class(Element, {
      // ...
    });

All of them will have the same same features and abilities, for example now
you can use `'prebind'` lists with dom-wrappers

    var MyElement = new Class(Element, {
      'prebind': ['method1', 'method2'],

      method1: function() {},
      method2: function() {}
    });

Another thing that this merge had produced is that the {Class} unit now is
the top class of everything in the system.

    var MyClass   = new Class({});
    var MyElement = new Class(Element, {});

    new MyClass('param') instanceof Class; // -> true
    new MyElement('div') instanceof Class; // -> true

This provides some additional features, like for example now you can always
check objects if they are based on RightJS technology. Or you also might have
global, system level changes by tweaking the {Class} unit and so one.


## Supercalls On Modules, :supercalls

Another result of the {Class} unit updates is that now it supports supercalls
on injected modules as well as on inherited classes. The problem here is that
sometimes you need to overload methods right in a class without using
inheritance.

RightJS functionality injection feature allows you to do that, but calls to
the original methods were quite tricky, you had to stash them somewhere and
then reapply manually. Those days are gone. Now you can make supercalls on
injected methods the same exact way as you do on inherited classes

    var MyClass = new Class({
      method: function() {
        return 'original';
      }
    });

    // injecting the first module
    MyClass.include({
      method: function() {
        return this.$super() + '+module1';
      }
    });

    // injecting another one
    MyClass.include({
      method: function() {
        return this.$super() + '+module2';
      }
    });

    new MyClass().method(); // -> 'original+module1+module2'

It all nice and civilized now, no need to hack this thing around anymore!


## IE8 Kicked Out In the Olds Module, :ie8

A consilium of Russian nuclear physicists had decided that IE8 is an old pail
of sweet goodness and so, it was kicked out of the core into the olds module.

There are several good reasons for that. First of all IE8 has a lack of proper
CSS3 selectors support, secondly it still has some issues with the `change` /
`submit` events, thirdly it constantly falls back into the IE7 mode and
downloads the olds module anyways.

As the result, now RightJS core basically represents pure W3C browsers support
and has almost no IE related hacks in it anymore.


## Full Stack CSS3 Support, :css3

With IE8 being kicked out into the olds module, we finally had a chance to fix
its problems with CSS3 selectors.

So now, all the standard CSS3 selectors are officially supported in all the
browsers. Congratulations!


## Object.merge With Deep Merge, :object

The {Object.merge} method was updated and now performs a proper deep-merge
recursively merging all the inner hashes of incoming objects.

    Object.merge(
      {a: {b: {c: 'd'}, e: 'f'}},
      {a: {b: {c: 'd', e: 'f'}}}
    );
    // -> {a: {b: {c: 'd', e: 'f'}, e: 'f'}}

If you need the old one-level merging functionality, please use the `$ext`
function out of the {Util} library


## Element#index method, :index

The {Element} class had received one more simple method called {Element#index}
which returns the index of the element among its siblings

    <ul>
      <li id="one">One</li>
      <li id="two">Two</li>
    </ul>

    $('one').index(); // -> 0
    $('two').index(); // -> 1

Pretty standard.


## Raw DOM Search, :search

The dom-search methods of RightJS, like {Element#find}, {Document#find} or
`$$` now can perform a quick raw dom-elements search without wrapping them
into the {Element} class instances.

To use the feature, just pass `true` right after the css-rule of yours

    $('my-element').find('div.something', true); // -> [HTMLElement, ...]
    $(document).find('div.something', true);     // -> [HTMLElement, ...]

    // or like that
    $$('div.something', true); // -> [HTMLElement, ...]

Feel free to use it at any moment when you need a quick dom-search without
using the wrappers.


## IE Native UID, :uid

In RightJS 2.0 we used our own UID sequencing feature to ensure single
instances of dom-wrappers all over the page. It is a pretty much standard
procedure, but it has a drawback, those UID markers appear as element
attributes in IE.

In RightJS 2.2 we have reused IE's native UID sequencing feature and now
have practically no footprint on the system at all. It's all nice and clean
now.


## Deprecations Removed, :deprecations

All sorts of old deprecations were removed.

    Element#select   -> Element#find
    Element#subNodes -> Element#children
    Element#sizes    -> Element#size
    Element#document -> Element#doc
    Element#window   -> Element#win

    Form#getElements -> Form#elements

    Document#select  -> Document#find

    Window#sizes     -> Window#size
    Window#onReady   -> Document#onReady

    new Wrapper      -> new Class

You might want to check your code if you used any of those


## Optimizations And Cleanups, :optimizations

Traditionally, we also have some optimizations and cleanups in RightJS core
and plugins.

First we've optimized dom-wrappings and search processes, you might not notice
much of a difference in the `TaskSpeed` test, but those changes had a great
deal of impact on things like {Element#match} and {Event#find}. Which make
UJS and general events handling to work faster and as the result make your
apps more responsive.

Secondly, the {Fx} engine was also optimized, it certainly depends on
a complexity of things you do, but in general, our effects now run a bit
smoother. In Opera our javascript based engine works even faster than the
native css-transitions :)

Thirdly, lots of code compression optimizations took place. Despite of all the
new features, the size of the builds practically didn't change.

RightJS 2.0 weighs `15.5k` gzipped

RightJS 2.2 weighs `15.6k` gzipped

And last, but not least, RightJS was cleaned up from all the nasty `eval` and
`document.write` hacks that we inherited from RightJS 1, so that now RightJS
is nice and clean and ready to be used with all those asynchronous scripts
loaders like RequireJS and so one.


&nbsp;

That's all we have, enjoy!