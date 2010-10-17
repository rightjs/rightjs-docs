# Sortable

Right Sortable is the sortable lists feature for RightJS

<%= partial '/ui/head', :locals => {:name => 'sortable'} %>

<%= anchors_index %>


## Features List, :features

Right Sortable has the following features:

* RESTful design friendly urls processing
* Automatic vertical/horizontal direction recognition
* Auto-Initialization feature support
* Allows to drag items between lists
* Tiny size of less than 2k gzipped
* Has no dependency from the drag-n-drop library


## Usage Basics, :usage

There are several ways to initialize sortable lists. First of all using the `Sortable`
class directly inside your JavaScript code

    new Sortable('todos', { url: '/todos' });

Then, as most of the RightJS UI widgets, you can initialize sortables using
standard for RightJS HTML 5 attribute `data-sortable`

    // simple sortable
    <ul data-sortable="">
      <li>Item 1</li>
      <li>Item 2</li>
    </ul>


    // remote sortable
    <ul data-sortable="{url: '/todos'}">
      <li id="item_1">Feed the fish</li>
      <li id="item_2">Call mommy</li>
    </ul>


## Options List, :options

You might use the following options to customize your sortables

Name      | Default    | Description
----------|------------|---------------------------------------------------------------------
url       | null       | the Xhr requests url address, might contain the '%{id}' placeholder
method    | 'put'      | the Xhr requests method
Xhr       | {}         | additional Xhr options
idParam   | 'id'       | the url id value name
posParam  | 'position' | the url position value name
parseId   | true       | if the id attribute should be converted into an integer before sending
accept    | null       | reference or a list of references for interchangeable sortables
minLength | 1          | minimal count of items that allowed to be left in a list
itemCss   | 'LI'       | sortable items list css-rule
handleCss | 'LI'       | handle elements css-rule (same as the items by default)
cssRule   | '\*\[data-sortable\]' | the auto-initializable elements marker


## Events List, :events

There are several events you can use to handle sortables

Name   | Description
-------+----------------------------------------------------
start  | when the item drag starts
change | when an item slipped to a new position
finish | when the user releases the item


    new Sortable('todos', {
      onChange: function(event) {
        event.list;  // reference to the target list
        event.item;  // reference to the handled item
        event.index; // the index of the related item
        event.event; // original dom-event object
        // ....
      }
    });


## Urls And Remote Calls Processing, :remote

In this area everything is pretty much straight forward, you can define the `url` and `method` with the options,
plus you can specify some additional Xhr params, like spinners, callbacks, etc. at the `'Xhr'` option.

Additionally, our sortables support the '%{id}' placeholder in the urls so you can define RESTful
friendly url addresses like that

    new Sortable('boo', {
      url: 'todos/%{id}.js'
    });

After that the sortable will try to get an ID out of a moved element, optionally parse an integer
number out of it and replace the place holder with the ID, so it will hit addresses like that

    /todos/1.js
    /todos/2.js
    .....
