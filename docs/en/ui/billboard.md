# Billboard

Billboard is a simple widget that allows you to show/rotate a collection of
pictures or any sort of HTML content

<%= partial '/ui/head', :locals => {:name => 'billboard'} %>

<%= anchors_index %>

## Usage Basics, :usage

This is a very simple widget and it has very simple usage, just include the
javascript file on your page and create an `UL` element with class
`rui-billboard`

    <ul class="rui-billboard">
      <li><img src="images/1.jpg" /></li>
      <li><img src="images/2.jpg" /></li>
      <li><img src="images/3.jpt" /></li>
    </ul>

The script will do the rest automatically.

And you certainly can create your billboards programmatically

    new Billboard({autostart: false})
      .append(
        '<li>Bla bla bla, mr.freeman</li>',
        '<li>Bla bla bla, mr.freeman</li>',
        '<li>Bla bla bla, mr.freeman</li>'
      )
      .insertTo(document.body)
      .start();

__NOTE__: all your images or `LI` items should have the same size!


## Options List, :options

There is a number of options that you can use with our billboards

Name        | Default   | Description
------------|-----------|--------------------------------------------------
fxName      | 'stripe'  | visual effect name
fxDuration  | 'long'    | visual effect duration
autostart   | true      | if it should automatically start rotate things
delay       | 4000      | delay between item shows
loop        | true      | loop after reaching the last item
showButtons | true      | should it show the next/prev buttons or not
prevButton  | 'native'  | prev item button, 'native' or an ID of your own
nextButton  | 'native'  | next item button, 'native' or an ID of your own
stripes     | 10,       | the number of stripes for the 'stripe' effect
cssRule     | '\*.rui-billboard' | css-rule for auto-initialization

The visual effect option can be one of the following

* `'stripe'` - classical billboard like stripe-effects
* `'slide'`  - slide the content left/right
* `'fade'`   - simply fades things from one to another
* `null`     - if you don't want no fx


## Events List, :events

Following events are available to be used with billboards

Name   | Description
-------|--------------------------------------------------------------------
change | when another item was shown
first  | when the first item on the list was shown
last   | when the last item on the list was shown


## API Reference, :api

Class `Billboard` is inherited from the {Element} unit and basically
represents an `UL` element, but there are also several additional methods

Name        | Description
------------|--------------------------------------
start()     | starts the slideshow
stop()      | stops the slideshow
items()     | returns the list of items on the list
showNext()  | shows the next available item
showPrev()  | shows the previous available item
current(\[index\]) | bidirectional method, returns the current `LI` element or sets one by an index or a `LI` Element object


## Style Alterations, :style

There is nothing special, it's just a `UL`/`LI` element with couple of buttons
on it

    <ul class="rui-billboard">
      <li><img src="images/1.jpg" /></li>
      <li><img src="images/2.jpg" /></li>
      ...
      <div class="rui-billboard-button-prev">&lsaquo;</div>
      <div class="rui-billboard-button-next">&rsaquo;</div>
    </ul>

# Billboard

Billboard is a simple widget that allows you to show/rotate a collection of
pictures or any sort of HTML content

<%= partial '/ui/head', :locals => {:name => 'billboard'} %>

<%= anchors_index %>

## Usage Basics, :usage

This is a very simple widget and it has very simple usage, just include the
javascript file on your page and create an `UL` element with class
`rui-billboard`

    <ul class="rui-billboard">
      <li><img src="images/1.jpg" /></li>
      <li><img src="images/2.jpg" /></li>
      <li><img src="images/3.jpt" /></li>
    </ul>

The script will do the rest automatically.

And you certainly can create your billboards programmatically

    new Billboard({autostart: false})
      .append(
        '<li>Bla bla bla, mr.freeman</li>',
        '<li>Bla bla bla, mr.freeman</li>',
        '<li>Bla bla bla, mr.freeman</li>'
      )
      .insertTo(document.body)
      .start();

__NOTE__: all your images or `LI` items should have the same size!


## Options List, :options

There is a number of options that you can use with our billboards

Name        | Default   | Description
------------|-----------|--------------------------------------------------
fxName      | 'stripe'  | visual effect name
fxDuration  | 'long'    | visual effect duration
autostart   | true      | if it should automatically start rotate things
delay       | 4000      | delay between item shows
loop        | true      | loop after reaching the last item
showButtons | true      | should it show the next/prev buttons or not
prevButton  | 'native'  | prev item button, 'native' or an ID of your own
nextButton  | 'native'  | next item button, 'native' or an ID of your own
stripes     | 10,       | the number of stripes for the 'stripe' effect
cssRule     | '\*.rui-billboard' | css-rule for auto-initialization

