# Observer

`Observer` is a shared drop-in base class that implements the
observer pattern. It is used in many places all over the framework and
defines the common interface for all observable units.

## Usage
Generally, `Observer` is a normal class. You can use it by itself or as
an ancestor for your own classes.

    var observer = new Observer();
    observer.on('something', function() {....});
    //....
    observer.fire('something');

    var MyObserver = new Class(Observer, {
      // ....
    });
    var my_observer = new MyObserver();

Or, if you don't have an ability to inherit the class directly, you can use
its static method called {Observer.create} to make practically any object
behave like an observer.

    var Klass = new Class(AnotherKlass, {
      initialize: function() {
        Observer.create(this);
      }
    });

    var klass = new Klass();
    klass.on('something', function() {....});


    // or even like that.
    var object = {....};
    Observer.create(object);

    object.on('something', function() {.....});

## Shortcuts

The `Observer` unit provides the ability to generate elegant shortcut
methods to process events your observer is supposed to handle.
To do so, you need to specify an instance or class level attribute
`EVENTS` in your class. RightJS will watch the name and if found,
will generate the shortcuts automatically.

    var Klass = new Class(Observer, {
      EVENTS: $w('start stop')
    });

    var klass = new Klass();
    klass.onStart(function() {...});

__NOTE:__ If your class has intersecting methods, the shortcuts generator
will keep them alive and simply skipping those names.

## Call By Name

The `Observer` class follows the general 'call by name' feature of RightJS.
This means that instead of specifying a particular function to observe, you
can specify a method name and some attributes which will be called on the
event.

    var Kid = new Class(Observer, {
      callMommy: function(message) {
        alert(message);
      }
    });

    var kid = new Kid();

    kid.on('troubles', 'callMommy', 'Mommy!');

    // ...
    kid.fire('troubles');

    // now the 'callMommy' method of the kid instance will be called



### .create

    Observer.create(Object object[, Array events_list]) -> Object observable

The static observer builder, adds observer functionality to any object.

    var object = {....};

    Observer.create(object);

    object.on('something', function() {.....});


### .createShortcuts

    Observer.createShortcuts(Observer object, Array names) -> Object

Generates the observer shortcuts on the given observable unit.

    var observer = new Observer();

    Observer.createShortcuts(observer, ['start', 'stop']);

    observer.onStart(function() {...});

### #initialize

    initialize([Object options])

The generic constructor: If you call it with a hash of option keys like
`'onSomething'`, the observer will automatically wire it to the to the
'something' event.

__NOTE__: If you create a subclass of `Observer` and overload its constructor,
don't forget to call `this.$super(options);` inside of it to bypass the event
handlers.

    var observer = new Observer();
    var observer = new Observer({
      onStart: function() {},
      onFinish: 'clear'
    });

### #observe

    observe(String name, Function callback[, arguments])  -> Observer self
    observe(String name, String method_name[, arguments]) -> Observer self
    observe(String name, Array callbacks[, arguments])    -> Observer self
    observe(Object hash)                                  -> Observer self

Tells the observer to observe the event with the given callback.

__DEPRECATED__: Please use the {#on} method instead.

    var observer = new Observer();

    observer.observe('something', function() {...});

    // or by name
    observer.observe('something', 'observer_method_name', arg1, arg2);

    // or a whole list
    observer.observe('something', [func1, func2, func3, ...]);

    // or a hash
    observer.observe({
      one: function() {},
      two: 'something'
    })


### #on

    on(String name, Function callback[, arguments])  -> Observer self
    on(String name, String method_name[, arguments]) -> Observer self
    on(String name, Array callbacks[, arguments])    -> Observer self
    on(Object hash)                                  -> Observer self

Binds an event listener to the observer.

    var observer = new Observer();

    observer.on('something', function() {...});

    // or by name
    observer.on('something', 'observer_method_name', arg1, arg2);

    // or a whole list
    observer.on('something', [func1, func2, func3, ...]);

    // or using a hash
    observer.on({
      one: function() {},
      two: 'something'
    });


### #observes

    observes(String name)                    -> boolean
    observes(Function callback)              -> boolean
    observes(String name, Function callback) -> boolean

Checks if the observer watches the given event or/and callback.

    var observer = new Observer();
    var callback = function() {};

    observer.on('event', callback);

    observer.observes('event');             // -> true
    observer.observes(callback);            // -> true
    observer.observes('event', callback);   // -> true

    observer.observes('another_event');     // -> false
    observer.observes(another_calback);     // -> false
    observer.observes('another', callback); // -> false


### #stopObserving

    stopObserving(String name)                    -> Observer self
    stopObserving(Function callback)              -> Observer self
    stopObserving(String name, Function callback) -> Observer self
    stopObserving(Object events)                  -> Observer self

Tells the observer to stop observing a certain callback, the whole event or
some particular callback for some particular event.

    var observer = new Observer();
    var callback = function() {};

    observer.on('event', callback);

    observer.stopObserving('event');

    observer.observes('event');           // -> false
    observer.observes(callback);          // -> false


### #fire

    fire(String name[, arguments, ...]) -> Observer self

Triggers an event processing.

    var observer = new Observer();

    observer.on('something', function() {});

    observer.fire('something');

    // that function was called


### #listeners

    listeners([String name]) -> Array of callbacks

Returns the list of registered listeners for the given event.

    var observer = new Observer();
    var callback = function() {};

    observer.on('something', callback);

    observer.listeners('something'); // -> [callback]

