# Attribute Effects

Fx.Attr - is a basic attributes processing class, it can be used
to process things like scrolls and size of some elements.


### #start

    start(Object attrs) -> Fx.Attr self

Starts the attributes processing towards the given value

    new Fx.Attr('element').start({
      width:  100,
      height: 200
    });