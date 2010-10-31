# RightJS UI Styles Alteration Tutorial

This beginners level tutorial describes the basics of the stylesheets
organization in RightJS UI.

<%= anchors_index %>


## Inlined Styles, :inline

RightJS UI has one tricky part, we inline all the css right into the
javascript files. If you open up any widget's script and scroll it down, at
the very bottom of it you'll see the `document.write` section that carries the
widget's styles.

There are several good reasons why we do that. First of all is simplicity in
use and distribution. Most of our widgets come in a single JS file, you just
put it on your page and you're ready to rock, no need to worry about hooking
up anything else.

The other reason is that this way we reduce the number of hits your server
takes. Instead of asking it for scripts and styles separately, we download it
all in one request.

Thirdly, it provides better gzip compression, because stylesheets and
javascript usually share lots of common things like class names, keywords and
so one.


## Inlined Styles Gotcha, :gotcha

As cool as it is, inlined styles come with  a small gotcha that you should
keep in mind.

Because the styles are inlined into the javascript file, they will be put on
the page right where the javascript file included. This means that if you need
to customize some styles, you should include your stylesheets _after_ the
rightjs ui files.

    <script src="right-calendar.js"></script>
    <style>
      .rui-calendar {
        background: green;
      }
    </stlye>

Otherwise your changes won't have any effect, coz will be overwritten by
styles from the javascript file.


## Classes System, :classes

RightJS UI has a simple and strict class-names system. Every widget in the
collection always has a class name that look like that `rui-[widget-name]`.

    .rui-calendar {
      font-size: 80%;
      background: yellow;
    }

    .rui-autocompleter {
      font-family: Arial;
      background: pink;
    }

This way you can always customize some basic things without going into the
details


## Elements System, :elements

In RightJS UI widgets are not standalone independent units, they are composed
of various building blocks, like panels, buttons, spinners, etc. All those
small elements have global classes and styles, which can be adjusted in one
place and work for the entire system

    .rui-button {
      background: yellow;
      font-weight: bold;
    }

    .rui-panel {
      background: pink;
    }

    .rui-spinner {
      border: none;
      width: 20px;
      height: 20px
      background: url('spinner.gif');
    }

For complete list of blocks you need to check the source code in the
[github repository](http://github.com/rightjs/rightjs-ui/tree/master/lib/css/)


## Unit Customization, :customization

If you need more detailed customization of any of the widgets there are couple
of places where you can start.

First of all you should look into the [ui-documentation](/ui). Find a widget
you're trying to customize and scroll it's page down to the very bottom. There
you will see the widget's HTML structure. For example
[dialog widget](/ui/dialog#styles)

Secondly, you also can check the real styles on the
[github repository](http://github.com/rightjs/rightjs-ui/tree/master/src/).
Every folder has a single css file that contains the basic stylesheet for a
corresponding widget.

Those two sources will give you a complete overview of the existing styles
used by default with every widget and you will be able to adjust them just
as you like.


## IE6 And Pals, :ie6

Some widgets from RightJS UI don't look correctly in the IE6 browser out
of the box. This is not exactly a technical issue, but more like a political
decision.

All the issues can be fixed by adding additional css-classes here and there,
and throwing in a bunch of IE6 hacks in the stylesheets. The problem is that
this will make the widgets system more complicated and the source code bigger.

Yes, there are still countries and companies where share of IE6 users is still
significant, but it is not the reason why the rest of the world should suffer.

So, RightJS UI does not provide full IE6 support, instead it gives you the
choice, either you install a normal browser or you pay your developers to make
it work on what you have.

Consider this as our input into the getting rid of IE6 movement.

