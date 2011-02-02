# DOM-Wrappers in RightJS 2

RightJS 1 was a pretty simple system, we extended native dom-units directly
and always worked with actual dom-elements. That a pretty convenient approach
but sadly it is pretty naughty and risky business, because first of all it
doesn't leave any space for other scripts on the page and can be easily
screwed by browser updates.

And as RightJS is known for setting the things right, with the version 2.0.0
we switched from direct elements access to dom-wrappers.

<%= anchors_index %>


## What are DOM-Wrappers?, :what

A dom-wrapper is basically a proxy object that keeps the real dom-element
somewhere inside and then provides you with some interface through which you
suppose to do all your work.

This way you keep all your fancy methods and extensions in one isolated space
and don't extend the actual dom-element, which allows other scripts on the
page interact with the same elements without even noticing the presence of
your extensions.

With dom-wrappers, you also provide a long term stability for your scripts,
because as all your extensions are in a separated space, any new native
methods that browsers might add couple of years later, will not affect your
proxy objects.



## How Does It Look Like in RightJS?, :how

There are many ways to implement dom-wrappers, and, as it usually happens over
here, we choose the right one.

Dom-wrappers in RightJS 2 have the same exact API as dom-extensions in
RightJS 1, and because of that it looks and feels exactly the same way, like
nothing happened

    $('element').addClass('marked');

    $('element').onClick(function(event) {
      event.stop();
      this.toggleClass('marked');
    });

    $$('div.class').each(function(element) {
      element.addClass('my-element');
      // .....
    });

    $(raw_dom_element).removeClass('marked');

It all practically the same as it was before, except the fact that instead of
the actual dom-element you work now with proxy objects. And as the result,
most of your code should be in working condition after you switch to
RightJS 2.

