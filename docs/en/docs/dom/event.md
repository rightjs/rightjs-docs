# Event

{Event} is the standard dom-events wrapper in RightJS. It provides a
cross-browser interface to deal with common dom-events related operations,
plus it has several w3c style properties

* `which` - which mouse button was pressed (1, 2, 3)
* `target` - target element reference
* `currentTarget` - the bounding (listener) element reference
* `relatedTarget` - the related element for the over and out mouse events


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

    preventDefault() -> Event self

Prevents the event defaults.


### #stopPropagation

    stopPropagation() -> Event self

Stops the event propagation.


### #position

    position() -> {x: NNN, y: NNN}

Returns the current event position.

    $('element').onMouseover(function(event) {
      $('nice-looking-title').show().moveTo(event.position());
    });


### #offset

    offset() -> {x: NNN, y: NNN}

Returns the current cursor position relatively to the target element
(useful for handling relatively positioned elements within the target element)

    $('element').onMousemove(function(event) {
      $('relative-element').moveTo(event.offset());
    });


### #find

    find(String css_rule) -> Element

This method finds the first matching element between the element that
triggered the event and the one where the event listener was attached.

    /*
      <div id="first">
        <div id="second">
          <div id="third"></div>
        </div>
      </div>
    */

    $('first').onClick(function(event) {
      event.find('div#second');
    });

    $('third').fire('click');



