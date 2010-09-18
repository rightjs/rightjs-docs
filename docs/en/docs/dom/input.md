# Input

{Input} is a basic dom-wrapper for all the input elements, like text fields,
selects, textareas, etc. It inherited from the {Element} class and has partly
shared interface.

## Events

Unlike other DOM elements, form elements handle a bunch of additional events:

* disable
* enable
* focus
* blur
* change

They are handled simultaneously with all the other events. All shortcuts
are in place, you can wire and run the events the usual way.


### .include

    include(Object methods[, boolean dont_rewrite])

Registers additional methods for the form input element units, like INPUT,
SELECT, TEXTAREA.

    Input.include({
      myMethod: function() {....}
    });

    $('my_input').myMethod();


### #initialize

    initialize(raw_dom_element) -> Input
    initialize(Object options)  -> Input

Basic constructor. It might take a raw dom input element or all the standard
{Element} options, plus an uniformed option of `type`, which can be one of the
standard `INPUT` tag types or one of the following

* `textarea`
* `select`
* `multi-select`

`text` - is the default value

    new Input();                  // -> input#text
    new Input({type: 'radio'})    // -> input#radio
    new Input({type: 'textarea'}) // -> textarea
    new Input({type: 'select'})   // -> selectbox


### #form

    form() -> Form

Returns a wrapped form object to which this input field belongs to

    $(input).form().submit();


### #getValue

    getValue() -> mixed value

Unified access to get a form element value.

    $('input').getValue();
    $('select').getValue();
    $('textarea').getValue();
    $('multi-select').getValue();


### #setValue

    setValue(mixed value) -> Element self

Unified value setter for the form elements.

    $('input').setValue('text');
    $('select').setValue(1);
    $('textarea').setValue('text');
    $('multi-select').setValue([1,2,3]);

### #value

    value()      -> mixed the current value
    value(value) -> Input self

A bidirectional method to work with {Input} field values

    $(input).value('something');
    $(input).value(); // -> 'something'


### #disable

    disable() -> Element self

Disables the element.

    $('element').disable();


### #enable

    enable() -> Element self

Enables the element.

    $('input').enable();


### #focus

    focus() -> Element self

Puts the focus on the element.

    $('input').focus();


### #select

    select() -> Element self

Puts the focus on the element and selects its data.

    $('input').select();


### #blur

    blur() -> Element self

Looses the focus on the element.

    $('input').blur();


### #disabled

    disabled() -> boolean
    disabled(value) -> Input self

A bidirectional method to work with the `disabled` property

    $(input).disabled(true);
    $(input).disabled(); // -> true
    $(input).disabled(false);
    $(input).disabled(); // -> false


### #checked

    checked() -> boolean
    checked(value) -> Input self

A bidirectional method to work with the `checked` property

    $(input).checked(true);
    $(input).checked(); // -> true
    $(input).checked(false);
    $(input).checked(); // -> false

# Input

{Input} is a basic dom-wrapper for all the input elements, like text fields,
selects, textareas, etc. It inherited from the {Element} class and has partly
shared interface.

## Events

Unlike other DOM elements, form elements handle a bunch of additional events:

* disable
* enable
* focus
* blur
* change

They are handled simultaneously with all the other events. All shortcuts
are in place, you can wire and run the events the usual way.


### .include

    include(Object methods[, boolean dont_rewrite])

Registers additional methods for the form input element units, like INPUT,
SELECT, TEXTAREA.

    Input.include({
      myMethod: function() {....}
    });

    $('my_input').myMethod();


### #initialize

    initialize(raw_dom_element) -> Input
    initialize(Object options)  -> Input

Basic constructor. It might take a raw dom input element or all the standard
{Element} options, plus an uniformed option of `type`, which can be one of the
standard `INPUT` tag types (`text` by default) or one of the following

  * `textarea`
  * `select`
  * `multi-select`

### #form

    form() -> Form

Returns a wrapped form object to which this input field belongs to

    $(input).form().submit();


### #getValue

    getValue() -> mixed value

Unified access to get a form element value.

    $('input').getValue();
    $('select').getValue();
    $('textarea').getValue();
    $('multi-select').getValue();


### #setValue

    setValue(mixed value) -> Element self

Unified value setter for the form elements.

    $('input').setValue('text');
    $('select').setValue(1);
    $('textarea').setValue('text');
    $('multi-select').setValue([1,2,3]);

### #value

    value()      -> mixed the current value
    value(value) -> Input self

A bidirectional method to work with {Input} field values

    $(input).value('something');
    $(input).value(); // -> 'something'


### #disable

    disable() -> Element self

Disables the element.

    $('element').disable();


### #enable

    enable() -> Element self

Enables the element.

    $('input').enable();


### #focus

    focus() -> Element self

Puts the focus on the element.

    $('input').focus();


### #select

    select() -> Element self

Puts the focus on the element and selects its data.

    $('input').select();


### #blur

    blur() -> Element self

Looses the focus on the element.

    $('input').blur();


### #disabled

    disabled() -> boolean
    disabled(value) -> Input self

A bidirectional method to work with the `disabled` property

    $(input).disabled(true);
    $(input).disabled(); // -> true
    $(input).disabled(false);
    $(input).disabled(); // -> false


### #checked

    checked() -> boolean
    checked(value) -> Input self