There are also couple of differences. First of all, because you work with
proxy objects, you don't have direct access to element properties and should
use the {Element#get} and {Element#set} methods.

    $('element-id').id;        // -> null
    $('element-id').get('id'); // -> 'element-id'

    $('element').title;        // -> null
    $('element').set('title', 'Boo!');
    $('element').title;        // -> still null
    $('element').get('title'); // -> 'Boo!'

The second biggest difference is that now you should access the `window` and
`document` objects via the same `$()` function if you need access their
extensions

    window.sizes;       // -> null
    $(window).sizes;    // -> function

    document.onReady    // -> null
    $(document).onReady // -> function

And there are also several additional {Element} methods to help you deal with
all sorts of links and attributes, you can find the list at the
[what's new in RightJS 2](/tutorials/what-new-in-rjs2#new-dom-methods) page.



## Raw DOM Objects Access, :raw

When you work with your document, RightJS will automatically and transparently
wrap most of the dom-objects when you access them, that includes dom-elements
windows, documents and events.

And despite the superb RightJS API, from time to time you might need to access
the actual raw dom-object, and we have a conventional way to do that.

Every dom-wrapper in RightJS has the `_` property, which link it to the raw
dom-object it wraps.

    $('my-div')._  // -> DIV element
    $(window)._    // -> window object
    $(document)._  // -> document object

    $(element).onClick(function(event) {
      event._      // -> the dom-event object
    });

This is the official and the right way to do that, use it any time you feel
like it.


## DOM-Wrappers == Classes, :classes

Now to the good parts. Because we have them.

All dom-wrappers in RightJS are created by the {Wrapper} unit, which is
essentially the same good old {Class}, just tuned a bit for the task of
dom-objects wrapping. Which means that first of all we have normal types

    $('my-div') instanceof Element
    $(document) instanceof Document
    $(window)   instanceof Window

It also supports inheritance. Say for example we have two more units in the
system {Form} and {Input}. Both of them are inherited from the {Element} class
and it all works correctly when you check the object types


    $('my-div') instanceof Element; // true
    $('my-div') instanceof Input;   // false
    $('my-div') instanceof Form;    // false

    $('my-form') instanceof Element; // true
    $('my-form') instanceof Input;   // false
    $('my-form') instanceof Form;    // true

    $('my-input') instanceof Element; // true
    $('my-input') instanceof Input;   // true
    $('my-input') instanceof Form;    // false

You can extend each of the classes separately using functionality
injection and the extensions will correctly apply to the inheritance structure

    Element.include({
      global_method: function () {}
    });

    Input.include({
      inputs_only_method: function() {}
    });

    Form.include({
      forms_only_method: function() {}
    });

You can extend any of the dom-wrappers in the system {Element}, {Input},
{Form}, {Window}, {Document}, {Event}



## Custom Types, :custom

The system of dom-wrappers in RightJS is an open structure and you're free to
create your own types that will handle elements with certain tags. For example
you can add the `TABLE` elements specific wrapper like so

    var Table = new Class(Element, {
      sort: function() {
        // sort your table in here
      },

      load: function() {
        // overloading the Element#load
        // so it updated the TBODY part only
      }
    });

    // registering the wrapper in the system
    Element.Wrappers.TABLE = Table;

Once you've done that, any time you access a table element on your page it
will be wrapped with your custom wrapper

    $('my-table') instanceof Table;   // true
    $('my-table') instanceof Element; // true

You're allowed to override any tags you want, and add/replace any methods you
need. Once you've registered them in the {Element.Wrappers} object, RightJS
will dynamically typecast all elements you access.



## Private Wrappers, :private

Although you can create types for certain tag, as it described in the chapter
above, you're not really tied to the tags structure, you can create any number
of your own private types. Say if you like to have two wrappers for tables
that's cool with RightJS

    var Table1 = new Class(Element, {
      initialize: function() {
        this.$super('table', {'class': 'table-1'});
      }
    });

    var Table2 = new Class(Element, {
      initialize: function() {
        this.$super('table', {'class': 'table-2'});
      }
    });

    var t1 = new Table1();
    var t2 = new Table2();

This is especially useful with all sorts of widgets development. If in
RightJS 1, when you create a widget, you use the {Class} unit and incapsulate
an element inside, kinda like that

    var MyWidget = new Class(Observer, {
      initialize: function() {
        this.element = new Element();

        this.element.onClick(this._clicked.bind(this));
      },

      insertTo: function(element, position) {
        this.element(element, position)
      },

      _clicked: function() {
        // do something about the click
        this.element.addClass('clicked');
      }
    });

As you can see there quite a lot of headache with stitching the contexts of
the widget and the element, you also need to tunnel some methods so the user
could work with your widget, and so on, and so on. Those things are getting
really messy very quick.

But, you don't have to suffer anymore! Because in RightJS 2 you can define
your widget as another private wrapper, just like that

    var MyWidget = new Class(Element, {
      initialize: function() {
        this.$super('div', {'class': 'my-widget'});
        this.onClick(this._clicked);
      },

      _clicked: function() {
        this.addClass('clicked');
      }
    });

As you can see it simplifies the things alot, plus you never leave the context
of your element and therefore don't need to bind the event listeners in any
way. More of that your widget will have all the regular {Element} API baked in
by default and the users can manipulate with your widget just the same way
they manipulate with any other elements on the page

    var widget = new MyWidget();

    widget.addClass('custompization');
    widget.insertTo(document.body, 'top');
    widget.onClick(my_additional_handler);
    // and so on ....

This will allow you to create much nicer and easier to maintain widgets than
before, more of that they will be much compacter and simpler to understand.



## Wrappers Caching, :caching

And some more fancy stuff to finish you up.

When you play with dom-wrappers, RightJS keeps the track of all the wrappers
you create and then automatically uses them when you access the dom-elements
in any way.

    var widget = new MyWidget();
    widget.set('id', 'my-widget');
    widget.insertTo(document.body);

    // now you can access the element by id
    $('my-widget') instanceof MyWidget; // true

    // or any other way, for example
    $$('div.my-widget').last();         // -> MyWidget
    $(document.body).children().last(); // -> MyWidget
    ....

To remove your wrapper from the cache, you can either reinitialize the raw
element with any wrapper, or remove the cache by an UID key.

    var widget = new MyWidget();
    widget.set('id', 'my-widget');

    $('my-widget') instanceof MyWidget; // true

    // replace the cache by instatiation
    widget = new Element(widget._);
    $('my-widget') instanceof MyWidget; // false

    // clean cache directly
    var uid = widget.uuid();
    delete(Wrapper.Cache[uid]);

This probably concludes the tutorial. Have fun!
