# Unobtrusive Programming And Events Delegation

This article describes how you can write unobtrusive scripts in RightJS using 
the events delegation technique

<%= anchors_index %>

## What's Events Delegation?, :what

Events delegation is another way of DOM events handling on web-pages. It uses
the dom-events bubbling effect to handle several elements in one place.

For example, say you have the following web-page

    <html>
      <body>
        <ul id="todos">
          <li>Wake up</li>
          <li>Shave</li>
          <li>Feed the fish</li>
          <li>Take over the world</li>
        </ul>
      </body>
    </html>

Now when a user clicks on any of the `LI` elements, the `click` event will
bubble from `LI` to the `UL` element, then to `BODY`, to `HTML`, all the way
up to the `document` object.

Normally, we simply attach event listeners to the target elements itself and
take care of things locally, but generally we can catch the event at any of
the levels and then call the listener in the context of the element that
was actually clicked.

## Why Do That?, :why

There are several reasons why you might need to use the events delegation
technique.

First of all you might have a huge grid of cells, say some 50x50 table. And
you need to handle clicks on every cell simultaneously. In this case, instead
of attaching the same function 2500 times to every cell, you can attach it
only once at the table element itself and handle all clicks in one place. This
way you can drastically decrease the initialization time for your application.

The second classical usage is dynamic content cases. For example you need to
dynamically add and remove cells on that grid table in the first example. If
you handle your events on the cells level, then you'll need to take care of
proper event listeners attachment the same time you add new cells, which might
overcomplicate your application logic. But if you attach your listener to
the table level, then all new cells will get handled automatically with all the
others. No need to initialize them specifically. 

And the third case is known as the unobtrusive scripting approach. The idea
is that you can describe the application logic unobtrusively at the document
level without accessing the page elements directly. It gives you several
advantages in the application design and allows to create more safe
applications that won't interfere with each other.

A good example would be widgets, we use the events delegation technique in
a number of widgets, for example Lightbox, Calendar, Autocompleter, etc. This
way they have a reduced initialization time, work with dynamic content and
incapsulate all their logic inside just a few document level listeners.

## A Simple Example, :example

Remember the todo list from the above? Lets say we'd like to toggle a
css-class on the list items when the user clicks the items. Using the events
delegation technique in RightJS, this script would look about like that

    "#todos li".on('click', function() {
      this.toggleClass('marked');
    });

This simple piece of code will tell the `document` to watch clicks and when
an element that matches the `"#todos li"` css rule was clicked, then call
the given callback in the context of the clicked element.

This might look a bit weird, calling the `on` method on a string, but if you
read the actual code you'll see that it is perfectly readable. More of that it
has all the same API as the {Element#on} method, you can send hashes, arrays
and refer callbacks by name.

    "#todos li".on({
      click: function() {
        this.toggleClass('marked');
      }
    });
    
    // with a list of handlers
    "#todos li".on('click', [
      function1, function2, function3
    ]);

    // with by-name references
    "#todos li".on('click', 'toggleClass', 'marked');

You can think about it as a global observer. It's all the same as the
{Element#on} method, but it works globally for all elements on the page that
match that css-rule.


## Deeper Features, :deeper

That fancy {String#on} method is a shortcut for the {Event#behave} method. The
difference between them is that {Event#behave} returns an object of the actual
document level events handler, which you can use to stop observing certain
events. For example.

    var handlers = Event.behave("#todos li", "click", function() {
      this.toggleClass('marked');
    });
    
    // now we can switch it off like that
    document.stopObserving(handlers);

There is also another method called {Event#delegate} that creates the actual
events delegation handlers. You can use this method to create your own
delegated event handlers and attach them to the levels different from the
`document`.

For example you have a table with the `THEAD` and `TBODY` sections, and you
want that when the user clicks a cell in the header to highlight a column, and 
when the user clicks a cell in the body, then highlight a row. You can do it
like that

    $('my-table').onClick(Event.delegate({
      'thead td': function() {
        // highlight the column in here
      },
      
      'tbody td': function() {
        // highlight the row in here
      }
    }));

This will attach one single `onclick` event listener to the table element, but
it will act differently depends on what kind of cell was clicked.


## Troubleshooting, :troubleshooting

There is one common issue with events delegation technique that you should be
aware of.

Because it uses the events bubbling effect, events delegation will not work if
some other event listener between the target and the receiver, stopped the
event. For example

    "#todos li".on("click", "toggleClass", "marked");
    
    $('todos').onClick(function(event) {
      event.stop();
    });

In this case when the event reaches the `UL` element the event will be stopped
from bubbling up. It will never reach the `document` level listener and
because of that the class toggling will not work.

If you want to cancel the event default effect, but still keep it bubbling,
call the {Event#preventDefault} method instead of {Event#stop}


