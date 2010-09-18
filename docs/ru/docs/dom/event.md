# События

Для того чтобы предоставить возможность кросс-браузерной работы с событиями,
RightJS добавляет несколько стандартных расширений.


## События в Internet Explorer

Вместо того чтобы создавать некий дополнительный интерфейс объединяющий
различные версии объектов событий в различных браузерах, RightJS просто
заменяет и создает стандартные W3C атрибуты для объектов событий, так что,
на каком бы браузере ваш код не исполнялся, вы можете работать с событиями
так, как если бы вы работали с браузером следующим стандартам.

Список создаваемых атрибутов:

* `which` - номер нажатой кнопки мыши (1,2,3)
* `target` - ссылка на элемент вызвавший событие
* `currentTarget` - ссылка на элемент слушающий событие
* `relatedTarget` - ссылка на зависимый элемент для событий mouseover,mouesout
* `pageX`, `pageY` - абсолютная позиция курсора

### .ext

    Event.ext(Event event) -> Event extended

Подключает расширения для объекта событий. На случай необходимости сделать это
в принудительно.

    $('element').attachEvent('onclick', function(event) {
      Event.ext(event);

      event.stop();
    });


### .include

    Event.include(Object methods[, boolean dont_rewrite])

Регистрирует дополнительные методы для объектов событий.

    Event.include({
      myMethod: function() {....}
    });

    $('my_element').onClick(function(event) {
      event.myMethod()
    });


### .delegate

    Event.delegate(Object description) -> Function delegation

Создает функцию которая будет делегировать обработчик событий
в зависимости от элемента вызвавшего событие

__ВНИМАНИЕ__: указанная функция-обработичк события будет вызвана
в контексте элемента _вызвавшего_ событие

    var delegation = Event.delegate({
      "div.red":   function() { alert('Вы кликнули красный блок'); },
      "div.green": function() { alert('Вы кликнули зеленый блок'); }
    });

    document.onClick(delegation);

    // вы так же можете указывать обработчик по имени
    var delegation = Event.delegate({
      ".red":     ['addClass', 'was-red'],
      ".green":   ['addClass', 'was-green'],
      ".hide-me": 'hide'
    });


### .behave

    Event.behave(String css_rule, String event, Function callback)        -> Object events
    Event.behave(String css_rule, String event, String method[, arg, ..]) -> Object events
    Event.behave(String css_rule, Object event_handlers)                  -> Object events

Подключает делегированный обработчик событий уровня документа, возвращает
хэш с реальными обработчиками который можно использовать для отключения
обработки в методе `document.stopObserving`

    // с обычными функциями
    Event.behave("#todos li", "click", function() { this.remove(); });

    // с вызовом по имени
    Event.behave("#todos li", "click", "addClass", "marked");

    // с хэшем обработчиков
    Event.behave("#todos li", {
      mouseover: function() { this.addClass('hovered'); },
      mouseout:  ['removeClass', 'hovered'],
      click:     'remove'
    });

    // отключение обработчика
    var handlers = Event.behave(.....);

    document.stopObserving(handlers);


### #stop

    stop() -> Event self

Останавливает событие предотвращая дальнейшее его распространение

    $('element').onContextmenu(function(e) {
      e.stop();
      $('context-menu').moveTo(e.position()).show();
    });


### #preventDefault

    preventDefault() -> void

Отключает обработку события по умолчанию


### #stopPropagation

    stopPropagation() -> void

Предотвращает дальнейшее распространение события


### #position

    position() -> {x: NNN, y: NNN}

Возвращает хэш с позицией события

    $('element').onMouseover(function(event) {
      $('nice-looking-title').show().moveTo(event.position());
    });


