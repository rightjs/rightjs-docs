# Casting Plugin

`Casting` is a plugin that allows an advanced dynamic typecasting
features for RightJS dom-wrappers.

<%= partial '/plugins/download', :locals => {:name => 'casting'} %>


## Basic Idea, :idea

By default, RightJS allows you to register new dom-wrappers for elements with
specific tags. For example

    Element.Wrappers.TABLE = new Class(Element, {
      sort: function() {
        // sort the table rows
      }
    });

After that, every time you access or create a table element, it will use your
new dom-wrapper.

    var table1 = new Element('table');
    var table2 = $('some-table-id');

    table1 instanceof Element.Wrappers.TABLE; // -> true
    table2 instanceof Element.Wrappers.TABLE; // -> true

This plugin allows you to register new types not just for elements with a
specific tag name, but with an ID or a class name as well, for example

    var BlueElement = Element.Wrappers.set(
      '.blue', new Class(Element, {...})
    );

    var GreenElement = Element.Wrappers.set(
      '.green', new Class(Element, {...})
    );

    var ThatDiv = Element.Wrappers.set(
      'div#that', new Class(Element, {...})
    );

    // ...

After that, whenever you access an element that match a given rule it will
automatically wrapped in a dom-wrapper class you had specified.



## Allowed CSS Rules, :css

This plugin allows you to use the following types of css rules with the
`Element.Wrappers.set` method

 * 'tag'
 * '#some-id'
 * '.class-name'
 * 'tag#some-id'
 * 'tag.class-name'

__NOTE__: this plugin doesn't support all the css selectors, just those ones!



## API Reference, :api

There are the following methods appear at the `Element.Wrappers` object

Name                                | Description
------------------------------------|---------------------------------
set(String css_rule, Class wrapper) | registers a custom dom-wrapper
get(String css_rule)                | finds the wrapper by a css-rule
get(Class wrapper)                  | finds a list of css-rules for a wrapper
has(String css_rule)                | checks if there is a wrapper for this rule
has(Class wrapper)                  | checks if this wrapper is registered
remove(String css_rule)             | Removes a wrapper by a css-rule
remove(Class wrapper)               | Unregisters a certain wrapper



