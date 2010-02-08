# Fx.Morph

Fx.Morph is a basic DOM element morphing visual effect. It can morph
an element from its current state to any end style.

You can specify several keys in your end style, all of which will be processed
simultaneously in order to achieve an outstanding user experience.

__NOTE__: There is no need to preset the element styles manually before running
the effect. In most cases RightJS is smart enough to figure out the initial styles.

### #start

    start(Object end_style)   -> Fx.Morph self

Starts the effect towards the given end style.

    new Fx.Morph('element-id').start({
      background: 'yellow',
      fontSize:   '20px'
    });
