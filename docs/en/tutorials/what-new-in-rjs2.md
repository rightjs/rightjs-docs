# What's New in RightJS 2

RightJS 2 is not just a regular functionality update, but a giant leap and
basically a complete restart of the framework. We took everything you loved
about RightJS 1 and brought it to the completely new level.

Let's get through the changes, shall we?

<%= anchors_index %>


## DOM-Wrappers, :wrappers

The idea of dom-wrappers is simple, instead of providing direct access to a
dom-element, you provide a proxy object, which manipulates with the dom-unit
internally. This way we don't extend the DOM classes anymore and therefore
have a light footprint on the system and also gain stability against any
tricky functionality browsers might add to their DOM engines.

DOM-Wrappers in RightJS 2 work transparently and have all the same fancy API
as RightJS 1 dom-unit extensions. Basically you don't need to learn anything,
the code will look just the same way

    $('element').onClick(function(event) {
      this.addClass('marked');
      event.stop();
    });

    $('element').onClick('toggleClass', 'marked');
    $$('div.class').each('onClick', 'addClass', 'marked');

The only significant difference is that you won't have direct access to
element properties and will have to use {Element#set} and {Element#get}
methods

    $('element-id').id;        // -> null
    $('element-id').get('id'); // -> 'element-id'

    $('element').title;        // -> null
    $('element').set('title', 'Boo!');
    $('element').title;        // -> still null
    $('element').get('title'); // -> 'Boo!'

And you also will need to access the `document` and `window` objects via the
`$()` function.

    window.sizes;       // -> null
    $(window).sizes;    // -> function

    document.onReady    // -> null
    $(document).onReady // -> function

But, as always, there are lot more than that, because dom-wrappers in RightJS
essentially are classes, with types, inheritance and functionality injection
support, and this gives you so many fancy new things you can do with RightJS!

Check the [DOM-Wrappers Tutorial](<%=tutorial_path('dom-wrappers')%>)
and also take a look
[what's new in RightJS UI 2](<%=tutorial_path('what-new-in-rui2')%>)


## Safe Mode, Normal Mode, Semi-Safe Mode, :safe-mode

The second biggest change in RightJS 2 is how it initializes. If RightJS 1 was
just a bunch of scripts thrown together in the global scope, RightJS 2 is a
pretty much independent structure that initializes inside of its own space.

You still have all those nice quick-access functions in the global scope, but
all of them are simply links to functions inside of the `RightJS` object.
RightJS doesn't need the global functions anymore, which gives you several
options.

In normal mode RightJS 2 looks and feels just like RightJS 1, you have all the
global functions and JavaScript language extensions.

But you also have a safe-mode build, where you have everything as in the
normal mode, but with the `RightJS.` prefix, like this.

    var element  = new RightJS.Element();
    var element  = RightJS.$('element-ids');
    var elements = RightJS.$$('div.class');

In safe mode RightJS works completely transparently to the other scripts and
_does not_ extend the JavaScript language. But you still will be able to use
those extensions if you need by simply passing your variables through the
`RightJS` object.

    "Boo hoo!".endsWith;          // -> null
    RightJS("Boo hoo!").endsWith; // -> function

    (4).times;                    // -> null
    RightJS(4).times;             // -> function

And so one. All the JavaScript extensions are available this way.

RightJS also provides you with something called the `semi-safe` mode. As all
the global functions in RightJS 2 are simply links, you can allow other
scripts to replace them with something else, or you can alter them by yourself
as you pleased.

Take a look for example at the [jQuerish](/plugins/jquerysh) plugin, it
changes the `$()` function behavior to the one that familiar to jQuery users.
You can easily do those things with RightJS 2.

Check the [Safe Mode Tutorial](<%= tutorial_path('safe-mode') %>) for more
information on this topic


## Bubbling Events, :bubble

As we all know, there are quite a few particularly troubling events out there
that behave in different ways on different browsers. I'm speaking of things
like `submit`, `focus`, `blur`, `change`, etc. Some of them bubble some of
them don't, some of them bubble in different ways, which obviously doesn't
make the developer's live easier.

RightJS is here to help. Now we catch, fix and patch all those events and then
bubble them manually through the tree, so that you don't need to worry about
those things at all. There are no special names, no special arguments, no
special nothing, just write your code as all the events were one happy family

    $('element').on({
      blur:   function() { },
      focus:  function() { },
      change: function() { },
      submit: function() { }
    });

More of that, in RightJS 2 all custom events bubble too, just the same way as
any other event does. You can have as much events of your own as you're
pleased, all of them will be handled the same exact way.



## New Events Delegation API, :events-delegation

The latest versions of RightJS 1.5 already had some elements of events
delegation handling, now RightJS 2 takes over with the new, nice and cool API.

First of all the {String} class now has all the same API for events handling
as the {Element} unit. If in RightJS 1 it was just the {String#on} method,
now you have a whole bunch of things to play with

    // it has shortcuts for standard events
    "div.class".onClick(function() {...});

    // it works with troubled events
    "div.class".onFocus('addClass', 'hovered');
    "div.class".onBlur('removeClass', 'hovered');

    // it works with custom events
    "div.class".on('my-event', 'addClass', 'my-class');

    // you can check if something is observed
    "div.class".observes('click');   // -> true

    // and you can remove listeners the same way
    "div.class".stopObserving('click');

And that is not all, because the {Element} class received a whole new API
specifically for events-delegation handling. Now you can play with events
delegation not only at the document level, but at any level you like

    $('my-list').delegate('click', {
      'li.completed':  completed_items_handler,
      'li.incomplete': incomplete_items_handler,
      ...
    });

    // and you can check if an element delegates events
    $('my-list').delegates('click'); // -> true

    // and certainly you can make it stop
    $('my-list').undelegate('click');

For more information see the [API Documentation](/docs/element#delegate) and
[Events Delegation Tutorial](<%= tutorial_path('events-delegation') %>)


## Stop Events By Return False, :stop

There is a thing upon which many folks stumble. When you specify your event
listener as an element attribute, you can use `return false` to prevent the
default event handling, like that

    var element = document.getElementById('my-element');

    element.onclick = function() {
      return false; // will stop the click
    };

But when you do the same thing by putting your listener into the listeners
queue with the `addEventListener`, method it doesn't work.

    element.addEventListener('click', function() {
      return false; // have no effect
    }, false);

In this case you need to receive the event object and explicitly tell it that
you love it so much and want it to stop and stay with you forever. Which is
kinda annoying.

Here at RightJS, we are in business of setting thing right and being nice to
our users. So the {Element#on} function was changed a bit and now when you
`return false` in your listener, RightJS will understand that you actually
want your event to be stopped and it will stop that sneaky bastard for you.

    $('my-element).onClick(function() {
      return false; // will effectivly stop the event
    });


## Cross-Frame Safe, :frames

Because of all the DOM-Wrappers and safe-mode changes, RightJS is now
officially cross-frame safe. It all works pretty much transparently for the
API, and you can navigate through other frames the same way you work with the
main document

    $(other_document).find('div.class').each(function(element) {
      element.onClick('toggleClass', 'marked');
    });



## JSONP Support

Besides the XHR and IFramed tunnels, the {Xhr} class now also supports the
JSONP format out of box. And it all nice and civilized, all you need to make
a jsonp request is to specify the `jsonp` option

    Xhr.load('/mysite.json', {
      jsonp:      true,
      spinner:    'my-spinner',
      onComplete: function() {
        // and here you have your json data
        allert(this.json.somstuff);
      }
    });

You also can specify any name of the callback parameter instead of the `true`
value, all the other things are pretty much the same as for any normal {Xhr}
request.



## New DOM Level Methods, :new-dom-methods

As RightJS 2 switched from direct dom-units access to dom-wrappers, it opened
a door for a whole new list of things and method names which we couldn't have
before because of name conflicts withe native functionality.

Some methods were simply renamed (the old ones will still be available for a
while):

 * {Element#select} -> {Element#find}
 * {Element#subNodes} -> {Element#children}
 * {Element#sizes} -> {Element#size}
 * {Window#sizes} -> {Window#size}
 * {Document#select} -> {Document#find}
 * {Form#getElements} -> {Form#elements}

Then, there are some new methods

 * {Element#html} - a bidirectional method to get/set the `innerHTML` property
 * {Element#append} - a shortcut for {Element#insert}
 * {Element#clone} - clones the element with all the content
 * {Element#document} - returns the {Document} object for the element
 * {Element#window} - returns the {Window} object for the element
 * {Form#input} - returns an {Input} field by name
 * {Form#submit} - tunnels the form.submit method
 * {Form#reset} - tunnels the form.reset method

The `Form.Element` class was renamed to {Input}. Now it has a unformed
constructor and you can specify all sorts of `type` attribute

    new Input(); // type == 'text' by default
    new Input({type: 'password'});
    new Input({type: 'textarea'});
    new Input({type: 'select'});
    new Input({type: 'multi-select'});

It also has several new methods

 * {Input#form} - returns the {Form} object which it belongs to
 * {Input#value} - a bidirectional method to get/set values
 * {Input#disabled} - tunnels the `disabled` property
 * {Input#checked} - tunnels the `checked` property

There is also a new events-delegation API for the {Element} class which is
described in a chapter above.


## New JavaScript Core Methods, :new-js-methods

The JavaScript core units also have received a few new handy methods

 * {Array#reject} - the opposite for {Array#filter}
 * {Array#min} - the smallest value in the array
 * {Array#max} - the biggest value in the array
 * {Array#sum} - a sum of all the elements in the array
 * {Number#min} - limits the number by a minimal value
 * {Number#max} - limits the number by a maximal value



## Class Methods Prebinding, :prebind

The {Class} unit now allows you to prebind methods to the contexts of its
instances. The idea is simple, say if you use an instance methods in other
contexts, you always need to bind them manually to the instances, like that

    var Klass = new Class({
      name: 'Klass'
      alert: function() {
        alert(this.name);
      }
    });

    var inst = new Klass();

    $('element').onClick(inst.alert.bind(inst));

It is quite annoying and sometimes you forget it, which leads to all sorts of
bugs, and so one. Say no more! Because now you can make the class to
automatically prebind specified methods on instance, like that

    var Klass = new Class({
      prebind: ['method1', 'method2', 'method3']
    });

After that you can use those methods as is and they will be automatically
called in the context of the instance they belong to.

Check the [OOP Tutorial](/tutorials/object-oriented-programming) for more
info about classes in RightJS.



## Performance Updates, :performance

Every new version of RightJS brought some performance updates keeping RightJS
on the top of the list, and certainly RightJS 2 is not an exception.

First of all we optimized the important things like dom-manipulation and
events binding. Somewhere it is more noticeable, somewhere less, but judging
by the latest versions of FF and Opera it is about 25% boost comparing to
RightJS 1.5.6

Elements construction got faster by about 30% in Opera. And because we
don't extend dom-elements anymore the speed of construction and elements
access went sky-rocketing in the IE6 and IE7 browsers.

Check the very popular [benchmarks page](/benchmarks) for more details.



## New Packing System and Size Updates, :packing

With all the fancy new features in RightJS 2, we had quite an impact on the
size of the builds, so we took care of those things too.

First of all, now we initialize RightJS in a private scope, which allowed us
to pack things much tighter. Secondly we switched from the FrontCompiler to
Google's Closure Compiler. Thirdly, I got rid of the packed versions of the
builds and concentrated on how it will be compressed by gzip on the server
side.

The result is the following.

RigthJS 1.5.6 weighs 42k minified and 14.5k gzipped

RightJS 2.0.0 weighs 44k minified and 15.5k gzipped

Which I think, is a pretty darn good exchange for all the new features we have
in RightJS 2. And you should agree with me and we shall all live happily ever
after.


That's all we have folks. Have a good fun with it!

