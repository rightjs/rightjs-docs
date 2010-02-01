# Window

The `window` object has its own portion of extensions in RightJS which
help you to deal with sizes and scrolls in a cross-browser way.


### #sizes

    sizes() -> Object {x: NN , y: NN }

Returns the window's internal space sizes.

    window.sizes();

### #scrolls

    scrolls() -> Object {x: NN , y: NN }

Returns the scroll offsets for the window.

    window.scrolls();


### #scrollTo

    scrollTo(number left, number top) -> window self
    scrollTo(Object {x: ..., y:...})  -> window self
    scrollTo(Element element)         -> window self
    scrollTo(String element_id)       -> window self

Handles the window's main scrollbars. Can scroll the window to any position
or element.

    window.scrollTo(123, 123);
    window.scrollTo({x: 123, y: 123});
    window.scrollTo($('element'));
    window.scrollTo('element-id');

