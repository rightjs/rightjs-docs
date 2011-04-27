# Window

{Window} is the standard dom-wrapper for the window elements.


### #size

    size() -> Object {x: NN , y: NN }

Returns the internal space size of the window.

    $(window).size();


### #scrolls

    scrolls() -> Object {x: NN , y: NN }

Returns the scroll offsets for the window.

    $(window).scrolls();


### #scrollTo

    scrollTo(number left, number top) -> window self
    scrollTo(Object {x: ..., y:...})  -> window self
    scrollTo(Element element)         -> window self
    scrollTo(String element_id)       -> window self

Handles the main scrollbars of the window. Can scroll the window to any
position or element.

    $(window).scrollTo(123, 123);
    $(window).scrollTo({x: 123, y: 123});
    $(window).scrollTo($('element'));
    $(window).scrollTo('element-id');

