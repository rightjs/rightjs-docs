# jQuery - RightJS Cheat Sheet

A little cheat-sheet to smooth your transition from jQuery to RightJS. Keep
in mind that this is not the whole RightJS, because besides of DOM features
RightJS also has quite a lot of utility features, OOP, FP, JavaScript core
extensions, etc.

In all the following snippets, the top one is a jQuery example and the
bottom one is a RightJS equivalent.

<%= anchors_index %>

## DOM Navigation, :navigation

Find an element by it's ID:

    $('#element-id')

    $('element-id')

Find a group of elements matching a css-rule

    $('div.css#rule')

    $$('div.css#rule')

Find a sub-element

    $('#element-id').find('div.something').first();

    $('element-id').first('div.something');

Find a collection of sub-elements

    $('#element-id').find('div.something');

    $('elment-id').find('div.something');

Neighborhood traversal is mostly all the same

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


## DOM Manipulation, :manipulation

Inserting content at the bottom

    $('#element-id').append(content);

    $('element-id').insert(content);
    // 'append' is also avaliable
    $('element-id').append(el1[, el2, ....]);

    $('#element-id').appendTo(element);
    $('element-id').insertTo(element);

Inserting thins on top

    $('#element-id').prepend(content);
    $('element-id').insert(content, 'top');

    $('#element-id').prependTo(element);
    $('element-id').insertTo(element, 'top');

Inserting things before

    $('#element-id').before(content);
    $('element-id').insert(content, 'before');

    $('#element-id').insertBefore(element);
    $('element-id').insertTo(element, 'before');

Inserting things after

    $('#element-id').after(content);
    $('element-id').insert(content, 'after');

    $('#element-id').insertAfter(element);
    $('element-id').insertTo(element, 'after');

Removing, replacing, wrapping cloning are all the same

    $('#element-id').remove();
    $('element-id').remove();

    $('#element-id').replace(element);
    $('element-id').replace(element);

    $('#element-id').wrap(element);
    $('element-id').wrap(element);

    $('#element-id').clone();
    $('element-id').clone();

Full content update is also all the same

    $('#element-id').html(); // -> innerHTML
    $('element-id').html();  // -> innerHTML

    $('#element-id').html(content);
    $('element-id').html(content);


## DOM Attributes, :attributes

Getting an attribute

    $('#element-id').attr('title');
    $('element-id').get('title');

Setting an attribute

    $('#element-id').attr('title', 'Boo hoo!');
    $('element-id').set('title', 'Boo hoo!');

Removing an attribute

    $('#element-id').removeAttr('title');
    $('element-id').erase('title');

Checking if an attribute is set

    $('#element-id').attr('title') === undefined;
    $('element-id').has('title');

## DOM Classes, :classes

Adding, removing and toggling the css-classes are all the same

    $('#element-id').addClass('marked');
    $('element-id').addClass('marked');

    $('#element-id').removeClass('marked');
    $('element-id').removeClass('marked');

    $('#element-id').toggleClass('marked');
    $('element-id').toggleClass('marked');

    $('#element-id').hasClass('marked');
    $('element-id').hasClass('marked');


## DOM Styles Handling, :styles

Getting a style

    $('#element-id').css('background-color');
    $('element-id').getStyle('background-color');

Setting a style

    $('#element-id').css('color', 'red');
    $('element-id').setStyle('color', 'red');

    $('#element-id').css({color: 'red'});
    $('element-id').setStyle({color: 'red'});

    // also
    $('element-id').setStyle('color:red;font-size: 10em');

## DOM Dimensions And Positions, :positions

Element absolute position

    $('#element-id').offset();    // {left: NN, top: NN}
    $('element-id').position();   // {x: NN, y: NN}

Element sizes

    $('#element-id').width();
    $('element-id').size().x;

    $('#element-id').height();
    $('element-id').size().y;

Scrolling positions

    $('#element-id').scrollLeft();
    $('element-id').scrolls().x;

    $('#element-id').scrollTop();
    $('element-id').scrolls().y


## DOM Events Handling, :events

Adding an event listener

    $('#element-id').bind('click', function() {..});
    $('element-id').onClick(function() {...});

    // calls by name are also available
    $('element-id').onClick('toggleClass', 'marked');

Adding several event listeners

    $('#element-id').bind({click: func});
    $('element-id').on({click: func});

Removing an event listener

    $('#element-id').unbind('click', func);
    $('element-id').stopObserving('click', func);

