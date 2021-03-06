# Object

The {Object} unit in RightJS has some pretty much standard additional methods,
which provide frequently used functionalities to process objects.

### .keys

    Object.keys(Object object) -> Array keys

Collects the object keys into an array.

    Object.keys({'a':1, 'b':2, 'c':3})

    // -> ['a', 'b', 'c']


### .values

    Object.values(Object object) -> Array values

Collects the object values into an array.

    Object.values({'a':1, 'b':2, 'c':3})

    // -> [1, 2, 3]


### .each

    Object.each(Object object, Function callback, Object scope) -> Object object

Calls the callback function on every key-value pairs out of the given object

    var hash = {a: 1, b:2, c: 3};
    var data = [];

    Object.each(hash, function(key, value) {
      keys.push(key + ':' + value);
    });

    data; // -> ['a:1', 'b:2', 'c:3']


### .empty

    Object.empty(Object object) -> boolean

Checks if the object has any key-value pairs in it.

    Object.empty({'a':1}) // -> false
    Object.empty({})      // -> true

### .without

    Object.without(Object object, String key[, keys..]) -> Object new

Creates a copy of the object without the specified key-value pairs in it.

    var object = {'a': 1, 'b': 2, 'c': 3};
    Object.without(object, 'b');

    // -> {'a': 1, 'c': 3}

### .only

    Object.only(Object object, String key[, keys...]) -> Object new

Creates a copy of the object with only the specified key-value paris in it.

    var object = {'a': 1, 'b': 2, 'c': 3};
    Object.only(object, 'b', 'c');

    // -> {'b': 2, 'c': 3}

### .merge

    Object.merge(Object o1, Object o2[, objects..]) -> Object new

Creates a new object that contains all the key-value pairs of the given
objects.

__NOTE__: this method performs a deep merge of objects!

    Object.merge({'a': 1, 'b': 2}, {'c': 3});

    // -> {'a': 1, 'b': 2, 'c': 3}


### .clone

    Object.clone(Object obj) -> Object new

A simple object cloning method

__NOTE__: this method _does not_ perform a recursive cloning!

    var obj1 = {a:1};
    var obj2 = Object.clone(obj1);

    obj1 !== obj2;


### .toQueryString

    Object.toQueryString(Object object) -> String

Converts the object into a URL options string

    Object.toQueryString({a:'a', b:'b', c:'%#?'}));

    // -> 'a=a&b=b&c=%25%23%3F'
