# jQuery - RightJS шпаргалка

Небольшая шпаргалка чтобы облегчить вам переход с jQuery на RightJS. Имейте
ввиду, что это далеко не весь RightJS, помимо DOM функционала в RightJS
есть множество утилит, поддержка OOP/FP, расширения ядра JavaScript и
прочих нужных штук.

Во всех последующих кусках кода, сверху будут примеры на jQuery, а снизу,
соответствующие эквиваленты на RightJS.

<%= anchors_index %>

## DOM навигация, :navigation

Ищем элемет по его ID

    $('#element-id')

    $('element-id')

Ищем группу элементов подходящую под определенное css-правило

    $('div.css#rule')

    $$('div.css#rule')

Как найти _первый_ подходящий, внутренний элемент

    $('#element-id').find('div.something').first();

    $('element-id').first('div.something');

Находим все внутренние элементы

    $('#element-id').find('div.something');

    $('elment-id').find('div.something');

Поиск по соседним элементам в общем и целом одинаков

    $('#element-id').parent('div.something');
    $('element-id').parent('div.something');

    $('#element-id').parents('div.something');
    $('element-id').parents('div.something');

    $('#element-id').children('div.something');
    $('element-id').children('div.something');

    $('#element-id').next('div.something');
    $('element-id').next('div.something');

    $('#element-id').prev('div.something');
    $('element-id').prev('div.something');

    $('#element-id').siblings('div.something');
    $('element-id').siblings('div.something');


## DOM манипуляции, :manipulation

Вставка контента в конец элемента

    $('#element-id').append(content);

    $('element-id').insert(content);
    // 'append' так же доступен
    $('element-id').append(el1[, el2, ....]);

    $('#element-id').appendTo(element);
    $('element-id').insertTo(element);

Вставляем контент в начало элемента

    $('#element-id').prepend(content);
    $('element-id').insert(content, 'top');

    $('#element-id').prependTo(element);
    $('element-id').insertTo(element, 'top');

Вставляем контент перед элементом

    $('#element-id').before(content);
    $('element-id').insert(content, 'before');

    $('#element-id').insertBefore(element);
    $('element-id').insertTo(element, 'before');

Вставляем контент после элемента

    $('#element-id').after(content);
    $('element-id').insert(content, 'after');

    $('#element-id').insertAfter(element);
    $('element-id').insertTo(element, 'after');

Удаление, замена, клонирование и т.п. одинаковы

    $('#element-id').remove();
    $('element-id').remove();

    $('#element-id').replace(element);
    $('element-id').replace(element);

    $('#element-id').wrap(element);
    $('element-id').wrap(element);

    $('#element-id').clone();
    $('element-id').clone();

Полное обновление HTML контета точно такое же

    $('#element-id').html(); // -> innerHTML
    $('element-id').html();  // -> innerHTML

    $('#element-id').html(content);
    $('element-id').html(content);


## DOM атрибуты, :attributes

Считывание атрибута

    $('#element-id').attr('title');
    $('element-id').get('title');

Установка атрибута

    $('#element-id').attr('title', 'Boo hoo!');
    $('element-id').set('title', 'Boo hoo!');

Удаление атрибута

    $('#element-id').removeAttr('title');
    $('element-id').erase('title');

Проверка существования атрибута

    $('#element-id').attr('title') === undefined;
    $('element-id').has('title');

## DOM работа с css-классами, :classes

Работа с css-классами по сути одинакова и там и тут

    $('#element-id').addClass('marked');
    $('element-id').addClass('marked');

    $('#element-id').removeClass('marked');
    $('element-id').removeClass('marked');

    $('#element-id').toggleClass('marked');
    $('element-id').toggleClass('marked');

    $('#element-id').hasClass('marked');
    $('element-id').hasClass('marked');


## DOM работа со стилями, :styles

Получение стиля

    $('#element-id').css('background-color');
    $('element-id').getStyle('background-color');

Установка стиля

    $('#element-id').css('color', 'red');
    $('element-id').setStyle('color', 'red');

    $('#element-id').css({color: 'red'});
    $('element-id').setStyle({color: 'red'});

    // так же доступно следующее
    $('element-id').setStyle('color:red;font-size: 10em');

## DOM размеры и позиции, :positions

Получение абсолютной позиции элемента

    $('#element-id').offset();    // {left: NN, top: NN}
    $('element-id').position();   // {x: NN, y: NN}

Получение размеров элемента

    $('#element-id').width();
    $('element-id').size().x;

    $('#element-id').height();
    $('element-id').size().y;

Получение позиции полос прокрутки

    $('#element-id').scrollLeft();
    $('element-id').scrolls().x;

    $('#element-id').scrollTop();
    $('element-id').scrolls().y


## DOM обработка событий, :events

Добавление слушателя события

    $('#element-id').bind('click', function() {..});
    $('element-id').onClick(function() {...});

    // сокращенные вызовы по имени так же доступны
    $('element-id').onClick('toggleClass', 'marked');

Добавление нескольких слушателей одновременно

    $('#element-id').bind({click: func});
    $('element-id').on({click: func});

Удаление слушателей

    $('#element-id').unbind('click', func);
    $('element-id').stopObserving('click', func);

