# Additional Visual Effects

This module provides a collection of additional visual effects for RightJS.

You can see all of them in action at the main [visual effects demo](/fx-demo) page.

<%= anchors_index %>

## Fx.CSS, :CSS

`Fx.CSS` is an equivalent of the {Fx.Morph} effect, but instead of using styles it
builds on CSS classes. This might be useful if you don't want to keep any styles inside
your code and organize all of them on the CSS level. It also allows you to gradually remove
any CSS class from the list

The `start()` method receives two arguments: Firstly the class to add and secondly
the class to remove. Furthermore, there is the `morphToClass()` method which is the 
element level shortcut for this effect

    new Fx.CSS('my-element').start('new-class');           // adds the class
    new Fx.CSS('my-element').start(null, 'remove-class');  // removes the class

    // On element level
    $('my-element').morphToClass('new-class');
    $('my-element').morphToClass(null, 'remove-class');

    // With options
    $('my-element').morphToClass('something', {
      duration: 'long',
      onFinish: function() {...}
    });

__NOTE:__ This visual effect processes the element `style` attribute, thus once
you have morphed it to some class you won't be able to remove the class anymore,
because all the styles will be embedded on the `style` level which have priority
over the CSS level definitions.



## Fx.Move, :Move

This effect allows you to move elements around on the page.

You can use an additional `position` option to specify which coordinates to use,
either `absolute` (default) or `relative`.

The `start()` method receives the element position as a hash like `{x: NN, y: NN}`
or `{left: 'NNpx', top: 'NNpx'}`. You may also specify just one attribute, either
horizontal or vertical.

The `move()` method is the element level shortcut for this effect.

    new Fx.Move('my-element').start({x: 100, y: 200});
    new Fx.Move('my-element', {position: 'relative'}).start({x: -200});

    // On element level
    $('element').move({x: 200, y: 200}); // absolute position
    $('element').move({x: -200}, {position: 'relative'}); // moves it 200px left


## Fx.Run, :Run

This effect makes the element appear and disappear by moving it behind (or from behind) the left
or top edge of the window. It's a bidirectional effect, you can specify the effect direction with
`'in'` or `'out'`. Or use it in the `'toggle'` mode (default).

An additional option called `direction` defines in which direction the element should run. It
can be either `'left'` (default) or `'top'`.

The `run()` method is the element level shortcut for this effect.

    new Fx.Run('element').start();
    new Fx.Run('element').start('in');
    new Fx.Run('element').start('out');

    $('element').run();
    $('element').run('in');
    $('element').run('out');

    $('element').run({direction: 'top'});
    $('element').run('out', {direction: 'top', onFinish: do_that});


## Fx.Bounce, :Bounce

This effect is supposed to attract the user's attention by letting an element jump.

There are two additional options to customize this effect. The `direction` argument 
defines in which direction the element should bounce and can be any of the following:

* `'top'` (default)
* `'left'`
* `'right'`
* `'bottom'`

The second argument `value` sets the number of pixels the element should move, by 
default `16` pixels.

The `bounce()` method is the element level shortcut for this effect.

    new Fx.Bounce('element').start();

    $('element').bounce();
    $('element').bounce({value: 40});
    $('element').bounce({direction: 'left'});



## Fx.Puff, :Puff

This bidirectional effect shows/hides an element by zooming and fading at the same
time.

The additional `size` option lets you control how big the element should grow before 
it disappears. The default value is `1.4` times as big.

The `puff()` method is the element level shortcut for this effect.

    new Fx.Puff('element').start();

    $('element').puff();     // the toggle mode by default
    $('element').puff('in');
    $('element').puff('out');

    $('element').puff({size: 2});


## Fx.Zoom, :Zoom

This visual effect lets you gradually increase/decrease the size of an element. It 
simultaneously processes all available attributes such as height, width, font-size, 
border-size or margins and keeps the proportions of the element intact.

The additional `from` option allows you to define which direction the element should 
grow towards. It can be any of the following:

* `'top'`
* `'left'`
* `'right'`
* `'bottom'`
* `'center'` (default)

Furthermore, you can use any appropriate combination of the above for each of the for
corners such as `'left top'` or `'bottom-right'`.

The `start()` method can receive the following arguments as the final proportion:

* a `float` value between `0` and `1`, where `1` is an equivalent of 100%
* a `string` like `'120%'` to define the value in percents
* a hash like `{width: 'NNpx'}` or `{height: 'NNpx'}`

The `zoom()` method is the element level shortcut for the effect.

    new Fx.Zoom('element').start(1.2); // zoom at 20%
    new Fx.Zoom('element').start(0.8); // minify at 20%

    $('element').zoom(2, {from: 'left'});
    $('element').zoom('150%', {from: 'top left'});
    $('element').zoom({width: '200px'});  // zooms to the size of 200px

__NOTE__: If you use this effect many times on the same element in both directions, you
should round pixels and proportions in order to avoid systematic round-off errors.