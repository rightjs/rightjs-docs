# Drag-and-drop Module

This is the standard drag-and-drop library for RightJS. As most libraries of this type it
contains basically two units: `Draggable` and `Droppable`. There are two separated documents
for each of them as well as a page with a few simple demos.

* [Draggable](/goods/drag-and-drop/draggable)
* [Droppable](/goods/drag-and-drop/droppable)
* [Demo Page](/goods/drag-and-drop/demo)

<%= anchors_index %>

## Download, :download

This library comes as three standard builds

* [right-dnd.js](/builds/goods/right-dnd.js)
* [right-dnd-min.js](/builds/goods/right-dnd-min.js)
* [right-dnd-src.js](/builds/goods/right-dnd-src.js)
  
It is also available as an option on the [custom build](<%= builds_path %>) page.

## Auto-Discovery Feature, :discovery

This library provides the standard RightJS auto-discovery feature by use of the
`'rel'` attribute as well as HTML5 style option attributes like this:

    <div rel="draggable" data-draggable-options="{revert: false}">Drag me to hell</div>

    <div rel="droppable" data-droppable-options="{accept: '.sinner'}">Hell</div>

## Element Level Methods, :methods

There are several {Element} level shortcut methods to covert elements into
draggable or droppable units.

Name                       | Description
---------------------------|---------------------------------
makeDraggable(\[options\]) | makes the element draggable
undoDraggable()            | reverts the draggable conversion
makeDroppable(\[options\]) | makes the element droppable
undoDroppable()            | reverts the droppable conversion


## Performance Notes, :performance

In our implementation the number of _draggable_ elements on your page _will not affect_
your application performance, all of them will be handled in the same way at the same 
performance cost.

However, the performance _does depend_ on the number of _droppable_ targets. There's a
difference between usual droppables and droppables with the `overlap` option turned on:
Normal droppables are pretty performant and depending on the complexity of your page, 
you can safely have 100 or more of them. For the latter type, however, which tracks the 
actual draggable and droppable elements overlapping, the number of elements should be
limited to maybe half or a third (depending on the browser).
