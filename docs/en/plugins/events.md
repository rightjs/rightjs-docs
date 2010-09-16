# Advanced DOM Events Handling

This module provides additional functionalities which might be helpful when you need to work
a lot with DOM events.

<%= anchors_index %>

<%= partial '/plugins/download', :locals => {:name => 'events'} %>

## Keys And Buttons Determination, :keys

Two additional constants appear in the {Event} class when this module is included.

`Event.BUTTONS` reports the mouse button numbers:

* `LEFT` - 0 (1 for IE and Konqueror)
* `MIDDLE` - 1 (4 for IE and Konqueror)
* `RIGHT` - 2

`Event.KEYS` contains the codes of the command keys on the keyboard:

* `BACKSPACE`
* `TAB`
* `ENTER`
* `ESCAPE`
* `SPACE`
* `PAGE_UP`
* `PAGE_DOWN`
* `END`
* `HOME`
* `LEFT`
* `UP`
* `RIGHT`
* `DOWN`
* `INSERT`
* `DELETE`

For each of the constants a method exists which will check if that key or mouse button was pressed. The names 
are equivalent to the constant names above:

    $('element').onClick(function(event) {
      if (event.isLeftClick())
        // ...
    });

    $('input').onKeydown(function(event) {
      if (event.isEnter())
        this.form.submit();
    });

## DOM Events Firing, :dom

By default when you try to initiate events on a DOM element, RightJS will simply go through all the callbacks 
registered to the element by use of a fake event. This works fine, but it's not the real thing.

If you need to fire real DOM events, you should use this module. Once included, the module wraps the original
events initiation methods and uses the new ones. Therefore, nothing changes on the API level.

__NOTE:__ Konqueror 3 does not support this feature.
