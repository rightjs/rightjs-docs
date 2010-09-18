# Options

`Options` is a shared module, which can be used with classes that need
support for option attributes.

Generally, it provides the `setOptions` method which merges any default
options with the given ones and assigns the result to the `options`
property of the instance.

    var Steake = new Class({
      include: Options,

      Options: {
        cooked: 'well done',
        sauce:  'pepper',
        wedges: 'salad',
        garner: 'cheeps'
      }

      initialize: function(options) {
        this.setOptions(options);
      }
    });

    // without options it will has all the defaults
    var stake = new Stake();
    stake.options == Stake.Options;

    // with some options it will merge them with the defaults
    var stake = new Stake({
      cooked: 'rare',
      sauce:  'chilly'
    });

    stake.options == {
      cooked: 'rare',
      sauce:  'chilly',
      wedges: 'salad',
      garner: 'cheeps'
    };

## Default Options

Default options may be an instance attribute, a class level attribute or an
attribute of any ancestor class. The module looks through all of them from
the instance up to the top ancestor class and uses the first one found.

    var Klass = new Class({
      include: Options,

      Options: {....}
    });

    // or
    var Klass = new Class({
      include: Options,
      extend: {
        Options: {....}
      }
    });

    // or
    var Klass1 = new Class({
      include: Options,

      extend: {
        Options: {....}
      }
    });

    var Klass2 = new Class(Klass1, {
      initialize: function(options) {
        this.setOptions(options);
      }
    });

The default options object may be named either `'OPTIONS'` (like a
constant) or `'Options'` (like an object):

    var Klass = new Class({
      include: Options,

      OPTIONS: {.....},

      // or
      Options: {.....}
    });

### #setOptions

    setOptions(Object options) -> Object self instance

Assigns the given options to the instance.

    var object = new ClassWithOptions();

    object.setOptions({a: 1});

    object.options == {a: 1};


### #cutOptions

    cutOptions(arguments) -> Array of arguments without options

Cuts off a trailing options hash from the list of arguments, sets the
options up using the {#setOptions} method and then returns a new list
without the trailing options hash.

    var Klass = new Class({
      include: Options,

      /**
       * This constructor can take various numbers of arguments
       * with an options hash as the last argument.
       */
      initialize: function() {
        var args = this.cutOptions(arguments);
      }
    });

    var o = new Klass(1, {opts:1});
    var o = new Klass(1, 2, {opts:1});
    var o = new Klass(1, 2, 3, {opts:1});

