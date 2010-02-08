# Array

RightJS extends the Array unit prototype in several ways. First of all it adds
standard JavaScript 1.6 methods like {#map}, {#filter} and so on to browsers 
that don't support these methods yet. In other words: You can use these new 
JavaScript 1.6 features without having to worry whether your browsers support
it or not.

Secondly, it provides self-referential callback definitions by method names,
which is extremely handy when you need to just call the same method on all 
array elements or process the same attribute. For example:

    var elements = $$('some css rule');

    elements.each('hide');
    elements.each('addClass', 'marked');
    elements.each('onClick', function() {});

    var ids = elements.map('id');
    var classes = elements.map('className').map('split', /\s+/).flatten().uniq();

    var visible_elements = elements.filter('visible');
    var marked_elements  = elements.filter('hasClass', 'marked');

Finally, it adds several additional but standard methods like {#compact},
{#uniq} or {#merge}. Most of them are equivalents of Ruby Array methods.


## Iterators Handling

There are two ways of using iterators. Either pass a lambda function as the
only argument which will receive the following three arguments on every 
iteration:

* the current array element
* the element index in the array
* the instance of the array itself

Or pass a method name (string) as the first argument and optional additional 
arguments. The method will be called on every iteration along with the additional
arguments, for example:

    [...].each('foo', 1, 2, 3);

The method 'foo(1, 2, 3)' will be called for every element of the array.
 


### #indexOf

    indexOf(mixed value) -> Integer

Search the array for the given value and return the index of the first apearance 
or -1 if the value is not found in the array.


### #lastIndexOf

    lastIndexOf(mixed value) -> Integer
  
Search the array for the given value and return the index of the last apearance 
or -1 if the value is not found in the array.


### #first

    first()                                  -> mixed
    first([Function lambda[, Object scope]]) -> mixed
    first([String name[, argument, ...]])    -> mixed

Returns the first element of the array or `undefined` if the array is empty.

If a callback is provided, the method will return the first element that
passes the condition in the function:

    [1,2,3,4].first() // -> 1
    
    [1,2,3,4].first(function(i) { return i > 1; }) // -> 2
    
    ['bar', 'foo', 'moo'].first('match', 'oo') // -> 'foo'


### #last

    last()                                  -> mixed
    last([Function lambda[, Object scope]]) -> mixed
    last([String name[, argument, ...]])    -> mixed

Returns the last element of the array or `undefined` if the array is empty.

If a callback is provided, the method will return the last element that
passes the condition in the function:

    [1,2,3,4].last() // -> 4
    
    [1,2,3,4].last(function(i) { return i < 4; }) // -> 3
    
    ['foo', 'moo', 'bar'].first('match', 'oo') // -> 'moo'


### #random

    random() -> mixed

Returns a random element from the array or `undefined` if the array is empty.

### #size

    size() -> Integer
  
Returns the length of the array.

    [1,2,3].size(); // -> 3

### #clean

    clean() -> Array self
  
Shrinks the array to zero elements without loosing the object reference.


### #empty

    empty() -> boolean

Checks if the array contains no elements.

### #clone

    clone() -> new Array

Creates a new array that contains all the same elements as the original one.

### #each

    each(Function lambda[, Object scope]) -> Array self
    each(String name[, argument, ...])    -> Array self

Calls the given function in the given optional scope on every element in the 
array.

    var elements = some_html_elements_list;
    
    elements.each(function(element, i) {
      if (i % 2 == 0) {
        element.hide();
      } else {
        element.show();
      }
    });
  
    elements.each('toggle'); // will call toggle() on every element of the array
    elements.each('addClass', 'marked'); // will add the 'marked' class to every element


### #map

    map(Function lambda[, Object scope]) -> Array new
    map(String name[, argument, ...])    -> Array new

Collects the results of applying the lambda function on every element of the 
array.

    var strings = ['anny', 'banny', 'manny'];
    
    strings.map(function(string, i) {
      return (i+1)+'. '+string;
    });
    
    // -> ['1. anny', '2. banny', '3. manny'];
    
    strings.map('capitalize');
    
    // -> ['Anny', 'Banny', 'Manny'];
    
    strings.map('replace', 'nn', 'b');
    
    // -> ['aby', 'baby', 'maby'];
  

### #filter

    filter(Function lambda[, Object scope]) -> Array new
    filter(String name[, argument, ...])    -> Array new

Creates a new array that contains all the items from the original array 
that pass the condition in the lambda function:

    var strings = ['anny', 'manny', 'banny', 'bob'];
    
    strings.filter(function(string, i) {
      return string.length > (i+1);
    });
    // -> ['anny', 'manny', 'banny'];
    
    strings.filter('match', /[a-z]ann/);
    // -> ['manny', 'banny']


### #walk

    walk(Function lambda[, Object scope]) -> Array self
    walk(String name[, argument, ...])    -> Array self

Modifies every element of the array by passing them through the given lambda 
function:

    var names = ['anny', 'manny', 'banny', 'bob'];
    
    names.walk(function(name, i) {
      return (i+1)+'. '+name;
    });
    
    // -> ['1. anny', '2. manny', '3. banny', '4. bob'];
    
    names.walk('split', '. ');
    
    // [['1', 'anny'], ['2', 'manny'], ['3', 'banny'], ['4', 'bob']];
    
    names.walk('last').walk('capitalize');
    
    // ['Anny', 'Manny', 'Banny', 'Bob'];


### #merge

    merge(Array list[, Array list, ...]) -> Array new

Picks up items from the given arrays that do not exist in the current 
array, combines them with the items from the current array and returns the 
result as a new array.
  
    [0,1,2,3].merge([2,3,4], [3,4,5], [1,5,6]);
    
    // -> [0,1,2,3,4,5,6];
  

### #flatten

    flatten() -> Array new

Converts a multi-dimensional array into a flat list.

    [0,1,[2,3,[4,5,[6,7],8],9]].flatten();
    
    // -> [0,1,2,3,4,5,6,7,8,9];


### #compact

    compact() -> Array new

Creates a new array that contains all non-null and non-undefined elements 
from the original one.

    [null, 0, undefined, 1, 2, 3, null].compact();
    
    // -> [0, 1, 2, 3];


### #uniq

    uniq() -> Array new

Remove all duplicate elements from the array.

    [0,1,1,2,0,1,2,3,3].uniq();
    
    // -> [0,1,2,3];



### #includes

    includes(mixed value[, mixed value,...]) -> boolean

Checks whether the given value is present in the array. If several
values are passed, the presence of _all_ of them are checked:

    [0,1,2,3].includes(0);   // true
    [0,1,2,3].includes(4);   // false
    [0,1,2,3].includes(1,2); // true
    [0,1,2,3].includes(2,4); // false


### #without

    without(mixed value[, mixed value, ...]) -> Array new
  
Creates a copy of the array without the specified elements.

    [0,1,2,3].without(1,3);
    
    // -> [0,2];


### #shuffle

    shuffle() -> Array new

Creates a new array which contains has all the same items as the 
original one in random order.

    [0,1,2,3,4].shuffle();
    
    // -> [3, 4, 0, 1, 2]
  
### #sortBy

    sortBy(Function lambda[, scope])      -> Array new
    sortBy(String attr_name[, arguments]) -> Array new

Creates a new array by sorting the current one. Sorting is done
by the results of either the given lambda function or the given
attribute (string):

    [{t:3}, {t:2}, {t:1}].sortBy(function(element) {
      return element.t;
    });
    
    // -> [{t:1}, {t:2}, {t:3}]
    
    [{t:3}, {t:2}, {t:1}].sortBy('t');
    
    // -> [{t:1}, {t:2}, {t:3}]
  
### #every

    every()                                -> boolean
    every(Function lambda[, Object scope]) -> boolean
    every(String name[, argument, ...])    -> boolean

Checks if every item in the array passes the condition in the given
function.

If no function is provided, every element will be checked as a
boolean value:

    [1,2,3,4].every() // -> true
    [0,1,2,3].every() // -> false
    
    [1,2,3].every(function(i) { return i > 0}) // -> true
    [0,1,2].every(function(i) { return i > 0}) // -> false
    
    ['moo', 'foo', 'boo'].every('match', 'oo') // -> true
    ['moo', 'foo', 'bar'].every('match', 'oo') // -> false
  

### #some

    some()                                -> boolean
    some(Function lambda[, Object scope]) -> boolean
    some(String name[, argument, ...])    -> boolean

Checks if any of the elements in the array passes the condition in 
the function.

If no function is provided, every element will be checked as a
boolean value:

    [0,false,1].some()    // -> true
    [0,false,null].some() // -> false
    
    [0,1,2].some(function(i) { return i == 0; }) // -> true
    [1,2,3].some(function(i) { return i == 0; }) // -> false
    
    ['foo', 'bar'].some('match', 'bar') // -> true
    ['foo', 'boo'].some('match', 'bar') // -> false
