# Behaviors Module

__NOTE__: This module is deprecated and will be removed with RightJS 1.6 release! Use the
built in events delegation features instead. [Check this tutorial](/tutorials/events-delegation)


The behaviors module provides the ability to define behaviors on element groups selected by
CSS rules. It watches any changes on the web-page and automatically updates the matching 
elements.

<%= anchors_index %>

<%= partial '/plugins/download', :locals => {:name => 'behavior'} %>

## Simple Example, :simple

The usage is really simple: Just define a CSS rule and assign events you wish to handle:

    "#todo-list div.item".behave('click', function() {...});

The above example tells all todo list items on the page to handle the `'click'` event. In
other words: The function will be called whenever a todo list item is clicked. Furthermore,
if you add new items to the todo list, the behavior will automatically be assigned to them
as well.

If you define the behavior during page loading time, the script will scan through the page
entire page once more when it finished loading.

## RightJS Features Are Also Available, :rightjs

The `'behave'` method supports all the same argument types as the {Observer#on} method,
including the [call by name](/tutorials/call-by-name) feature, custom events and so on.
There are no limitations at all.

    // Hash of events
    "#todo-list div.item".behave({
      click:     function1,
      mouseover: function2,
      mouseout:  function3
    });

    // Or list
    "#todo-list div.item".behave('click', [function1, function2, ...]);

    // Or by name
    "#todo-list div.item".behave('click', 'radioClass', 'selected');


## Stopping Behavior, :stopping

If you need to cancel some behavior, just call the `'stopBehave'` method and it will remove all
the registered callbacks out of processed elements and will stop watching the page updates.

    "#todo-list div.item".behave('click', function() {});

    "#todo-list div.item".stopBehave();


## Manual Triggering, :manual

By default RightJS keeps track of changes you make on the page with RightJS {Element} methods, like
{Element#insert}, {Element#update} etc. If you have changed the page manually say by altering an
`innerHTML` attribute, you should trigger the behaviors update by calling the `{Behavior.refresh}`
method.

    "#todo-list div.item".behave('click', 'toggleClass', 'selected');

    $('todo-list').innserHTML = "...";

    // This will go through all the registered behaviors and rescan the page.
    Behavior.refresh();


## Events Delegation, :delegation

RightJS let's you create events delegation objects, which as the name suggests delegate events to
functions based on rules. For the mapping you specify `CSS rule -> handler function` hashes:

    var delegation = Behavior.delegate({
      ".foo": function() { alert('foo'); },
      ".bar": function() { alert('bar'); }
    });

    "div.something".behave('click', delegation);

In this example all `div.whatever` elements will trigger an alert `'foo'` if they belong to the
class `'foo'` and an allert `'bar'` if they belong to the class `'bar'`.


## Tough Bastards Way, :tough

For more complex situations, you may need a more powerful approach of organizing your behaviors
using classes, objects and so on. RightJS features a class called `Behavior`, which has the 
following simple methods:

Name    | Description
--------|------------------------------------------------------------
start   | makes the behavior active
stop    | deactivates the behavior
active  | checks if the behavior is active
refresh | rescans the page for elements matching this behave CSS rule

The usage is pretty much straight forward:

    new Behavior("#todo-list div.item", "click", function() {...});
    new Behavior("#todo-list div.item", "click", [func1, func2, func3]);
    new Behavior("#todo-list div.item", "click", "radioClass", "selected");

    var behave = new Behavior("css-rule", {event: function() {}});
    behave.start().stop().start().refresh();