Остановка обработки событий по умолчанию

    $('#element-id').bind('click', function(event) {
      event.stopPropagation();
      event.preventDefault();
    });

    $('element-id').onClick(function(event) {
      event.stop();
    })

    // или вот так
    $('element-id').onClick(function() { return false; });
    // или даже так
    $('element-id').onClick('stopEvent');

Инциирование событий вручную

    $('#element-id').trigger('click');

    $('element-id').fire('click');

## UJS программирование, :ujs

Добавляем глобальный UJS обработчик

    $('div.something').live('click', function() {.. });

    "div.something".onClick(function() {});
    "div.something".onClick('toggleClass', 'marked');

Удаляем глобальный UJS обработчик

    $('div.something').die('click', func);

    "div.something".stopObserving('click'[, ...]);

Добавляем локальный UJS обработчик

    $('#element-id').delegate('div.blue', 'click', func);

    $('element-id').delegate('click', 'div.blue', func);
    $('element-id').delegate('click', {
      'div.blue': blues_handler,
      'div.red':  reds_handler
    });
    $('element-id').delegate('click', 'div.blue', 'toggleClass', 'marked');

Удаляем локальный UJS обработчик

    $('#element-id').undelegate('div.blue', 'click');

    $('element-id').undelegate('click', 'div.blue');

RightJS так же имеет метод {Element#delegates} для проверки какие события
и чему каждый отдельный элемент делегирует.


## Работа с Ajax, :ajax

Базовый ajax вызов

    $.ajax({
      url:      '/boo/hoo',
      type:     'get',
      data:     'some=data',
      success:  func1,
      error:    func2,
      complete: func3
    });

    new Xhr('/boo/hoo', {
      method:     'get',
      onSuccess:  func1,
      onFailure:  func2,
      onComplete: func3
    }).send('some=data');

Упрощенный GET запрос

    $.get('/some/url', function(response_text) {
      // ...
    });

    Xhr.load('/some/url', {
      onSuccess: function() {
        this.text; // <- текст ответа
      }
    });

Загрузка данных напрямую в элемент

    $('#element-id').load('/some/url', function() { ... });

    $('element-id').load('/some/url', {any_standard: options});

Запрос JSON данных

    $.getJSON('/some/url.json', function(json) {

    });

    Xhr.load('/some/url.json', {
      onSuccess: function() {
        this.json; // json данные
      }
    });

Отправка обычной формы через ajax

    $.ajax({
      url:  $('#my-form').attr('action'),
      type: $('#my-form').attr('method'),
      data: $('#my-form').serialize(),
      success: function_1
    });

    $('my-form').send({onSuccess: func1});


## Визуальные эффекты, :effects

Базовый интерфейс визуальных эффектов

    $('#element-id').animate({
      background: 'green'
    }, 400, func_1);

    $('element-id').morph({
      background: 'green'
    }, {
      duration: 400,
      onFinish: func_1
    });

Слайды и фейды

    $('#element-id').fadeIn();
    $('element-id').fade('in');

    $('#element-id').fadeOut();
    $('element-id').fade('out');

    $('#element-id').slideIn();
    $('element-id').slide('in');

    $('#element-id').slideOut();
    $('element-id').slide('out');

Show/hide/toggle с эффектами

    $('#element-id').show('slow');
    $('element-id').show('fade');
    $('element-id').show('slide');

    $('#element-id').hide('slow');
    $('element-id').hide('fade');
    $('element-id').hide('slide');

    $('#element-id').toggle('slow');
    $('element-id').toggle('fade');
    $('element-id').toggle('slide');


## Утилитарные операции, :util

Отслеживание dom-ready событий

    $(function() {
      // ....
    });

    $(document).onReady(function() {
      // ....
    });


Проверка типа текущего браузера

    jQuery.browser.msie;

    Browser.IE;


Работа с коллекциями

    $('div.something').each(function(index) {
      $(this).addClass('marked');
    });

    $$('div.something').each(function(item) {
      item.addClass('marked');
    });

    // или вот так
    $$('div.something').each('addClass', 'marked');


Сбор результатов вызова функции на коллекции

    jQuery.map([1,2,3], function(num) {
      return num * 2;
    });

    [1,2,3].map(function(num) {
      return num * 2;
    });

Объединение двух массивов

    jQuery.merge([1,2], [3,4]);

    [1,2].merge([3,4]);

Получение списка уникальных элементов массива

    jQuery.unique([1,1,2,2]);

    [1,1,2,2].uniq();

Создание массива из любых итерабельных объектов

    jQuery.makeArray(value);
    $A(value);

Расширение одного объекта другим

    jQuery.extend(obj1, obj2);

    $ext(obj1, obj2);

Установка контекста исполнения для функций

    jQuery.proxy(func, context);

    func.bind(context);

Проверка типов переменных

    jQuery.isFunction(value);
    isFunction(value);

    jQuery.isArray(value);
    isArray(value);

    jQuery.isPlainObject(value);
    isHash(value);

    jQuery.isEmptyObject(value);
    Object.empty(value);

Исполнение строки кода в глобальном пространстве

    jQuery.globalEval(string);
    $eval(string);

Существует еще очень много разных утилитарных функций RightJS,
для более полной информации смотрите секции `Util` и `Lang`
в разделе [API документации](/docs)