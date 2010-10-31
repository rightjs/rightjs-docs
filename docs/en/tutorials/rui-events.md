# RightJS UI Events Handling

This tutorial describes the basics of events handling in RightJS UI

<%= anchors_index %>

## Usage Basics, :basics

Every widget in RightJS UI has some additional custom events that it fires
when certain things happen. You can find the exact list of supported events
in the [UI documentation](/ui), but here we just describe how you can handle
them.

The great thing about RightJS is that it doesn't really differ standard
dom-events and custom events that your application create. This mean
that we have one, unified way of dealing with all sorts of events and
basically, once you know an event's name you can jump into the coding right
away

    new Calendar().onChange(function() {
      console.log(this.value());
    });

    new Calendar().on({
      show: function() {
        console.log("Showing the calendar");
      },
      hide: function() {
        console.log("Hidding the calendar");
      }
    });

You also can specify your listeners with the constructor options

    new Calendar({
      onChange: function() {
        console.log(this.value());
      }
    });

As you can see, it acts as any other events handling, you even can access the
`event` object, which in some cases carry some additional attributes

    new Sortable('my-list', {
      onChange: function(event) {
        console.log(
          "You moved: " + event.item.text() +
          " into the: " + event.index       +
          " position"
        );
      }
    });

It's all the same


## DOM Events, :dom

In reality RightJS UI widgets are just normal elements, and if you need, you
can hook up any standard dom-events as you would do with any other {Element}
instance

    new Calendar()
      .onClick(function(event) {
        // do something about user's click
      })
      .on({
        mouseover: function() {},
        mouseout:  function() {}
      });

The only difference is that you can't attach those events with the
constructor options and have to use the standard {Element#on} methods and
shortcuts.


## Bubbling Events, :bubbling

As RightJS itself doesn't see the difference between normal and custom events,
all the custom events your widgets fire will successfully bubble up and you
can intercept them at any level.


    var div = new Element('div');
    var cal = new Calendar({..});

    cal.insertTo(div);

    div.on('change', function(event) {
      if (event.target instanceof Calendar) {
        console.log("Calendar changed!");
      }
    });

As you see you also can use correct `event.target` typization to distinguish
`Calendar` instances say from the {Input} fields


## UJS With RightJS UI, :ujs

And finally, as all the events that widgets fire bubble up to the `document`
you can use the UJS features with the widgets as well. Just like that

    ".rui-calendar".onChange(function() {
      console.log("Calendar changed!")
    });

Every RightJS UI has its own css-class that look like `rui-[widget name]` so
you can create unobtrusive hooks for them right away!



