# What's New In RightJS UI 2

As you might already know, RightJS 2 release has some significant changes of
the system design and therefore comes as a complete restart of the framework.

RightJS UI 2 is one of the parts of the reboot and here are some notes on
what's new and interesting.


## Widgets == Elements, :elements

One of the biggest change in RightJS 2 is that now it uses dom-wrappers
instead of direct dom-elements access. And one of the most interesting part
of it is that dom-wrappers in RightJS essentially are classes and you are
allowed to create as much of your own types as you pleased.

Because of that, all the widgets in RightJS UI 2 are private wrappers and
therefore eventually inherited from the {Element} unit. This means that now
you can treat any widget as a normal element of the page

    var calendar = new Calendar();

    calendar
      .insertTo('my-element', 'top')
      .set('id', 'my-calendar')
      .addClass('my-calendar')
      .onClick('toggleClass', 'clicked')
      // .....

More of that you can correctly work with the type of the object

    calendar instanceof Calendar; // true
    calendar instanceof Element;  // true
    calendar instanceof Window;   // false

RightJS will also register your object in the system and use it whenever the
user accesses it via any standard method

    $('my-calendar');        // -> calendar
    $$('.my-calendar')[0];   // -> calendar
    $('my-element').first(); // -> calendar

You can do with any widget whatever you want.


## New Events Handling, :events

As all widgets are elements now and all the events bubble up by the tree of
document, the events handling in widgets was slightly changed to be consistent
with any other dom-element.

Firstly, it means that all the callbacks you attach to any widget will be
called in the context of the widget itself, like you normally do with elements

    var slider = new Slider();

    slider.onChange(function() {
      this.getValue(); // returns the current value
    });

Secondly, instead of having all sorts of attributes that we were passing into
the listeners, now all the related data will be attached to the event object,
for example:

    var slider = new Slider();

    slider.onChange(function(event) {
      event.target; // -> refers back to the slider
      event.value;  // -> gives you the value
    });

Thirdly all the widgets will have their own css class names and as the events
propagate through the tree, you'll be able to use normal UJS features with
the widgets

    "rui-slider".onChange(function() {
      // .....
    });

Basically anything that available with elements will be available with widgets
as well.


## Uniformed Initialization, :initialization

In RightJS UI 1 we had all sorts of things how you could automatically
initialize the widgets. Some of them were initialized by non-standard `rel`
attributes, some by special css classes, some by custom HTML5 attributes.

In RightJS UI 2 the mess was cleaned up and now all the widgets initialize the
same way using HTML5 custom attributes that looks like `data-widget-name`. For
example:

    <input type="text" data-calendar="{format: 'US'}" />
    <input type="text" data-autocompleter="{url:'/boo'}" />

You can keep the attributes empty, or with the `'{}'` value, works either way.

The only exception is the [Lightbox](/ui/lightbox) widget, since many folks
got used to the `rel="lightbox"` attribute you can use it as well as the
`data-lightbox` HTML5 attribute.


## Styles Cleaning Up, :styles

RightJS UI 1 was quite a spontaneously growing project, and as the result the
styles of the widgets were quite messy and pretty much independent. In
RightJS 2 we fix the situation.

All the styles were brushed up to make them compacter and easier to change.
All the RightJS UI css class-names now have the standard `rui-` prefix
instead of the `right-` one (which potentially could cause troubles). And then
all the widgets now have consistent class names like `rui-widget-name`

And what's more important, now we have cross-widget classes like `rui-panel`,
`rui-button`, `rui-spinner`, etc. We will use those later on to create visual
themes for our widgets, with a skins constructor and so one.

It should be fun.


## Small Fixes, :fixes

There also were quite a few small fixes here and there, some widgets had fixes
in their HTML structure, some have the CSS classes changed, some have new
options and there were some fixes in the i18n modules as well.

So if you use any of the widgets in more than "as is" way, please check their
pages in the [RightJS UI](/ui) section.

