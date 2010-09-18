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


### .include

    Event.include(Object methods[, boolean dont_rewrite])

Registers additional methods for the DOM events.

    Event.include({
      myMethod: function() {....}
    });

    $('my_element').onClick(function(event) {
      event.myMethod()
    });


### .delegate

    Event.delegate(Object description) -> Function delegation

Creates a function that will delegate the actual event handler
depending on the element that triggered the event

__NOTE__: the actual callback function will be called in the context
of the element that _triggered_ the event

    var delegation = Event.delegate({
      "div.red":   function() { alert('You have clicked the red block'); },
      "div.green": function() { alert('You have clicked the green block'); }
    });

    document.onClick(delegation);

    // you also can use references by-name
    var delegation = Event.delegate({
      ".red":     ['addClass', 'was-red'],
      ".green":   ['addClass', 'was-green'],
      ".hide-me": 'hide'
    });


### .behave

    Event.behave(String css_rule, String event, Function callback)        -> Object events
    Event.behave(String css_rule, String event, String method[, arg, ..]) -> Object events
    Event.behave(String css_rule, Object event_handlers)                  -> Object events

Attaches a document level events delegation handler.

Returns a hash that can be used to switch the handlers off in the
`document.stopObserving` method.

    // with usual functions
    Event.behave("#todos li", "click", function() { this.remove(); });

    // with a call by name
    Event.behave("#todos li", "click", "addClass", "marked");

    // with a hash of handlers
    Event.behave("#todos li", {
      mouseover: function() { this.addClass('hovered'); },
      mouseout:  ['removeClass', 'hovered'],
      click:     'remove'
    });

    // turning handlers off
    var handlers = Event.behave(.....);

    document.stopObserving(handlers);



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


