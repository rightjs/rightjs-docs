# Safe Mode, Normal Mode, Semi-Safe Mode

Since the version 2.0.0 RightJS comes with a safe-mode feature, and this
article covers all the 'what' and 'how' questions related to the topic

<%= anchors_index %>

## Normal Mode, :normal

Normal mode is what you got used to in RightJS 1. In normal mode RightJS will
patch and extend the JavaScript core units like {Array}, {String}, {Function},
etc. and it also will put all the core functions and units in the global
scope.

Normal mode is basically for cases when you use RightJS as the primary
framework in your application and you want quick and fun access to everything
you need.

All the examples and documentation on this site describe RightJS in this very
normal mode.


## Safe Mode, :safe

Safe mode in RightJS is presented by a special build of RightJS, which you can
obtain at the [downloads](/download) page.

In this safe-mode, RightJS does not extend anything and does not put its
functions and classes into the global scope (except the `RightJS` object
itself). The idea of this safe-mode is to provide you with a version of
RightJS that will be transparent to the other scripts on the page, which will
allow you to use RightJS alongside with anything else, without worrying about
names or functionality collisions.

It might sound a bit complicated, but it all work very simple. Basically, you
have all the same things as in the normal mode, just within the `RightJS.`
scope.

    var element = new RightJS.Element('div');
    var Klass   = new RightJS.Class({});

    RightJS.Xhr.load('/my/url', {spinner: 'my-spinner-id'});

    RightJS.$('element-id')
      .addClass('boo hoo')
      .onClick('toggleClass', 'marked')
      .set('title', 'Boo hoo!')
      ...

    RightJS.$$('div.css-rule').each(function(element) {
      element.onClick('toggleClass', 'marked');
    });

`RightJS` is basically a normal object, you can rename it or use with a
`with` call

    var R = RightJS;

    R.$('my-id');
    R.$$('div.class');

    with (RightJS) {
      var Klass = new Class(Observer, {
        EVENTS: $w('one two three'),

        initialize: function() {

        }
      });
    }

In the safe-mode, RightJS does not extend the JavaScript core classes, but you
still can access those handy features by simply passing your data trough the
`RightJS` object like a function.

    var R = RightJS;

    'boo hoo!'.endsWith('!');    // error 'no such method'
    R('boo hoo!').endsWith('!'); // true

    4..times(function(i) {});    // error 'no such method'
    R(4).times(function(i) {});  // works perfectly

    ['any banny twenny'].random();    // error
    R(['any banny twenny']).random(); // probably a 'banny'

    R(function() {}).bind(context);

    R.Object.merge(hash1, hash2, hash3);
    R.RegExp.escape('{[<**?/]}');
    R.Math.random(1, 4);

And so on.

This way you can take a full advantage of RightJS power without interrupting
with any other things on the page.


## Semi-Safe Mode, :semi-safe

Semi-safe mode is not a really existing mode, it is more a concept RightJS
provides.

The thing is that RightJS initializes inside of it's own private space and all
the global functions and classes are simply links to the features inside of
RightJS scope.

As the result all the things that you saw in the safe-mode are available in
the normal mode as well. This way if you say write a plugin and want it to be
working in both safe and normal modes, you can write your code for the safe
mode and it will work perfectly in normal mode.

The other thing that semi-safe mode provides you with is an ability to tweak
the global functions and classes. RightJS does not dependent on those global
functions and classes anymore, because they are just external links. You can
replace or simply delete any of them, RightJS will still be working just fine.

For example, check the [jQuerysh](/plugins/jquerysh) plugin. It changes the
`$()` function behavior to the one jQuery users got used to. Now you can
easily and legally do such things with RightJS. It will be perfectly cool with
that.


