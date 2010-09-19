# Colorpicker

`Colorpicker` is a simple widget that allows the user to choose any sort of
colors in a photoshop-like dialog.

<%= partial '/ui/head', :locals => {:name => 'colorpicker'} %>

<%= anchors_index %>

## Features List, :features

 * Works as a standalone widget
 * Works in pair with input fields
 * Can automatically update another element's background
 * Simple and flexible usage

## Usage Basics, :usage

First, copy in place one of the files above, as you usually do. Then copy
[this image](/images/rightjs-ui/colorpicker.png) to the same location on your
server. (check the [styles section](#styles) for more options on this regard)

After that the usage principles are pretty much the same as for the
[Calendar](/ui/calendar) widget. You can use it as an inline widget by
inserting it at any place on your page

    <div id="my-element"></div>

    new Colorpicker().insertTo('my-element');

Or you can assign it to an input element to make it work in pair with it

    <input type="text" id="my-field" />

    new Colorpicker().assignTo('my-field');

You also can use an input-field and a trigger pair like that

    <input type="text" id="my-field" />
    <input type="image" id="trigger" />

    new Colorpicker().assignTo('my-field', 'trigger');

And you can let the script automatically initialize and assign pickers by
using the standard for RightJS HTML5 attribute `data-colorpicker`

    // a single inputfield with colorpicker
    <input type="text" data-colorpcker="" />
    <input type="text" data-colorpcker="{format: 'rgb'}" />

    // an input field with a trigger
    <input type="text" id="my-field" />
    <input type="image" data-colorpicker="{update: 'my-field'}" />

__NOTE__: you can use any sort of elements for the trigger, it doesn't have to
be an input element.


## Options List, :options

There is a small and simple list of options available for this widget

Name       | Default | Description
-----------|---------|-------------------------------------------------
format     | 'hex'   | the output format, `'hex'` or `'rgb'`
update     | null    | an element to update with the color text
updateBg   | null    | an element to update it's background color
trigger    | null    | a trigger element reference
fxName     | 'fade'  | the popup showing/hiding visual effect
fxDuration | 'short' | the visual effect duration
cssRule    | '\*\[data-colorpicker\]' | the auto initialization feature css-rule

As usual you can use any of those options with the `Colorpicker` class
constructor or use the `data-colorpicker` HTML5 attribute to set
options for the automatically initialized fields


## Events List, :events

There is a short list of events available to be used with this widget

Name   | Description
-------|-----------------------------------------------------
change | when the color was changed
show   | when the popup `show` action was called
hide   | when the popup `hide` action was called
done   | when the `Done` button was clicked


## API Reference, :api

There are several additional public methods available to help you work with colorpickers

Name              | Description
------------------|-------------------------------------------------------
setValue(color)   | sets the current color, can be in the HEX or RGB format
getValue()        | returns the current color string formatted by the options
toRgb()           | returns the current color in the RGB format
toHex()           | returns the current color in the HEX format
assignTo(element\[, trigger\])  | assigns the colorpicker as a popup dialog
updateBg(element) | assigns the element's background to be automatically updated


## Style Alterations, :styles

The colorpicker widget has the following HTML structure

    <div class="rui-colorpicker rui-panel">
      <div class="field">
        <div class="pointer"></div>
      </div>
      <div class="colors">
        <div class="pointer"></div>
      </div>
      <div class="controls">
        <div class="preview"></div>
        <input type="text" class="display" />
        <div class="rgb-display">
          <div><label>R:</label><input type="text" /></div>
          <div><label>G:</label><input type="text" /></div>
          <div><label>B:</label><input type="text" /></div>
        </div>
        <input type="button" class="rui-button" />
      </div>
    </div>

__NOTE__: This widget needs [this image](/images/rightjs-ui/colorpicker.png),
you should save it at the same location in your project, or define another
one in your CSS layer like that

    div.rui-colorpicker div.field,
    div.rui-colorpicker div.field div.pointer,
    div.rui-colorpicker div.colors,
    div.rui-colorpicker div.colors div.pointer {
      background-image: url(/my/image.png);
    }
