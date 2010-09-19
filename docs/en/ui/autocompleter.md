# Right Autocompleter

Right `Autocompleter` is the official autocompletion feature for RightJS

<%= partial '/ui/head', :locals => {:name => 'autocompleter'} %>

<%= anchors_index %>


## Features List, :features

Right `Autocompleter` has the following features:

* Works with ajax requests or a local options list
* Supports RESTful design and server side caching friendly urls
* Have responses caching
* Comes in a single tiny file (less than 3k gzipped)
* No css or image dependencies
* Has basic styles out of the box
* Has a basic textual spinner by default
* Has autocompletion fields auto-initialization feature


## Usage Basics, :usage

Basically there's no pubic API, so you just feed the constructor with
a reference to your input element and specify some options

    // <input type="text" id="my-input" />

    // a remote list calling
    new Autocompleter('my-input', {
      url: '/my/things'
    });

    // a local options list
    new Autocompleter('my-input', {
      local: $w('mommy daddy sonny doggy kitty')
    });

Autocompleter expects your server send back usual list of `UL/LI` tags,
with any content inside of the items

    <ul>
      <li>one</li>
      <li>two</li>
      <li>three</li>
    </ul>


## Auto-Initialization Feature, :initialization

As all the other widgets out of the RightJS UI library the autocompleters
have ability to be automatically initialized by using the standard
`data-autocompleter` HTML5 field, like that:

    <input type="text" data-autocompleter="{url:'/your/url'}" />

    <input type="text" data-autocompleter="{local:['mommy','daddy','sonny']}" />

Once you've done that, when the user will starts to interact with the field it
will be automatically initialized with options specified in the attribute.


## Options List, :options

There is a simple list of options for the autocompleters. You might specify any of them as
the constructor options or alter the settings globally by changing the `Autocompleter.Options` object.

Name       | Default           | Description
-----------|-------------------|--------------------------------------------------------
url        | document.location | the url, might have a %{search} placeholder
param      | 'search'          | the requests parameter name
method     | 'get'             | the requests method
minLength  | 1                 | the minimal length when it starts work
threshold  | 200               | the typing pause threshold
cache      | true              | a flag if it should use the results caching
local      | null              | an optional local search results list
fxName     | 'slide'           | visual effects name, use 'null' to disable fx
fxDuration | 'short'           | the visual effect duration
spinner    | 'native'          | spinner element reference
cssRule    | 'input\[data-autocompleter\]'   | the auto-initializable autocompleters css-rule


## Events List, :events

You can use the following event names to work with our autocompleters

Name   | Description
-------|----------------------------------------------------------
show   | when the list of suggestions is shown
hide   | when the list of suggestions is hidden
update | when the list of suggestions was updated
load   | when the xhr request is loaded
select | when some option was selected
done   | when the option was copied to the input element


## Urls Usage, :url

Right autocompleter provides two options to work with the target urls, you might
specify the `'param'` and `'url'` options as the default and usual approach.

    new Autocompleter('my-input', {
      url: '/my/url',
      param: 'search'
    });

    /*
      In this case the autocompleter will hit urls like this.

      /my/url?search=a
      /my/url?search=as
      /my/url?search=asd
      /my/url?search=asdf

    */

You also might want to have more caching friendly urls without any parameters,
in this case you might use the `'%{search}'` placeholder in your url. Like this

    new Autocompleter('my-input', {
      url: '/my/url/%{search}.js'
    });

    /*
      In this case the autocompleter will hit urls like this

      /my/url/a.js
      /my/url/as.js
      /my/url/asd.js
      /my/url/asdf.js

    */

This will allow you to drop the search results in static files on the server side.


## Style Alterations, :styles

If you need to alter some styles, here's how the autocompleter HTML source looks like

    <ul class="rui-autocompleter rui-dd-menu">
      <li>boo</li>
      <li>boo</li>
      <li>boo</li>
    </ul>

    <div class="rui-autocompleter-spinner rui-spinner">
      <div class="glow"></div><div></div>....
    </div>





