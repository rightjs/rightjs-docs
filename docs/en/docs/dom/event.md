# Event

To provide the ability of working with DOM events in a cross-browser way,
RightJS like many other JavaScript frameworks provides some extensions to the
events system.

If you attach your event listeners via the RightJS interfaces, then all the
events your listeners receive will be automatically extended, otherwise, you
might need to call the {Event.ext} method on your events.

## Internet Explorer Fixes

Instead of providing some mediative interface for the DOM events, RightJS fixes 
IE events by creating W3C style attributes for the events in order for you to
work with them in IE as if it were a normal browser.

The list of fake attributes is:

* `which` - which mouse button was pressed (1, 2, 3)
* `target` - target element reference
* `currentTarget` - the bounding (listener) element reference
* `relatedTarget` - the related element for the over and out mouse events
* `pageX`, `pageY` - the cursor position relative to the document
 
### .ext

    Event.ext(Event event) -> Event extended

Extends the event object with additional methods.
  
    $('element').attachEvent('onclick', function(event) {
      Event.ext(event);
      
      event.stop();
    });


### .addMethods

    Event.addMethods(Object methods[, boolean dont_rewrite])

Registers additional methods for the DOM events.

__DEPRECATED__: Please use the {.include} method instead.

    
### .include

    Event.include(Object methods[, boolean dont_rewrite])

Registers additional methods for the DOM events.

    Event.include({
      myMethod: function() {....}
    });

    $('my_element').onClick(function(event) {
      event.myMethod()
    });



### #stop

    stop() -> Event self

Stops the event from further bubbling and cancels default handling.

    $('element').onContextmenu(function(e) {
      e.stop();
      $('context-menu').moveTo(e.position()).show();
    });


### #preventDefault

    preventDefault() -> void

Prevents the event defaults.
  

### #stopPropagation

    stopPropagation() -> void

Stops the event propagation.


### #position

    position() -> {x: NNN, y: NNN}

Returns the current event position.

    $('element').onMouseover(function(event) {
      $('nice-looking-title').show().moveTo(event.position());
    });


