# String

RightJS extends the native String class with some additional powerful methods
to make your life easier.


### .include

    String.include(Object new_methods[, Boolean dont_overwrite) -> String

Registers new functionality for `String` instances

If the second argument is `true`, then the method _will skip_ already existing methods

    String.include({
      double: function() {
        return this + ' ' + this;
      }
    });

    'boo'.double(); // -> 'boo boo'


### #empty

    empty() -> boolean

Checks if the string is empty.

    ''.empty();  // -> true
    ' '.empty(); // -> false
    'a'.empty(); // -> false


### #blank

    blank() -> boolean

Checks if the string is empty or contains whitespaces only.

    ''.blank();   // -> true
    ' '.blank();  // -> true
    "\n".blank(); // -> true
    ' a'.blank(); // -> false


### #trim

    trim() -> String new

Removes whitespaces from the beginning and the end of the string.

    ' asdf '.trim(); // -> 'asdf'


### #stripTags

    stripTags(); -> String new

Removes all tags from the string.

    'a <b>c</b> d'.stripTags(); // -> 'a c d'


### #stripScripts

    stripScripts();                  -> String new
    stripScripts(true);              -> String new
    stripScripts(Function receiver); -> String new

Strips all JavaScript tags from the string.

This method takes several possible arguments. If a boolean `true` is passed
then the scripts will be evaluated after extraction. If a function is passed
every script body will be tossed into the function.

    var string = 'asdf<script>alert('bla');</script>';

    string.stripScripts();     // -> 'asdf'
    string.stripScripts(true); // -> 'asdf' and you'll see the alert

    string.stripScripts(function(script) {
      // do something with the script in here
    });

    // will return 'asdf'


### #extractScripts

    extractScripts() -> String scripts

Extracts the bodies of every JavaScript tag in the string and returns them
as a single string.

    var string = 'asdf <script>alert(1);</script>asdf<script>alert(2);</script>';

    string.extractScripts(); // -> 'alert(1);alert(2);'


### #evalScripts

    evalScripts() -> String self

Evals scripts in the string.

__NOTE:__ This method will not remove the scripts from the string.

    var string = 'asdf <script>alert(1);</script>';

    string.evalScripts(); // 'asdf <script>alert(1);</script>' and you'll see the alert


### #camelize

    camelize() -> String new

Converts the string from underscored or dashed to camel case.

    'foo_bar'.camelize(); // -> 'fooBar'
    'foo-bar'.camelize(); // -> 'fooBar'




### #underscored

    underscored() -> String new

Converts the string from camel or dashed to underscored case.

    'fooBar'.underscored();  // -> 'foo_bar'
    'foo-bar'.underscored(); // -> 'foo_bar'


### #capitalize

    capitalize() -> String new

Creates a capitalized version of the string.

__NOTE__: This method supports most of the UTF-8 symbols.

    'boo boo boo'.capitalize();    // -> 'Boo boo boo'
    'йокарный бабай'.capitalize(); // -> 'Йокарный бабай'



### #includes

    includes(String token) -> boolean

Checks if the string contains the given substring.

    'foo'.includes('bar'); // -> false
    'foo'.includes('oo');  // -> true



### #startsWith

    startsWith(String token[, boolean ignorecase]) -> boolean

Checks if the string starts with the given substring.

    'onSomething'.startsWith('on');           // -> true

    'onSomething'.startsWith('onsome');       // -> false
    'onSomething'.startsWith('onsome', true); // -> true



### #endsWith

    endsWith(String token[, boolean ignorecase]) -> boolean

Checks if the string ends with the given substring.

    'image.gif'.endsWith('.gif');       // -> true

    'image.gif'.endsWith('.GIF');       // -> false
    'image.gif'.endsWith('.GIF', true); // -> true



### #toInt

    toInt([Integer base]) -> Integer

Converts the string to an Integer number.

    '123'.toInt(); // -> 123



### #toFloat

    toFloat() -> Float

Converts the string to a float number.

__NOTE:__ Processes dashes and commas as decimal markers unless you
pass the argument `true`.

    '123.45'.toFloat(); // -> 123.45
    '123,45'.toFloat(); // -> 123.45
    '123-45'.toFloat(); // -> 123.45


### #on

    on(String event, Function callback)              -> void
    on(String event, String callback[, arg, arg...]) -> void
    on(Object events_hash)                           -> void

Attaches a document level events delegation listener.

    // simple case
    "div.red".on('click', function() {
      alert("That's red")
    });

    // by name reference
    "div.red".on('click', 'addClass', 'that-was-red');

    // several event callbacks attachment
    "div.red".on({
      mouseover: function() { this.addClas('that-was-red')},
      mouseout:  ['removeClass', 'that-was-red'],
      click:     'hide'
    });


### #behave

    behave(String event, Function callback)              -> void
    behave(String event, String callback[, arg, arg...]) -> void
    behave(Object events_hash)                           -> void

Alias for the {#on} method

__DEPRECATED__: Please use the shorter method {#on}
