# RightJS RTE

`RRTE` is the standard rich-text editor feature for RightJS, it initializes
over normal textarea elements and designed to work with your forms.

<%= partial '/ui/head', :locals => {:name => 'rte'} %>

<%= anchors_index %>


## Features List, :features

* No frames, RRTE is embedded right into your page
* Configurable formatting and tools
* Tiny size (~ 10k gzipped)
* Super easy usage


## Usage Basics, :usage

RRTE is designed to make it super easy to have rich-text editors on your
forms. All you need to make it up and running is to include one of the files
above on your page and save [this image](/images/rightjs-ui/rte.png)
at the same location on your server.

After that just use the standard for RightJS UI `data-rte` attribute with your
textarea element

    <textarea name="text" data-rte="{}">
      Your <b>HTML</b> <u>content</u> <i>in here</i>
    </textarea>

That's all it takes. RRTE will automatically find your textarea element and
initialize an RTE widget in its place.

You also can initialize RTE widgets programmatically

    var rte = new Rte('my-textarea-id', {
      // options
    });

Or even like that

    $('my-textarea-id').getRich({
      // options
    });

In either case, RTE will automatically keep the widget and your textarea
element synchronized so that when the user is done editing the text and hit
the submit button it will all look like if he filled the textarea element
himself.


## Sizes Configuration, :sizes

By default, when RRTE initializes it will take the original textarea width
and try to stretch vertically to fit the content.

If you don't want the editor to stretch vertically, just specify the
`autoresize: false` option and RRTE will keep the same size as the original
textarea.

Otherwise, if you need to tackle its size, just change the initial size of
your textarea with css and RRTE will follow.


## Toolbars Configuration, :toolbars

RRTE has toolbar presets which are stored in the `Rte.Toolbars` object. By
default there are three of them: `'small'`, `'basic'` and `'extra'`. You can
use those names with the `'toolbar'` option in any standard way.

    <textarea data-rte="{toolbar: 'basic'}"></textarea>

    // or programmatically
    var rte = new Rte('my-textarea', {
      toolbar: 'extra'
    });

You're free to add/redefine toolbar presets as you pleased. Run

    console.log(Rte.Toolbars);

for examples how it's done. All the available tools are stored in the
`Rte.Tools` object.

And finally, you can specify the whole toolbar definition instead of a preset
name with the `toolbar` option.


## Formatting Configuration, :formatting

Unlike other RTE's out there, RRTE allows you to specify which tags exactly
should it use to format the text. Those configurations are split in several
blocks.

First of all, basic formatting tools are specified in the `Rte.Tags` hash

    Rte.Tags = {
      Bold:      'b',
      Italic:    'i',
      Underline: 'u',
      Strike:    's',
      Ttext:     'tt',
      Code:      'pre',
      Quote:     'blockquote',
      Header:    'h2'
    };

The keys refer to the names of tools (buttons) and the values are the tag
names, which will be used to format the text.

The block formatting drop-down menu is stored in the `Rte.Formats` object

    Rte.Formats = {
      'h1':         'Header 1',
      'h2':         'Header 2',
      'h3':         'Header 3',
      'h4':         'Header 4',
      'p':          'Paragraph',
      'pre':        'Preformatted',
      'blockquote': 'Blockquote',
      'tt':         'Typetext',
      'address':    'Address'
    };

Here, the values are the names of the formats that will be visible in the
menu and the keys are the tags which should be used.

You can add your own options on the list or remove the ones you don't need.
Additionally, you can specify a `'tag.class'` option like that

    Rte.Formats = {
      'div.blue':     'Blue block',
      'code.example': 'Example code',
      ....
    };

The font-name and font-size menu options are stored at those two parameters

    Rte.FontNames = {
      'Andale Mono':     'andale mono,times',
      'Arial':           'arial,helvetica,sans-serif',
      'Arial Black':     'arial black,avant garde',
      'Book Antiqua':    'book antiqua,palatino',
      'Comic Sans MS':   'comic sans ms,sans-serif',
      'Courier New':     'courier new,courier',
      'Georgia':         'georgia,palatino',
      'Helvetica':       'helvetica',
      'Impact':          'impact,chicago',
      'Symbol':          'symbol',
      'Tahoma':          'tahoma,arial,helvetica,sans-serif',
      'Terminal':        'terminal,monaco',
      'Times New Roman': 'times new roman,times',
      'Trebuchet MS':    'trebuchet ms,geneva',
      'Verdana':         'verdana,geneva',
      'Webdings':        'webdings',
      'Wingdings':       'wingdings,zapf dingbats'
    };

    Rte.FontSizes = '6pt 7pt 8pt 9pt 10pt 11pt 12pt 14pt 18pt 24pt 36pt';

You also free to change those lists as you see fit.


## Keyboard Shortcuts, :keyboard

RRTE has a simple keyboard shortcuts settings that are stored in the
`Rte.Shortcuts` object

    Rte.Shortcuts = {
      Bold:      'b',
      Italic:    'i',
      Underline: 'u',
      Header:    'h',
      Link:      'l',
      Cut:       'x',
      Copy:      'c',
      Paste:     'v',
      Undo:      'z',
      Redo:      'shift+z',
      Source:    'e',
      Code:      'p',
      Save:      's'
    };

Here, the keys refer to the tool names, and the letters refer to the
keyboard keys. The key bindings work with both, the `Ctrl` and `Cmd`
modifiers, so they are pretty much natural for both `Win` and `OSX` users


## Options List, :options

You can use the following basic options list with RRTE

Name        | Default   | Description
------------|-----------|--------------------------------------------
toolbar     | 'small'   | toolbar, the name or an array of your own
autoresize  | true      | automatically resize the editor's height
showToolbar | true      | show the toolbar
showStatus  | true      |  show the status bar
videoSize   | '425x344' | flash-video blocks default size


## Events List, :events

All the `Rte` class instances in addition to the standard {Element} events
also provide support of the following events to emulate the {Input} class

Name   | Description
-------|-------------------------------------------
change | when the content of the editor was changed
focus  | when the editor was focused
blur   | when it's lost his focus


## API Reference, :api

As all the rest of RightJS UI widgets, RRTE is a subclass of the {Element}
class, which means you can manipulate with `Rte` instances as any other
dom-element, place it anywhere you like and navigate through it's content

Additionally `Rte` class has the following methods to make it compatible with
the {Input} class instances

Name                  | Description
----------------------|----------------------------------------------------
setValue(value)       | sets the rte value as an HTML string
getValue()            | gets the rte value as an HTML string
value(\[value\])      | bidirectional method to set/get the value
disable()             | disables the RTE
enable()              | enables the RTE
focus()               | puts the focus on the RTE
blur()                | removes the focus from the RTE
assignTo(\[texarea\]) | assigns this RTE to be synced with a textarea element


## Styles Alteration, :styles

Unlike other RTE widgets, RRTE doesn't use frames and presents a simple HTML
structure like this.

    <div class="rui-rte">
      <div class="rui-rte-toolbar">
        <div class="line">
          <div class="bar">
            <div class="tool bold"><div class="icon"></div></div>
            <div class="tool italic"><div class="icon"></div></div>
            <div class="tool underline"><div class="icon"></div></div>
            .....
          </div>
          ....
        </div>
        .....
      </div>

      <div class="rui-rte-editor">
        // your content goes in here
      </div>

      <div class="rui-rte-status">
        <a href="">tag</a>
        ....
      </div>
    </div>

__NOTE__: As we don't use any frames, all the content inside of the
`'rui-rte-editor'` element will follow all your css styles on the page, so
if you need to style the content inside, just add your css right on the page
and it will work automatically.