Stopping an event

    $('#element-id').bind('click', function(event) {
      event.stopPropagation();
      event.preventDefault();
    });

    $('element-id').onClick(function(event) {
      event.stop();
    })

    // or like that
    $('element-id').onClick(function() { return false; });
    // or even like that
    $('element-id').onClick('stopEvent');

Triggering events manually

    $('#element-id').trigger('click');

    $('element-id').fire('click');

## UJS Support, :ujs

Adding global UJS handlers

    $('div.someghing').live('click', function() {.. });

    "div.something".onClick(function() {});
    "div.something".onClick('toggleClass', 'marked');

Removing global UJS handlers

    $('div.something').die('click', func);

    "div.something".stopObserving('click'[, ...]);

Adding local UJS handlers

    $('#element-id').delegate('div.blue', 'click', func);

    $('element-id').delegate('click', 'div.blue', func);
    $('element-id').delegate('click', {
      'div.blue': blues_handler,
      'div.red':  reds_handler
    });
    $('element-id').delegate('click', 'div.blue', 'toggleClass', 'marked');

Removing local UJS handlers

    $('#element-id').undelegate('div.blue', 'click');

    $('element-id').undelegate('click', 'div.blue');

RightJS is also has {Element#delegates} method to check if some events were
delegated.


## Ajax Handling, :ajax

Basic ajax requests

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

Simply getting the data via a GET request

    $.get('/some/url', function(response_text) {
      // ...
    });

    Xhr.load('/some/url', {
      onSuccess: function() {
        this.text; // <- the response text
      }
    });

Loading data into an element

    $('#element-id').load('/some/url', function() { ... });

    $('element-id').load('/some/url', {any_standard: options});

Requesting JSON data

    $.getJSON('/some/url.json', function(json) {

    });

    Xhr.load('/some/url.json', {
      onSuccess: function() {
        this.json; // the json data
      }
    });

Sending generic forms via ajax

    $.ajax({
      url:  $('#my-form').attr('action'),
      type: $('#my-form').attr('method'),
      data: $('#my-form').serialize(),
      success: function_1
    });

    $('my-form').send({onSuccess: func1});


## Visual Effects, :effects

Basic fx interface

    $('#element-id').animate({
      background: 'green'
    }, 400, func_1);

    $('element-id').morph({
      background: 'green'
    }, {
      duration: 400,
      onFinish: func_1
    });

Fading and sliding

    $('#element-id').fadeIn();
    $('element-id').fade('in');

    $('#element-id').fadeOut();
    $('element-id').fade('out');

    $('#element-id').slideIn();
    $('element-id').slide('in');

    $('#element-id').slideOut();
    $('element-id').slide('out');

Show/hide/toggle with effects

    $('#element-id').show('slow');
    $('element-id').show('fade');
    $('element-id').show('slide');

    $('#element-id').hide('slow');
    $('element-id').hide('fade');
    $('element-id').hide('slide');

    $('#element-id').toggle('slow');
    $('element-id').toggle('fade');
    $('element-id').toggle('slide');


## Utility Operations, :util

Catching the dom-ready event

    $(function() {
      // ....
    });

    $(document).onReady(function() {
      // ....
    });


Checking the current browser type

    jQuery.browser.msie;

    Browser.IE;


Collections processing

    $('div.something').each(function(index) {
      $(this).addClass('marked');
    });

    $$('div.something').each(function(item) {
      item.addClass('marked');
    });

    // or like that
    $$('div.something').each('addClass', 'marked');


Mapping the results of function call on a collection

    jQuery.map([1,2,3], function(num) {
      return num * 2;
    });

    [1,2,3].map(function(num) {
      return num * 2;
    });

Merging arrays

    jQuery.merge([1,2], [3,4]);

    [1,2].merge([3,4]);

Getting unique elements out of an array

    jQuery.unique([1,1,2,2]);

    [1,1,2,2].uniq();

Making an array out of an iterable value

    jQuery.makeArray(value);
    $A(value);

Extending one object with other

    jQuery.extend(obj1, obj2);

    $ext(obj1, obj2);

Binding functions to predefined contexts

    jQuery.proxy(func, context);

    func.bind(context);

Variable type checks

    jQuery.isFunction(value);
    isFunction(value);

    jQuery.isArray(value);
    isArray(value);

    jQuery.isPlainObject(value);
    isHash(value);

    jQuery.isEmptyObject(value);
    Object.empty(value);

Eval a string in the global scope

    jQuery.globalEval(string);
    $eval(string);

There are more utility features available in RightJS, see the
`Util` and `Lang` sections in the [API Documentation](/docs)