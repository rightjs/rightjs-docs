# Top 10 Features of RightJS

This article meant to give you a quick overview of 10 most valuable features
of RightJS.

## Syntax

RightJS tries not to invent any new method names, instead of that it uses the
naming principles that are already in use. It has a really clean, compact and
mostly familiar syntax.

This way RightJS provides a very low entry level, if you already know any other
JavaScript frameworks like Prototype, MooTools or jQuery, most principles and
names will be familiar to you. And if you also know Ruby and/or Python there will
be practically nothing to learn, you'll be able to jump in almost immediately.


## Calls By Name

Calls by name is a fancy way of specifying callbacks in RightJS. The idea is
pretty simple, instead of writing some dummy function that calls the actual
method, you specify the callback method name as a string, for example

    // usual approach
    $('element').onClick(function() {
      this.hide();
    });

    // the same thing with calling by name
    $('element').onClick('hide');

    // or with some arguments
    $('element').onClick('addClass', 'clicked');
    $('element').onClick('update', 'with some text');

This feature also works with {Array} instances and really helpful for example
in case of element collections processing.

    $$('#my-form textarea').each('disable');

    $$('div.title').each('update', 'with some text');

    // filtering and collecting
    var enabled = $$('input').filter('enabled');
    var classes = $$('div').map('className');
    var some_id = $$('div').map('id').compact().first();

    // you also can combine this with events processing
    $$('ul#todos li').each('onClick', 'toggleClass', 'marked');

Note, the actual interface doesn't change, you don't need to memorize any new
methods, you simply join things together. That make the code much cleaner,
compacter and more readable.

[Read more about this feature](/tutorials/call-by-name)


## Later JavaScript Specs Support

There are several new methods for {Array}, {String} and {Function} classes,
that are specified in later JavaScript/ECMAScript version, things like
{Array#filter}, {Array#map}, {String#trim}, etc. Some browsers already
support them, some old don't and will not.

RightJS fixes the situation and adds those methods to browsers that don't
have them, this way you can have all the advantages of the technology
advancement without worrying if some browser supports those features.


## Native Unit Extensions

Native unit extensions are arguable feature, but as 99% of applications
use only one framework and we specifically targeting Ruby/Python folks,
those extensions come extremely handy, because most server side developers
are already know them and could have a great deal of use out of them.

RightJS tries to find a balance between staying true to the JavaScript
roots and adding new features. It adds only standard and commonly used
methods, like {Array#compact} or {String#endsWith} and it implements
them using strictly the original semantic and behavior.

RightJS doesn't define any new language over JavaScript, it simply
civilizes it and makes it more useful for server side programmers.


## Simplified Numbers Handling

It is the second decade of 21-st century already, but numbers processing
in JavaScript still remains like it was designed in 90-th.

RightJS tries to fix the situation by extending {String} and {Number}
units so the numbers processing was more comfortable and easy.

    // strings to numbers conversion
    '123'.toInt();   // -> 123
    '1.3'.toFloat(); // -> 1.3

    // numbers handling
    1.4.floor(); // -> 1
    1.4.ceil();  // -> 2
    1.4.round(); // -> 1

It's a simple extension but it makes the code much more cleaner and
simpler when you need to crank some numbers in your application.

[Read more about numbers processing in RightJS](/tutorials/work-with-numbers)

## Baked in Spinners Handling

Being a task-oriented framework, RightJS tries to get rid of as many
routine operations as possible. One of the examples is the built-in spinners
handler.

Instead of writing dummy callbacks and write them to AJAX events, you can
simply refer your spinner element with any {Xhr} request options. RightJS will
automatically find them and use as spinners.

    Xhr.load('/url.html', {
      spinner: 'my-spinner'
    });

    $('my-form').send({
      spinner: 'that-spinner-element'
    });

In case of AJAX forms you don't even need to specify spinners either. Before
sending a form via AJAX, RightJS checks if it has an element inside with a class
name `'spinner'` and if finds one, it will automatically use it as a spinner
while sending that form.


## Forms Uploading Handling

RightJS also has a built-in AJAX forms support. All you need to do in order to
send a form via AJAX is to call the {Form#send} method. This will
automatically handle all the routine operations, like locking/unlocking form,
collecting data, displaying/hiding spinners, and so one.

More of that, if your form has files to upload, RightJS will automatically
try to submit your form via a hidden IFrame element. The API in this case
won't change at all. This way for you as a developer there is no
difference if you have or have no files on your form.



## Object Oriented Programming

RightJS is a multi-paradigm framework with an extensive object-programming
features support. {Class} in RightJS supports everything you need to write
serious OO applications. It has inheritance, functionality injection,
shared modules and so one.

    var Klass = new Class(AnotherClass, {
      include: Module1,
      extend:  Module2,

      initialize: function() {
        //....
      }
    });

[Read more about OOP in RightJS](/tutorials/object-oriented-programming)


## An Open Sandbox Architecture

While frameworks like jQuery are after safety and close things behind
anonymous namespaces, RightJS takes its inspiration in dynamic languages
like Ruby and Python. The main target of RightJS is not safety but an open
and flexible architecture.

The power of languages like Ruby is in their openness and ability to extend
and bend things around, in ability to adjust and tune the language by itself
to the needs of your task. And this is exactly what we are doing with RightJS.

RightJS is build upon proper OOP design with inheritance and functionality
injection features. It has shared modules and provides access to almost all
its internal methods. It also provides tools to quickly extend any native
units, register new dom-methods, create your own classes and do all sorts
of hacking.

If you love Ruby, you will love RightJS as well.



## Uniformed Events and Options Handling

RightJS makes a big deal out of unification. It has unified interfaces
to handle events and options all across the framework and its plugins.
More of that RightJS provides shared modules that you can use in your
applications and make them consistent with RightJS main code and interfaces.

There are few reasons of doing that and all of them are simple. First of all
you don't need to learn anything and can count on all the same interfaces no
matter what are you working with, some third party code, a plugin or a
dom-element.

Secondly it makes all the code around consistent with each other, and if
you learn one module or a plugin, you will mostly know what to do with all
the others.

More of that, providing shared modules that developers can use in
their own applications, RightJS vanishes the border between the system
and the application. That brings order and similarities in user applications
so that the developers could more easily understand and participate in
each others work

Read more about [uniformed events handling](/tutorials/uniformed-events-handling)
and [uniformed options processing](/tutorials/uniformed-options-handling)





