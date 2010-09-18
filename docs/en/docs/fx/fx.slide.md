# Fx.Slide

Fx.Slide is a basic visual effect to work with sliding elements. It is a
bidirectional effect and thus can work both ways in and out. It also supports
a toggle mode which automatically decides the direction depending on the
current style of the element.

## Directions

By default this effect will slide the element in from or out to the top edge of
the element. But the effect can run in any direction specified by the `'direction'`
key along with the constructor options. Alternatively you can define the default
value for all slides by assigning the `Fx.Slide.Options.direction` variable one of
the following values:

* 'top' (default)
* 'left'
* 'right'
* 'bottom'

### #start

    start([String how]) -> Fx.Slide self

Starts the effect. May take an argument like `in`, `out` or `toggle`.

    new Fx.Slide(element).start();

    new Fx.Slide(element).start('in');
    new Fx.Slide(element).start('out');
