# Cookie

`Cookie` is an object oriented wrapper around the native cookie support
of a browser.

You can work with the `Cookie` object at class level.

    Cookie.set('name', 'value');
    Cookie.set('name', 'value', {duration: 10});

    Cookie.get('name');

    Cookie.remove('name');

Or you can use instances like this:

    var cookie = new Cookie('name');
    var cookie = new Cookie('name', {duration: 4});

    cookie.set('value');

    cookie.remove();

## Options

You can use the following options with your cookies:

Name     | Duration                                                  |
---------|-----------------------------------------------------------|
duration | number of days the cookie will stay alive                 |
domain   | a string domain name                                      |
path     | a string path                                             |
secure   | boolean to set if the cookie should get marked as secure  |

## Values Escaping

You can safely feed the API with any strings, all the values will be
automatically encoded and decoded.

    Cookie.set('name', '%"&=*"');

    Cookie.get('name'); // -> '%"&=*"'

And if you include the [JSON](/plugins/json) feature on your page, you will
be able to save/retrieve any JSON exportable objects, like booleans, arrays
or plain objects.


### .set

    Cookie.set(String name, String value[, Object options]) -> Cookie

Sets the cookie.

    Cookie.set('name', 'value');
    Cookie.set('name', 'value', {duration: 4});

### .get

    Cookie.get(String name) -> String value or null

Finds and reads a cookie by name. Returns null if nothing is found.

    Cookie.set('name', 'value');

    Cookie.get('name'); // -> 'value'

### .remove

    Cookie.remove(String name) -> Cookie

Erases a cookie value by name.

    Cookie.set('name', 'value');

    Cookie.remove('name');

    Cookie.get('name'); // -> null


### #initialize

    initialize(String name[, Object options])

Basic constructor. See the list of options in the description above.

    var cookie = new Cookie('name');
    var cookie = new Cookie('name', {duration: 2});


### #set

    set(String value) -> Cookie self

Sets the cookie value.

    var cookie = new Cookie('name');

    cookie.set('value');

    cookie.get(); // -> 'value'


### #get

    get() -> String value or null

Reads the cookie value.

    var cookie = new Cookie('name');

    cookie.set('value');

    cookie.get(); // -> 'value'


### #remove

    remove() -> Cookie self

Removes the cookie from of the browser memory.

    var cookie = new Cookie('name');
    cookie.set('value');
    cookie.get(); // -> 'value'

    cookie.remove();

    cookie.get(); // -> null
