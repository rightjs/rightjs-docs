# Поля ввода

{Input} это базовый класс dom-оберток для работы с различными полями ввода.
Он унаследован от класса {Element} и имеет общий с ним интерфейс.

## События

В дополнение к обычным dom-событиям, для полей ввода существует ряд
дополнительных событий:

* disable
* enable
* focus
* blur
* change

Эти события обрабатываются точно так же как и все прочие, для них существуют
сокращения вроде `onFocus`, `onBlur`, и вы можете подключать их любым
стандартным способом.



### .include

    include(Object methods[, boolean dont_rewrite])

Регистрирует дополнительные методы для элементов форм

    Input.include({
      myMethod: function() {....}
    });

    $('my_input').myMethod();


### #initialize

    initialize(raw_dom_element) -> Input
    initialize(Object options)  -> Input

Базовый конструктор, может получать чистый dom-объект поля ввода или набор
стандартных опций, тот же что и в случае класса {Element}, плюс опцию `type`
которая может быть одной из стандартных для тэга `INPUT` или одно из следующих

 * `textarea`
 * `select`
 * `multi-select`

`text` - значение по умолчанию

    new Input();                  // -> input#text
    new Input({type: 'radio'})    // -> input#radio
    new Input({type: 'textarea'}) // -> textarea
    new Input({type: 'select'})   // -> selectbox


### #form

    form() -> Form

Возвращает обернутый объект формы ({Form}) которой принадлежит данное поле
ввода

    $(input).form().submit();



### #getValue

    getValue() -> mixed value

Унифицированный метод для получения текущего значения поля ввода

    $('input').getValue();
    $('select').getValue();
    $('textarea').getValue();
    $('multi-select').getValue();


### #setValue

    setValue(mixed value) -> Element self

Унифицированный метод для установки значения поля ввода

    $('input').setValue('text');
    $('select').setValue(1);
    $('textarea').setValue('text');
    $('multi-select').setValue([1,2,3]);


### #value

    value()      -> mixed the current value
    value(value) -> Input self

Двунаправленый метод для работы со значениями полей ввода

    $(input).value('something');
    $(input).value(); // -> 'something'


### #disable

    disable() -> Element self

Блокирует элемент запрещая любые изменения в нем

    $('element').disable();


### #enable

    enable() -> Element self

Разблокирует заблокированный элемент

    $('input').enable();


### #focus

    focus() -> Element self

Передает фокус в данный элемент

    $('input').focus();


### #select

    select() -> Element self

Передает фокус в данный элемент и выделяет его содержимое

    $('input').select();


### #blur

    blur() -> Element self

Убирает фокус с данного элемента

    $('input').blur();


### #disabled

    disabled() -> boolean
    disabled(value) -> Input self

Двунаправленый метод для работы с атрибутом `disabled`

    $(input).disabled(true);
    $(input).disabled(); // -> true
    $(input).disabled(false);
    $(input).disabled(); // -> false


### #checked

    checked() -> boolean
    checked(value) -> Input self

Двунаправленый метод для работы с атрибутом `checked`

    $(input).checked(true);
    $(input).checked(); // -> true
    $(input).checked(false);
    $(input).checked(); // -> false


