# Functional Programming
<% set_unit_scope('Function') %>

RightJS is a multi-paradigm framework and being such a tool it provides
several standard functional programming features like binding, currying and
chains.


## Currying, :currying

Currying is a simple FP concept, which means that if you have one function
that accepts a number of arguments, you can create another function that will
automatically preset some part of those arguments for you.

A classical example. Say you have a function that multiply two numbers

    var multiply = function(x, y) {
      return x * y;
    };

    multiply(2, 3); // -> 6

Now basing on this function you can create another function that will always
preset the first argument as `2` and as the result double incoming numbers

    var double = multiply.curry(2);

    double(2); // -> 4
    double(3); // -> 6
    double(4); // -> 8

Or you can create another function that will triple the things

    var triple = multiply.curry(3);

    triple(3); // -> 9

The main idea in here is that you have one basic function that contains the
actual logic and then can have several other functions whose only purpose is
to keep some arguments and create different versions of the basic logic.


## Currying Example, :curry_example

Currying is particularly useful when you don't have any appropriate place to
keep references to some variables or you need them only once, or you'd like to
create different versions of the same basic function.

A dummy example. Say you have some menu, and a function that logs a number.

    <ul id="menu">
      <li>One</li>
      <li>Two</li>
      <li>Three</li>
    </ul>

    var log_index = function(index) {
      console.log(index);
    };

Now you want to attach this log function to every item on the list the way
that when the user clicks any of them the function logged the index of the
item on the list.

You could simply create a function that will grab all the list items and find
the index of the clicked one. But what if the list items might be tossed
around and you need their original indexes?

You can easily solve the problem using the currying feature like this.

    $$('#menu li').each(function(item, index) {
      item.onClick(log_index.curry(index));
    });

With currying you simply create a bunch of anonymous functions that will
keep the arguments inside.


## Left And Right Currying, :left_and_right_curry

There are two types of currying feature, left and right. The left one is what
you've just seen, it is when you add your values on the left side of the
arguments list. And the right currying, as you understand, is when you add
your values on the right side of the list. For example:

    var minus = function(x, y) {
      return x - y;
    };

    minus(4, 2); // -> 2

    // left currying
    var four_minus = minus.curry(4);

    four_minus(2); // -> 2
    four_minus(3); // -> 1

    // right currying
    var minus_four = minus.rcurry(4);

    minus_four(6); // -> 2
    minus_four(5); // -> 1

As you can see, in the first case we subtract any given number from `4` and
in the second case we do the opposite, subtract `4` from any given number.


## Binding, :binding

Binding is another concept, which in case of FP means that you associate a
function to be called in a context of some particular object.

For example, you have two objects that represent two persons and a function
that builds and logs a person's full name.

    var karl = {firstName: 'Karl', lastName: 'Marx' };
    var bill = {firstName: 'Bill', lastName: 'Gates'};

    var log_name = function() {
      console.log(this.firstName + " " + this.lastName);
    };

Note, that the function refers to `this` as it was an actual part of any of
those objects. Then in JavaScript you can call this `log_name` function in the
context of  any of those objects, like that

    log_name.call(karl); // -> 'Karl Marx'
    log_name.call(bill); // -> 'Bill Gates'

Using binding you can create another function that will call the original one
in any given context.

Say you have two buttons and you want one of them log on click 'Karl Marx',
and another one log 'Bill Gates'. You could create anonymous functions
manually and call the `log_name` function explicitly, but you could use
binding feature as well

    karl_button.onClick(log_name.bind(karl));
    bill_button.onClick(log_name.bind(bill));

This way you isolate your original function and despite the fact that the
{Element} callbacks will be called in the context of the element where they
are attached, when you use binding you can be sure that your original function
will be called in the specified context.


## Binding + Currying, :binding_and_currying

Binding and currying often go alongside and in RightJS you can use them
together at the same time.

Say you have the same two 'Karl' and 'Bill' buttons.

    <input type="button" id="karl" value="Karl" />
    <input type="button" id="bill" value="Bill" />

But this time your log function takes an argument that refers to what kind of
a person each of them is

    var log_name = function(kind) {
      console.log(
        this.firstName + " " + this.lastName + " is a " + kind
      );
    };

You can use binding and currying at the same time to solve the problem

    $('karl').onClick(log_name.bind(karl, 'communist'));
    $('bill').onClick(log_name.bind(bill, 'capitalist'));

In this case our `log_name` function will be called in contexts of the correct
objects and at the same time curry some additional argument that will be sent
into the function when some of the buttons was clicked.


## Binding + Currying + Events, :binding_currying_and_events

Lets move this feature a bit further. Say you have all the same as in the
previous example, but instead of buttons you have links, like that

    <a href="#" id="karl">Karl</a>
    <a href="#" id="bill">Bill</a>

In this case you will need to stop the click event to prevent the page from
jumping up. The problem is that the event attribute always goes first and your
callback function should look like that

    var log_name = function(event, kind) {
      event.stop();
      console.log(...);
    };

But when you bind it using currying at the same time, your callback will
receive the currying string value as the first argument instead of the dom
event object.

To handle such cases {Function} has another method called
{#bindAsEventListener}. When you bind a callback with this method the new
function will always treat the first argument as an event object, collecting
and bypassing it where it should be.

    $('karl').onClick(log_name.bindAsEventListener(karl, 'communist'));
    $('bill').onClick(log_name.bindAsEventListener(bill, 'capitalist'));

In this case, the actual callback will automatically pass the dom-events as
the first arguments and the callbacks will work as they supposed to.

## Chain Of Calls, :chains

And the last simple FP concept for this tutorial. Chain of calls.

Chains are for the case when you need to call several functions in some
particular order, one after another. You can create chain using the {#chain}
method

    var first  = function() { console.log(1); };
    var second = function() { console.log(2); };
    var third  = function() { console.log(3); };

    var chain = first.chain(second).chain(third);

    chain(); // -> 1, 2, 3

The idea is that you create a new function that calls another function after
itself, and then another and another. Once you have this end `chain` function
you can safely send it wherever you want and be sure that when it invoked all
your functions will be called in that exact order.

You also can use chains and currying at the same time, like that

    var log_num = function(num) { console.log(num); };

    var chain = log_num.chain(log_num, 2).chain(log_num, 3);

    chain(1);  // -> 1, 2, 3

In this case we have one function and we chain it after itself twice, each
time with different values to curry.
