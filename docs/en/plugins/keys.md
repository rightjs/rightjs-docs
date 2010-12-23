# Key Events

This is a very simple plugin that provides pretty event names for keyboard
events.

<%= partial '/plugins/download', :locals => {:name => 'keys'} %>

## Usage Basics, :usage

The usage is pretty simple, just hook up one of the javascript file shown
above and after that you'll be able to do things like that

    $('my-element').on('esc', function() {
      // handle Esc button in here
    });

    $(document).on('enter', function() {
      // handle the Enter button
    });

    $(document).on('ctrl+z', ....);
    $(document).on('ctrl-shift-z', ....);

    $(document).on('Ctrl+Alt+Delete', function() {
      console.log("Good times, good times...");
    });

You can specify a key name with or without modifier(s) and your handler will
be called only when that specified keyboard combination was triggered.

## Key Names, :keys

For key names, you can use any letter from `a` to `z` or a number, or any
of the following predefined names

* `backspace`
* `tab`
* `enter`
* `esc`
* `space`
* `pageup`
* `pagedown`
* `end`
* `home`
* `left`
* `up`
* `right`
* `down`
* `insert`
* `delete`

Us any letters case you like, works any way

## Modifiers List, :modifiers

Modifiers can be one of the following

* `'ctrl'` or `'ctl'`
* `'alt'` or `'meta'`
* `'shift'`

You can join modifiers and key names via spaces, dashes or the `+` symbol,
for example

    'ctrl z'
    'ctrl-z'
    'ctrl+z'
    'ctrl+shift-alt z'

Works either way.