A bidirectional method to work with the `checked` property

    $(input).checked(true);
    $(input).checked(); // -> true
    $(input).checked(false);
    $(input).checked(); // -> false

# Input

{Input} is a basic dom-wrapper for all the input elements, like text fields,
selects, textareas, etc. It inherited from the {Element} class and has partly
shared interface.

## Events

Unlike other DOM elements, form elements handle a bunch of additional events:

* disable
* enable
* focus
* blur
* change

They are handled simultaneously with all the other events. All shortcuts
are in place, you can wire and run the events the usual way.


### .include

    include(Object methods[, boolean dont_rewrite])

Registers additional methods for the form input element units, like INPUT,
SELECT, TEXTAREA.

    Input.include({
      myMethod: function() {....}
    });

    $('my_input').myMethod();


### #initialize

    initialize(raw_dom_element) -> Input
    initialize(Object options)  -> Input

Basic constructor. It might take a raw dom input element or all the standard
{Element} options, plus an uniformed option of `type`, which can be one of the
standard `INPUT` tag types (`text` by default) or one of the following

  * `textarea`
  * `select`
  * `multi-select`

### #form

    form() -> Form

Returns a wrapped form object to which this input field belongs to

    $(input).form().submit();


### #getValue

    getValue() -> mixed value

Unified access to get a form element value.

    $('input').getValue();
    $('select').getValue();
    $('textarea').getValue();
    $('multi-select').getValue();


### #setValue

    setValue(mixed value) -> Element self

Unified value setter for the form elements.

    $('input').setValue('text');
    $('select').setValue(1);
    $('textarea').setValue('text');
    $('multi-select').setValue([1,2,3]);

### #value

    value()      -> mixed the current value
    value(value) -> Input self

A bidirectional method to work with {Input} field values

    $(input).value('something');
    $(input).value(); // -> 'something'


### #disable

    disable() -> Element self

Disables the element.

    $('element').disable();


### #enable

    enable() -> Element self

Enables the element.

    $('input').enable();


### #focus

    focus() -> Element self

Puts the focus on the element.

    $('input').focus();


### #select

    select() -> Element self

Puts the focus on the element and selects its data.

    $('input').select();


### #blur

    blur() -> Element self

Looses the focus on the element.

    $('input').blur();


### #disabled

    disabled() -> boolean
    disabled(value) -> Input self

A bidirectional method to work with the `disabled` property

    $(input).disabled(true);
    $(input).disabled(); // -> true
    $(input).disabled(false);
    $(input).disabled(); // -> false


### #checked

    checked() -> boolean
    checked(value) -> Input self

A bidirectional method to work with the `checked` property

    $(input).checked(true);
    $(input).checked(); // -> true
    $(input).checked(false);
    $(input).checked(); // -> false

# Input

{Input} is a basic dom-wrapper for all the input elements, like text fields,
selects, textareas, etc. It inherited from the {Element} class and has partly
shared interface.

## Events

Unlike other DOM elements, form elements handle a bunch of additional events:

* disable
* enable
* focus
* blur
* change

They are handled simultaneously with all the other events. All shortcuts
are in place, you can wire and run the events the usual way.


### .include

    include(Object methods[, boolean dont_rewrite])

Registers additional methods for the form input element units, like INPUT,
SELECT, TEXTAREA.

    Input.include({
      myMethod: function() {....}
    });

    $('my_input').myMethod();


### #initialize

    initialize(raw_dom_element) -> Input
    initialize(Object options)  -> Input

Basic constructor. It might take a raw dom input element or all the standard
{Element} options, plus an uniformed option of `type`, which can be one of the
standard `INPUT` tag types (`text` by default) or one of the following

  * `textarea`
  * `select`
  * `multi-select`

### #form

    form() -> Form

Returns a wrapped form object to which this input field belongs to

    $(input).form().submit();


### #getValue

    getValue() -> mixed value

Unified access to get a form element value.

    $('input').getValue();
    $('select').getValue();
    $('textarea').getValue();
    $('multi-select').getValue();


### #setValue

    setValue(mixed value) -> Element self

Unified value setter for the form elements.

    $('input').setValue('text');
    $('select').setValue(1);
    $('textarea').setValue('text');
    $('multi-select').setValue([1,2,3]);

### #value

    value()      -> mixed the current value
    value(value) -> Input self

A bidirectional method to work with {Input} field values

    $(input).value('something');
    $(input).value(); // -> 'something'


### #disable

    disable() -> Element self

Disables the element.

    $('element').disable();


### #enable

    enable() -> Element self

Enables the element.

    $('input').enable();


### #focus

    focus() -> Element self

Puts the focus on the element.

    $('input').focus();


### #select

    select() -> Element self

Puts the focus on the element and selects its data.

    $('input').select();


### #blur

    blur() -> Element self

Looses the focus on the element.

    $('input').blur();


### #disabled

    disabled() -> boolean
    disabled(value) -> Input self

A bidirectional method to work with the `disabled` property

    $(input).disabled(true);
    $(input).disabled(); // -> true
    $(input).disabled(false);
    $(input).disabled(); // -> false


### #checked

    checked() -> boolean
    checked(value) -> Input self

A bidirectional method to work with the `checked` property

    $(input).checked(true);
    $(input).checked(); // -> true
    $(input).checked(false);
    $(input).checked(); // -> false

