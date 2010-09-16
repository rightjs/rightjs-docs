# jQuerysh

This simple plugin changes the `$()` function behavior to the one that jQuery
users got used to

<%= partial '/plugins/download', :locals => {:name => 'rails'} %>

## jQuery Style Navigation, :navigation

First of all it changes a bit the way you navigate through the pages

    $('#element-id'); // -> Element
    $('div.css#rule); // -> Array of Elements

Unlike jQuery, RightJS differs access to a separated element and a group of
elements, but general feeling is about the same.

## jQuery Style DOM-Ready, :ready

The second thing that this plugin does, it allows to call a certain function
when the document is loaded in the way they do it in jQuery

    $(function() {
      // same as $(document).onReady
    });

This is about it, simple and useful.
