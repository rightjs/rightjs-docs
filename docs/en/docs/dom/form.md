# Form

RightJS inherits forms from the common {Element} unit, which means you can do
everything you can do with any other element plus several additional features
which make the work with forms a lot easier

## Ajax handling

To submit your form via an {Xhr} request just call the {#send} method.

    $('some-form').send();

This will handle everything automatically, grab the request method, URL,
options and so on. If your form contains files to upload, it will be
nicely handled by an iframed request in just the same way. You don't need
to worry about anything.

You can also mark the form as a remote one. When it gets submitted the
form will go via a {Xhr} request automatically.

    $('some-form').remotize();

You can specify any standard {Xhr} options as well.

    $('some-form').send({
      onSuccess: function(r) {
        $('notices').update(r.responseText);
      }
    });

If your form has an element with the CSS class `spinner`, it will be
automatically used as a spinner for your form submission. You don't need to
define it explicitly.


### .include

    include(Object methods[, boolean dont_rewrite])

Registers additional methods for the `Form` elements.

    Form.include({
      myMethod: function() {....}
    });

    $('my_form').myMethod();



### #initialize

    initialize([Object options])

Basic constructor which receives all the common {Element} unit options plus a
boolean one named `remote` which tells whether you want the form to be
submitted via a {Xhr} request by default.

    var form = new Form({
      method: 'post',
      action: 'some/action'
    });


### #elements

    elements() -> Array of elements

Returns the form elements list in an array.

    var form_elements = $('form').elements();


### #getElements

    getElements() -> Array of elements

__DEPRECATED__: please, use {#elements} instead


### #inputs

    inputs() -> Array of elements

Returns a list of all the form input elements _except_ the buttons.

    $('form').inputs();


### #focus

    focus() -> Form self

Tries to put the focus on the first visible and not disabled input element
of the form.

    $('form').focus();


### #blur

    blur() -> Form self

Looses focus on every element of the form.

    $('form').blur();


### #disable

    disable() -> Form self

Disables every visible element of the form.

    $('form').disable();


### #enable

    enable() -> Form self

Enables all disabled elements of the form.

    $('form').enable();


### #values

    values() -> Object

Returns a name->value hash of all form values.

    $('form').values();


### #serialize

    serialize() -> String

Collects all the values of the form and serializes them into a single
URL query string.

    $('form').serialize();


### #send

    send([Object options]) -> Form self

Remotely submits the form via a {Xhr} request. The argument may contain
any standard {Xhr} object options.

__NOTE__: Works with file uploads too!


    $('form').send();

    $('form').send({
      spinner:    $('spinner'),
      onComplete: call_the_function
    });


### #remotize

    remotize([Object options]) -> Form self

Marks the form to be automatically send via a {Xhr} request when submitted.
Optionally presets any standard {Xhr} object options.

    $('form').remotize({spinner: $('some-image')});

    $('form').submit();  // the form goes remotely


### #unremotize

    unremotize() -> Form self

Undoes the {#remotize} method changes.

    $('form').remotize();
    $('form').unremotize();

    $('form').submit(); // the form goes via usual HTTP request


### #input

    input(String name) -> Input with that name

Returns a wrapped input field by it's name attribute

    $('form').input('username');
    $('form').input('password');

### #submit

    submit() -> Form self

Just a tunnel for the native `submit` method

    $('form').submit();

### #reset

    reset() -> Form self

A tunnel for the native `reset` method

    $('form').reset();
