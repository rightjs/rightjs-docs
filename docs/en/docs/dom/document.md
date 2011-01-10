# Document

{Document} is a dom-wrapper designed to work with dom-documents, basically
it is an API to work with events, plus the {#onReady} method to track the
document-ready event.

## Document Ready

The `dom-ready` event in RightJS is simply called `ready` and you can assign
a listener to it in any of the standard ways:

    $(document).onReady(function() {...});
    $(document).on('ready', function() {...});


### #on

    on(String name, Function callback[, arguments, ...]) -> Document self

The standard listeners attachment method

    $(document).on('ready', function() {....});

### #observes

    observes(Function listener)                -> boolean
    observes(String name[, Function listener]) -> boolean

Checks if the given listener observers the document events. You can do either
a general check or against a specific event name.

    var func = function() {};

    $(document).on('click', func);

    $(document).observes(func);              // -> true
    $(document).observes('mouseover', func); // -> false


### #listeners

    listeners()            -> Array of functions
    listeners(String name) -> Array of functions


Returns a list of document event listeners which can optionally be narrowed
down by an event name scope.

    var func = function() {};

    $(document).on('click', func);

    $(document).listeners();            // -> [func]
    $(document).listeners('click');     // -> [func]
    $(document).listeners('mouseover'); // -> []



### #stopObserving

    stopObserving(Function listener)       -> Document self
    stopObserving(String name[, listener]) -> Document self

Unsubscribes the event listener. This can be done globally for a particular
event name, for some particular listener or for some particular listener and
event name.

    var listener = function() {};

    $(document).on('click', listener);

    $(document).stopObserving('click');

    $(document).stopObserving(listner);

    $(document).stopObserving('click', listner);

### #onReady

    onReady(Function callback[, arguments[, ....]]) -> Document self

A shortcut method for `on('ready', ...)`

    $(document).onReady(function() {....});

