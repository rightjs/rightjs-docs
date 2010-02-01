# Document

The `document` object in RightJS has the standard {Observer} interface,
and it handles the `dom-ready` event.

## Document Ready

The `dom-ready` event in RightJS is simply called `ready` and you can assign
a listener to it in any of the standard ways:

    document.onReady(function() {...});
    document.on('ready', function() {...});
    document.observe('ready', function() {...});

This event can also be handled the same way with the `window` object.


### on

    on(String name, Function callback[, arguments, ...]) -> document self

The standard listeners attachment method

    document.on('ready', function() {....});

### observe

    observe(String name, Function callback[, args[, ...]]) -> document self

The standard listeners attachment method

__DEPRECATED__: please use the shorter method {#on}

    document.observe('ready', function() {...});


### onReady

    onReady(Function callback[, arguments[, ....]]) -> document self

A shortcut method for `on('ready', ...)`

    document.onReady(function() {....});

