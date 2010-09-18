# Событие

{Event} - это стандартыная обертка для dom-событий, которую RightJS использует
для предоставления кросс-браузерного интерфейса для работы с событиями.

Кроме указанных ниже методов, каждый объект имеет следующие атрибуты:

* `which` - номер нажатой кнопки мыши (1,2,3)
* `target` - ссылка на элемент вызвавший событие
* `currentTarget` - ссылка на элемент слушающий событие
* `relatedTarget` - ссылка на зависимый элемент для событий mouseover,mouesout

### .include

    Event.include(Object methods[, boolean dont_rewrite])

Регистрирует дополнительные методы для объектов событий.

    Event.include({
      myMethod: function() {....}
    });

    $('my_element').onClick(function(event) {
      event.myMethod()
    });

### #stop

    stop() -> Event self

Останавливает событие предотвращая дальнейшее его распространение

    $('element').onContextmenu(function(e) {
      e.stop();
      $('context-menu').moveTo(e.position()).show();
    });


### #preventDefault

    preventDefault() -> Event self

Отключает обработку события по умолчанию


### #stopPropagation

    stopPropagation() -> Event self

Предотвращает дальнейшее распространение события


### #position

    position() -> {x: NNN, y: NNN}

Возвращает хэш с позицией события

    $('element').onMouseover(function(event) {
      $('nice-looking-title').show().moveTo(event.position());
    });


### #find

    find(String css_rule) -> Element

Находит первый подходящий элемент в цепочке между элементом вызвавшим событие
и элементом где слушатель события был подключен.

    /*
      <div id="first">
        <div id="second">
          <div id="third"></div>
        </div>
      </div>
    */

    $('first').onClick(function(event) {
      event.find('div#second');
    });

    $('third').fire('click');



