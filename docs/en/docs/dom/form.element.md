# Form Element

All the form elements like inputs, selects and textareas have some additional
features in RightJS to help you work with them.

## Events

Unlike other DOM elements, form elements handle a bunch of additional events:

* disable
* enable
* focus
* blur
* change

They are handled simultaneously with all the other events. All shortcuts
are in place, you can wire and run the events the usual way.

### .addMethods

    addMethods(Object methods[, boolean dont_rewrite])

Registers additional methods for the form input element units, like INPUT,
SELECT, TEXTAREA.

__DEPRECATED__: Please use the {.include} method instead.


### .include

    include(Object methods[, boolean dont_rewrite])

Registers additional methods for the form input element units, like INPUT,
SELECT, TEXTAREA.

    Form.Element.include({
      myMethod: function() {....}
    });

    $('my_input').myMethod();



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