The visual effect option can be one of the following

* `'stripe'` - classical billboard like stripe-effects
* `'slide'`  - slide the content left/right
* `'fade'`   - simply fades things from one to another
* `null`     - if you don't want no fx


## Events List, :events

Following events are available to be used with billboards

Name   | Description
-------|--------------------------------------------------------------------
change | when another item was shown
first  | when the first item on the list was shown
last   | when the last item on the list was shown


## API Reference, :api

Class `Billboard` is inherited from the {Element} unit and basically
represents an `UL` element, but there are also several additional methods

Name        | Description
------------|--------------------------------------
start()     | starts the slideshow
stop()      | stops the slideshow
items()     | returns the list of items on the list
showNext()  | shows the next available item
showPrev()  | shows the previous available item
current(\[index\]) | bidirectional method, returns the current `LI` element or sets one by an index or a `LI` Element object


## Style Alterations, :style

There is nothing special, it's just a `UL`/`LI` element with couple of buttons
on it

    <ul class="rui-billboard">
      <li><img src="images/1.jpg" /></li>
      <li><img src="images/2.jpg" /></li>
      ...
      <div class="rui-billboard-button-prev">&lsaquo;</div>
      <div class="rui-billboard-button-next">&rsaquo;</div>
    </ul>

# Billboard

Billboard is a simple widget that allows you to show/rotate a collection of
pictures or any sort of HTML content

<%= partial '/ui/head', :locals => {:name => 'billboard'} %>

<%= anchors_index %>

## Usage Basics, :usage

This is a very simple widget and it has very simple usage, just include the
javascript file on your page and create an `UL` element with class
`rui-billboard`

    <ul class="rui-billboard">
      <li><img src="images/1.jpg" /></li>
      <li><img src="images/2.jpg" /></li>
      <li><img src="images/3.jpt" /></li>
    </ul>

The script will do the rest automatically.

And you certainly can create your billboards programmatically

    new Billboard({autostart: false})
      .append(
        '<li>Bla bla bla, mr.freeman</li>',
        '<li>Bla bla bla, mr.freeman</li>',
        '<li>Bla bla bla, mr.freeman</li>'
      )
      .insertTo(document.body)
      .start();

__NOTE__: all your images or `LI` items should have the same size!


## Options List, :options

There is a number of options that you can use with our billboards

Name        | Default   | Description
------------|-----------|--------------------------------------------------
fxName      | 'stripe'  | visual effect name
fxDuration  | 'long'    | visual effect duration
autostart   | true      | if it should automatically start rotate things
delay       | 4000      | delay between item shows
loop        | true      | loop after reaching the last item
showButtons | true      | should it show the next/prev buttons or not
prevButton  | 'native'  | prev item button, 'native' or an ID of your own
nextButton  | 'native'  | next item button, 'native' or an ID of your own
stripes     | 10,       | the number of stripes for the 'stripe' effect
cssRule     | '\*.rui-billboard' | css-rule for auto-initialization

The visual effect option can be one of the following

* `'stripe'` - classical billboard like stripe-effects
* `'slide'`  - slide the content left/right
* `'fade'`   - simply fades things from one to another
* `null`     - if you don't want no fx


## Events List, :events

Following events are available to be used with billboards

Name   | Description
-------|--------------------------------------------------------------------
change | when another item was shown
first  | when the first item on the list was shown
last   | when the last item on the list was shown


## API Reference, :api

Class `Billboard` is inherited from the {Element} unit and basically
represents an `UL` element, but there are also several additional methods

Name        | Description
------------|--------------------------------------
start()     | starts the slideshow
stop()      | stops the slideshow
items()     | returns the list of items on the list
showNext()  | shows the next available item
showPrev()  | shows the previous available item
current(\[index\]) | bidirectional method, returns the current `LI` element or sets one by an index or a `LI` Element object


## Style Alterations, :style

There is nothing special, it's just a `UL`/`LI` element with couple of buttons
on it

    <ul class="rui-billboard">
      <li><img src="images/1.jpg" /></li>
      <li><img src="images/2.jpg" /></li>
      ...
      <div class="rui-billboard-button-prev">&lsaquo;</div>
      <div class="rui-billboard-button-next">&rsaquo;</div>
    </ul>

