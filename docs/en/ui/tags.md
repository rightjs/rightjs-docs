# Tags

`Tags` is a user friendly handler for a tags/tokens input field. It
initializes over a normal input field that contains a coma separated tags list
and makes a more user-friendly and css customizable widget out of it.

<%= partial '/ui/head', :locals => {:name => 'tags'} %>

<%= anchors_index %>

## Features List, :features

* CSS-customizable interface
* Automatic initialization
* Simple usage
* Small size (3.2k gzipped with styles)


## Usage Basics, :usage

Usage of this widget is very simple, just include one of the files above onto
your page and then either use RightJS standard auto-initialization feature,
like that

    <input type="text" value="one, two, three" data-tags="{}" />

Or, initialize a tags widget over a normal input field programmatically

    <input type="text" value="one, two, three" id="my-tags-field" />

    var tags = new Tags('my-tags-field', {
      // options in here
    });

If you need the autocompletion feature, just specify the list of known tags
in the standard options

    <input type="text" data-tags="{tags: ['one', 'two', 'three']}" />

Or even without options, just with a plain list

    <input type="text" data-tags="['one', 'two', 'three']" />

All the tags found in the `value` attribute will be automatically added to the
list.


## Options List, :options

You can use the following list of options with this widget

Name         | Default | Description
-------------|---------|------------------------------------------
tags         | \[\]    | the tags list
vertical     | false   | use a vertical tags list
allowNew     | true    | allow new tags to be created
nocase       | true    | case insensitive mode
autocomplete | true    | autocomplete the user's input
separator    | ','     | the tokens separator

You can specify those options either with the `data-tags` attribute or with
the `Tags` class constructor, or change them globally in the `Tags.Options`
object


## Events List, :events

In additional to the standard {Input} class events, the `Tags` class also
supports the following events

Name   | Description
-------|-------------------------------------------------------
add    | when a new tag was added
remove | when a tag was removed

Both those events will have an additional attribute called `tag`, which will
contain the tag text


## Style Alterations, :style

The `Tags` widget has a pretty simple HTML construction

    <input type="text" class="rui-tags" />
    <div class="rui-tags">
      <ul class="list">
        <li><div class="text">Tag 1</div><div class="close">&times;</div></li>
        <li><div class="text">Tag 2</div><div class="close">&times;</div></li>
        <li><div class="text">Tag 3</div><div class="close">&times;</div></li>

        <input type="text" />
      </ul>

      <ul class="rui-dd-menu">
        <li>Tag 1</li>
        <li>Tag 2</li>
        <li>Tag 3</li>
      </ul>
    </div>

Feel free to alter it as you need.
