# Element

{Element} is the basic dom-wrapper for all dom-elements.


## Set Methods and Chains

All the set-methods in RightJS return a reference to the object they belong
to, this way you can easily create chains of calls like:

    $('some-element').on("click", function() {})
      .setStyle({fontSize: '200%'})
      .addClass('marked').update('with text')
      .toggle().set('title', 'some-title') ...;


## Selector Methods

There are a number of methods like {#parents}, {#siblings} and so on to
help you navigate in the neighborhood of an element. All the methods can be
used as are, or they can receive an optional CSS selector rule which will
filter the result.

    var element = $('some-element');

    element.siblings();      // all the siblings
    element.siblings('div'); // all the siblings with tag 'div'

__NOTE__: RightJS doesn't use any special interfaces to process node lists
but uses simple {Array} instances. And as they support calls by name, you
can take advantage of them when work with DOM elements:

    $('some-list').find('li')
      .filter('hasClass', 'marked')
      .each('onClick', function() {...});


## Events Processing

The {Element} unit has all the standard {Observer} unit interface and handles
events binding in the same exact way.

    $('some-element').on('click', function() {
      call_that_function();
    });

    $('another-element').on({
      click:     click_handler,
      mouseover: mouseover_handler,
      mouseout:  mouseout_handler
    });

    $('that-element').on('click', [
      function1, function2, function3
    ]);

There are also shortcuts for all the standard DOM events. And you can use the
name references for callbacks as well:

    $(element).onClick('addClass', 'marked');
    $(element).onKeypress('radioClass', 'typing');

Finally, you can trigger any event handler manually like this:

    $(element).fire('click',    { button: 3 });
    $(element).fire('keypress', { keyCode: 12 });


## Custom events

At the interface level, there is no difference between standard
and custom events in RightJS. All of them are handled the exact same way:

    $(element).on('my-event', function() {....});
    $(element).fire('my-event');

__NOTE__: all the events you fire, normal and custom, all of them will bubble
up to document object as they do when you a browser triggers them.


### .include

    Element.include(Object methods[, boolean don_rewrite])

Registers additional methods for the DOM elements on the page.

    Element.include({
      myMethod: function() {....}
    });

    $('my_element').myMethod();


### #initialize

    initialize(String tag_name[, Object options]) -> Element new

The standard constructor which takes two arguments, the tag name and options.
Options are generally the element attributes and additionally you can send
the following keys to preset your element properties on instance:

* 'html'    - a source code to fill up the innerHTML property
* 'class'   - CSS class name(s) for the element
* 'style'   - a hash (or string) of styles to be preset
* 'on'      - same as `'observe'`

Everything will be handled in one flow.

    var element = new Element('div');
    var element = new Element('p', {
      id: 'some-paragraph',
      'class': 'come class',
      style: {
        padding: '10pt'
      },
      on: {
        mouseover: function() { ... }
      }
    });


### #set

    set(String name, String value) -> Element self
    set(Object properties_hash)    -> Element self

Assigns the given attribute(s) to the element.

    $('element').set('title', 'some title');

    $('element').set({
      title: 'some title',
      id:    'some-id'
    });


### #get

    get(String name) -> String value or null if empty

Reads an element attribute. Returns null if the attribute is not set.

    // <div id="div" title="some title"></div>

    $('div').get('title'); // -> 'some title'


### #has

    has(String name) -> boolean

Checks if an element has a non-empty attribute with that name.

    // <div id="div" title="some title"></div>

    $('div').has('title'); // -> true
    $('div').has('rel');   // -> false


### #erase

    erase(String name) -> Element self

Erases the attribute with the given name from an element.

    // <div id="div" title="some title"></div>

    $('div').has('title');   // -> true

    $('div').erase('title');

    $('div').has('title');   // -> false


### #hidden

    hidden() -> boolean

Checks if the element has style 'display' set to 'none'.

__NOTE__: Checks both element styles as well as the computed (CSS) styles.

    /*
      <style type="text/css">
        #second { display: none }
      </style>

      <div id="first" style="display: none"></div>
      <div id="second"></div>
      <div id="third"></div>
    */

    $('first').hidden();  // -> true
    $('second').hidden(); // -> true
    $('third').hidden();  // -> false


### #visible

    visible() -> boolean

Checks if the element is visible. See the {#hidden} method for more details.

    $('some-element').visible();


### #hide

    hide([String effect[, Object options]]) -> Element self

Hides the element. If a valid effect name was specified and the {Fx}
module is available, the effect will be used to perform the hiding.

    $('some-element').hide();

    $('some-element').hide('slide');
    $('some-element').hide('slide', {duration: 'long'});


### #show

    show([String effect[, Object options]]) -> Element self

Shows (un-hides) the element. If a valid effect name was specified and
the {Fx} module is available, the effect will be used to perform the showing.

    $('some-element').show();

    $('some-element').show('slide');
    $('some-element').show('slide', {duration: 'long'});


### #toggle

    toggle([String effect[, Object options]]) -> Element self

Toggles the element's visibility status. If a valid effect name was specified,
the effect will be used to perform the toggling.

    $('some-element').toggle();

    $('some-element').toggle('slide');
    $('some-element').toggle('slide', {duration: 'long'});


### #radio

    radio([String effect[, Object options]]) -> Element self

Hides all the sibling elements and shows itself. If a valid effect name was
specified, the effect will be used to perform the showing.

    $('some-element').radio();

    $('some-element').radio('slide');
    $('some-element').radio('slide', {duration: 'long'});

### #window

    window() -> Window window

Returns a wrapped {Window} object to which this element belongs to

    $(element).window().size();

### #document

    document() -> Document document

Returns a wrapped {Document} object to which this element belongs to

    $(element).document().find('div.class');

### #parent

    parent([String css_rule]) -> Element parent or null

Selects the parent element. The first one if there is no CSS rule or the
first one that matches the rule.

    /*
      <div id="one">
        <div id="two">
          <div id="three"></div>
        </div>
      </div>
    */

    $('three').parent();       // -> div#two
    $('three').parent('#one'); // -> div#one


### #parents

    parents([String css_rule]) -> Array of elements

Returns the list of parent nodes of the element (from bottom up). If a CSS
rule was specified, the list will be filtered by that rule

    /*
      <div id="one">
        <div id="two">
          <div id="three"></div>
        </div>
      </div>
    */

    $('three').parents();       // -> [div#two, div#one]
    $('three').parents('#one'); // -> [div#one]


### #children

    children([String css_rule]) -> Array of elements

Returns a list of the immediate descendants from the element, optionally
filtered by the given CSS rule.

    /*
      <div id="one">
        <div id="two"></div>
        <div id="three"></div>
      </div>
    */

    $('one').children();       // -> [div#two, div#three]
    $('one').children('#two'); // -> [div#two]


### #siblings

    siblings([String css_rule]) -> Array of eleemnts

Returns a list of the siblings, optionally filtered by the given
CSS rule.

    /*
      <div>
        <div id="one"></div>
        <div id="two"></div>
        <div id="three"></div>
      </div>
    */

    $('two').siblings();       // -> [div#one, div#three]
    $('two').siblings('#one'); // -> [div#one]


### #nextSiblings

    nextSiblings([String css_rule]) -> Array of elements

Collects later siblings of the element, optionally filtered by the given
CSS rule.

    /*
      <div>
        <div id="some"></div>
        <div id="one"></div>
        <div id="two"></div>
        <div id="three"></div>
      </div>
    */

    $('one').nextSiblings();         // -> [div#two, div#three]
    $('one').nextSiblings('#three'); // -> [div#three]


### #prevSiblings

    prevSiblings([String css_rule]) -> Array of elements

Returns the element previous siblings. Optionally filtered out by the given
css-rule.

    /*
      <div>
        <div id="one"></div>
        <div id="two"></div>
        <div id="three"></div>
        <div id="some"></div>
      </div>
    */

    $('three').nextSiblings();       // -> [div#two, div#one]
    $('three').nextSiblings('#one'); // -> [div#one]


### #next

    next([String css_rule]) -> Element or null

Returns the next sibling of the element or if a CSS rule is specified the
next sibling that matches the rule.

    /*
      <div>
        <div id="one"></div>
        <div id="two"></div>
        <div id="three"></div>
      </div>
    */

    $('one').next();         // -> div#two
    $('one').next('#three'); // -> div#three


### #prev

    prev([String css_rule]) -> Element or null

Returns the previous sibling of the element or if a CSS rule is specified
the previous sibling that matches the rule.

    /*
      <div>
        <div id="one"></div>
        <div id="two"></div>
        <div id="three"></div>
      </div>
    */

    $('three').prev();       // -> div#two
    $('three').prev('#one'); // -> div#one


### #first

    first(String css_rule) -> Element or null

Returns the first node in the internal structure that matches the given
CSS rule.

    /*
      <div id="one">
        <div id="two">
          <div id="three"></div>
        </div>
      </div>
    */

    $('one').first('div');    // -> div#two
    $('one').first('#three'); // -> div#three


### #find

    find(String css_rule[, boolean raw]) -> Array of elements

Finds all matching elements from the internal structure of the element.

__NOTE__: if the second attribute is set to `true`, then the method
_won't wrap_ the elements into the {Element} class instances and returns
an array of raw dom-elements instead.

    /*
      <div id="one">
        <div id="two">
          <div id="three"></div>
        </div>
      </div>
    */

    $('one').find('div');    // -> [div#two, div#three]
    $('one').find('#three'); // -> [div#three]

### #match

    match(String css_rule) -> boolean

Checks if the element matches the given CSS rule.

    // <div id="some-element"></div>

    $('some-element').match('div');  // -> true
    $('some-element').match('span'); // -> false


### #index

  index(); -> Integer element's index

Returns the integer index of the element among his siblings

  /*
   <div>
     <div id="one">one</div>
     <div id="two">two</div>
   </div>
  */

  $('one').index(); // -> 0
  $('two').index(); // -> 1


### #remove

    remove() -> Element self

Removes the element from its parent element.

    $('some-element').remove();


### #insert

    insert(mixed content[, String position]) -> Element self

Inserts the given content into the element at the given position.

The content can be one of the following:

* an element instance
* a string with HTML code (scripts will be evaluated)
* a list of elements (array, or NodeList or something iterable)

Position can be one of the following:
  top / bottom / before / after / instead

The `bottom` value is used by default.

    var element = $('some-element');

    element.insert(new Element('div', {html: 'new-div'}));

    element.insert(new Element('div'), 'top');

    element.insert([element1, element2, element3], 'before');

### #append

    append(element1[, elment2, ...]) -> Element self

A shortcut to insert several elements to the bottom of the current one

    element.append(
      $('element-1'), $('element-2'), $('element-3')
    );

    // same as
    element.insert([
      $('element-1'), $('element-2'), $('element-3')
    ], 'bottom');

### #insertTo

    insertTo(Element destination[, String position]) -> Element self

Inserts the current element into the given one, optionally at the given
position.

    var element1 = $('element1');
    var element2 = $('element2');

    element1.insertTo(element2, 'top');

    element2.first() === element1;


### #replace

    replace(mixed content) -> Element self

Replaces the current element with the given content.

    // <div id="one"><div id="two"></div></div>

    $('two').replace('boo boo boo');
    $('one').html() === 'boo boo boo';


### #update

    update(mixed content) -> Element self

Replaces the internal structure of the element with the given content.

__NOTE__: All scripts will be evaluated _after_ the update.

    // <div id="one">foo bar</div>

    $('one').update('something else');

    $('one').html() === 'something else';


### #html

    html()               -> String innerHTML
    html(mixed content); -> Element self

A bidirectional method to work with the element's `innerHTML` property.

    $('element').html('bla bla bla');
    $('element').html(); // -> 'bla bla bla'


### #text

    text()               -> String innerHTML without tags
    test(String content) -> Element self

A bidirectional method to work with element's `innerHTML` property as text

    $('element').text('<b>boo hoo!</b>');
    $('element').html(); // -> '&lt;b&gt;boo hoo!&lt;/b&gt;'

    $('element').html('<b>boo hoo!</b>');
    $('element').text(); // -> 'boo hoo!'


### #wrap

    wrap(Element wrapper) -> Element self

Wraps the current element with the given one.

    // <div id="one"><div id="two"></div></div>

    $('two').wrap(new Element('div', {id: 'three'}));

    $('one').html() == '<div id="three"><div id="two"></div></div>';


### #clean

    clean() -> Element self

Removes all child nodes from the element.

    $('element').clean();
    $('element').html(); // -> ''


### #empty

    empty() -> boolean

Checks if the element has no internal text or elements.

    $('element').empty();


### #clone

    clone() -> Element new

Creates a complete clone of the current element with the same content

    var element = $('element');
    var clone   = element.clone();

    element        != clone;
    element._      != clone._;
    element.html() == clone.html();


### #setStyle

    setStyle(String key, String value) -> Element self
    setStyle(Object styles)            -> Element self
    setStyle(String styles_def)        -> Element self

Assigns a style to the element.

    $('element').setStyle('display', 'block');

    $('element').setStyle({
      display: 'block',
      border:  '1px solid gray'
    });

    $('element').setStyle('display:block;color:red');


### #getStyle

    getStyle(String name) -> String value or null

Requests the element style by name. Supports both camelized and dasherized
names.

__NOTE__: Checks both element styles as well as the computed (CSS) styles.

    $('element').hide();

    $('element').getStyle('dispaly'); // -> 'none'


### #hasClass

    hasClass(String class) -> boolean

Checks if the element is assigned to the given CSS class name.

    $(element).setClass('foo bar');

    $(element).hasClass('foo'); // -> true
    $(element).hasClass('bar'); // -> true
    $(element).hasClass('boo'); // -> false


### #setClass

    setClass(String name) -> Element self

Replaces all the element CSS class names with the given one.

    var element = document.getElementById('element');
    element.className = 'foo bar';

    $(element).setClass('boo');

    element.className; // -> 'boo'


### #getClass

    getClass() -> String className

A simple `className` property getter

    $('element').setClass('foo bar');
    $('element').getClass(); // -> 'foo bar'


### #addClass

    addClass(String name) -> Element self

Adds the given CSS class name to the element class names list.

    var element = document.getElementById('element');
    element.className = 'foo';

    $(element).addClass('bar');

    element.className; // -> 'foo bar'



### #removeClass

    removeClass(String name) -> Element self

Removes the given CSS class name from the element class names list.

    var element = document.getElementById('element');
    element.className = 'foo bar';

    $(element).removeClass('bar');

    element.className; // -> 'foo'


### #toggleClass

    toggleClass(String name) -> Element self

Toggles the CSS class name presence on the element class names list.

    var element = document.getElementById('element');
    element.className = 'foo';

    $(element).toggleClass('bar')
    element.className; // -> 'foo bar';

    $(element).toggleClass('bar')
    element.className; // -> 'foo';


### #radioClass

    radioClass(String name) -> Element self

Removes the CSS class name from all siblings of the element and adds it to
the element.

    $('element').radioClass('boo');


### #on

    on(String eventName, Function listener)             -> Element self
    on(String eventName, String method[, argument,...]) -> Element self
    on(String eventName, Array list_list_of_callbacks)  -> Element self
    on(Object event_listeners_hash)                     -> Element self

Binds an event listener to the element.

    $('element').on('click', function() {
      // do something about it
    });

    $('element').on('click', 'addClass', 'clicked');

    $('element').on('click', [function1, function2]);

    $('element').on({
      click: function1,
      dblclick: function2
    });


### #observes

    observes(Function listener)              -> boolean
    observes(String name, Function listener) -> boolean

Checks if the given listener observers the element events. You can do either
a general check or against a specific event name.

    var func = function() {};

    element.on('click', func);

    element.observes(func);              // -> true
    element.observes('mouseover', func); // -> false


### #listeners

    listeners()            -> Array of functions
    listeners(String name) -> Array of functions


Returns a list of element event listeners which can optionally be narrowed
down by an event name scope.

    var func = function() {};

    element.on('click', func);

    element.listeners();            // -> [func]
    element.listeners('click');     // -> [func]
    element.listeners('mouseover'); // -> []



### #stopObserving

    stopObserving(Function listener)       -> Element self
    stopObserving(String name[, listener]) -> Element self

Unsubscribes the event listener. This can be done globally for a particular
event name, for some particular listener or for some particular listener and
event name.

    var listener = function() {};

    $('element').on('click', listener);

    $('element').stopObserving('click');

    $('element').stopObserving(listner);

    $('element').stopObserving('click', listner);


### #delegate

    delegate(String event, String css_rule, Function callback) -> Element self
    delegate(String event, String css_rule, String callback)   -> Element self
    delegate(String event, Object css_rules_and_callbacks)     -> Element self

Delegates events handling to subelements that match the given css-rule.

__NOTE__: Callbacks will be called in the context of _matching_ elements

    $(element).delegate('click', 'div.blue',  func_1);
    $(element).delegate('click', 'div.green', func_2);

    $(element).delegate('click', 'div.blue',  'addClass', 'was-blue');
    $(element).delegate('click', 'div.green', 'addClass', 'was-green');

    $(element).delegate('click', {
      'div.blue':  func_1,
      'div.green': func_2
    });


### #delegates

    delegates(String event[, String css_rule[, Function callback]]) -> boolean
    delegates(String event[, Object rules_and_callback])            -> boolean

Checks if this element delegates certain events to certain types of
sub-elements

    $(element).delegates('click');
    $(element).delegates('click', 'div.red');
    $(element).delegates('click', 'div.red', callback);

    $(element).delegates('click', {
      'div.red':  callback_1,
      'div.blue': callback_2
    });


### #undelegate

    undelegate(String event[, String css_rule[, Function callback]]) -> Element
    undelegate(String event[, Object rules_and_callback])            -> Element

Switches off events delegation attached by the {#delegate} method.

    $(element).undelegate('click');
    $(element).undelegate('click', 'div.blue');
    $(element).undelegate('click', 'div.blue', callback);

    $(element).undelegate('click', {
      'div.red':  callback_1,
      'div.blue': callback_2
    });


### #size

    size() -> Object {x: NN , y: NN}

Returns the element sizes hash.

    var width  = $('element').size().x;
    var height = $('element').size().y;



### #position

    position() -> Object {x: NN , y: NN }

Returns the absolute position of the element on the page.

    var top  = $('element').position().y;
    var left = $('element').position().x;



### #scrolls

    scrolls() -> Object {x: NN , y: NN }

Returns the scroll values of the element in a hash.

    var scroll_top  = $('element').scrolls().y;
    var scroll_left = $('element').scrolls().x;


### #dimensions

    dimensions() -> Object

Returns the dimensions of the element in a single hash. Includes the
`width`, `height`, `top` and `left` positions as well as `scrollLeft` and
`scrollTop` values.

    $('element').dimensions();


### #setWidth

    setWidth(number pixels) -> Element self

Sets the element width to the given size.

__NOTE__: This method will automatically adjust the actual style.width for
existing paddings and borders so the end result will be exactly as requested.

    var element = new Element('div', {
      style: {
        border: '10px solid gray',
        padding: '10px'
      }
    });

    element.setWidth(100);

    element._.offsetWidth; // -> 100
    element._.style.width; // -> 80px



### #setHeight

    setHeight(number pixels) -> Element self

Sets the height of the element to the given size.

__NOTE__: This method will automatically adjust the actual style.height for
existing paddings and borders so the end result will be exactly as requested.

    var element = new Element('div', {
      style: {
        border: '10px solid gray',
        padding: '10px'
      }
    });

    element.setWidth(100);

    element._.offsetWidth; // -> 100
    element._.style.width; // -> 80px

### #resize

    resize(number width, number height) -> Element self
    resize({x: number, y: number})      -> Element self

Sets the size of the element.

__NOTE__: This method will automatically adjust the actual style for existing
paddings and borders so the end result will be exactly as requested.

    var element = new Element('div', {
      style: {
        border: '10px solid gray',
        padding: '10px'
      }
    });

    element.resize(100, 100);

    element._.offsetHeight; // -> 100
    element._.offsetWidth;  // -> 100
    element._.style.width;  // -> 80px
    element._.style.height; // -> 80px


### #moveTo

    moveTo(number left, number top) -> Element self
    moveTo({x: number, y: number})  -> Element self

Move the element to the given position.

    element.moveTo(100, 100);
    element.moveTo({x: 100, y: 100});


### #scrollTo

    scrollTo(number left, number top) -> Element self
    scrollTo({x: number, y: number})  -> Element self

Sets the scrolling position of the element.

    element.scrollTo(100, 100);
    element.scrollTo({x: 100, y: 100});

### #scrollThere

    scrollThere() -> Element self

Scrolls the window to the element.

    element.scrollThere();


### #load

    load(String url[, Object options]) -> Element self

This method loads the given URL and updates the innerHTML property of
the element with the response body.

Takes all the standard {Xhr} class options as the second parameter.

If there is any JavaScript code in the response, it will by default be
automatically evaluated after the element body was updated.

__NOTE__: Will perform a `GET` request by default.

    element.load('/something');

    element.load('/something', {
      method: 'post',
      spinner: 'spinner-id'
    });

### #stop

    stop() -> Element self

Immediately stops and cancels all active visual effects on the element

    $('element').slide().fade().stop();

