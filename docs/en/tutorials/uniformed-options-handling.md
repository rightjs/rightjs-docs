# Uniformed Options Handling

RightJS has its own conventional way to process options in all the configurable units like {Xhr}, {Fx}, {Cookie} and
all the modules out of the the [Plugins](/plugins) and [UI](/ui) libraries.

For this purpose there is a simple shared module called {Options}. All the RightJS units use it and so can you.

## Convention, :convention

The {Options} module might be used in several different ways, but in order to organize the things in a single
uniformed way, we use the following convention.

Every configurable class has a class-level property called `Options`, which is a simple hash that contains
the default options for the class instances. That what it will have if you won't specify any options at all.

For example the {Xhr} class has the `Options` property that looks like that

    Xhr.Options = {
      method:   'post',
      encoding: 'utf-8',
      ....
    }

When you create an instance of a configurable class, the options you send into its constructor, will be _merged_
with the default ones, and then the instance will have a property called `options` (downcased), which will
contain the actual merged options of your object.

    // with default options
    var xhr = new Xhr();
    xhr.options.method   // -> 'post'
    xhr.options.encoding // -> 'utf-8'

    // with custom options
    var xhr = new Xhr({method: 'get'});
    xhr.options.method   // -> 'get'
    xhr.options.encoding // -> 'utf-8'


## Alterations, :alterations

Having such a conventional way, gives you a good flexibility over your application configuration.

When you see a list of supported options for a class, say like [Calendar widget options](/ui/calendar#options)
You can feed each constructor with any of those options like that

    var calendar = new Calendar({
      format:  'US',
      firstDay: 0
    });

    calendar.options.format   // -> 'US'
    calendar.options.firstDay // -> 0

Or you can alter the `Calendar.Options` object and change behavior of all the class instances in a single place like that

    $ext(Calendar.Options, {
      format:  'US',
      firstDay: 0
    });

    // after that
    var calendar = new Calendar();
    calendar.options.format   // -> 'US'
    calendar.options.firstDay // -> 0

Those principles work all over the framework with all the configurable classes.


## RigthJS UI Library Options, :ui

Most of the [RightJS UI](/ui) library units can be initialized without
actually writing any JavaScript code, for this reason they use special
HTML5 attributes named like `data-[unit-name]` where you can specify your
options in JSON format, like that:

    // a calendar field
    <input type="text" data-calendar="{format:'US'}" />

    // autocompleter
    <input type="text" data-autocompleter="{url:'/my/url'}">

    // or a lightbox link
    <a data-lightbox="{blockContent: true}">
      <img src="/.../..." />
    </a>

When the user starts to interact with those elements, the scripts catch them
up, extract the options and initialize everything automatically.

This principle works with all auto-initializable units out of the [UI](/ui)
and [Plugins](/plugins) libraries
