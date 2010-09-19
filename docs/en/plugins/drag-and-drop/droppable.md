# Droppable

`Droppable` is the standard droppable units handling class from the
[drag-and-drop](/plugins/drag-and-drop) library.

The public API consists of only two methods: constructor and destructor. The
constructor receives a reference to an element and the options hash while the
destructor is just a method which detaches all the events handling from the
element thus rendering it not droppable anymore.

    // Make 'my-element' droppable ...
    var droppable = new Droppable('my-element', {accept: 'div'});

    // ... and remove the dropping ability again
    droppable.destroy();


You can also use the auto-initialization feature and the {Element} level shortcuts to
create droppables. See the main [drag-and-drop](/plugins/drag-and-drop) page for
more details.

<%= anchors_index %>

## Options List, :options

There are a number of options you can specify for your droppables:

Name        | Default           | Description
------------|-------------------|---------------------------------------------------------------------------
accept      | '\*'              | CSS rule to filter out acceptable elements
containment | null              | list of elements (or ids) that should be accepted
overlap     | null              | `x/y/horizontal/vertical/both` draggable - droppable overlapping condition
overlapSize | 0.5               | the overlapping level, 0 for nothing 1 for the whole thing
allowClass  | 'droppable-allow' | CSS class for elements that should accept draggables
denyClass   | 'droppable-deny'  | CSS class for elements that shouldn't accept a draggables
relName     | 'droppable'       | automatically initialized items feature key

As usual you can specify them as initialization options for every particular droppable unit or
customize the `Draggable.Options` in order to change the global settings.

## Events List, :events

There are a few events to notify your application about droppables:

Name  | Description
------|-------------------------------------------------
hover | when a draggable is hovered over the droppable
leave | when a draggable leaves the droppable
drop  | when a draggable was accepted and dropped

All these event listeners receive three arguments: the draggable object, the droppable object and the mouse
event that caused the event.

    new Droppable('my-element', {
      onDrop: function(draggable, droppable, event) {
        //...
      }
    });
