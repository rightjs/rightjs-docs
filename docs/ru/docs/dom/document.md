# Документ

{Document} это стандартная dom-обертка для работы с dom-документами.

## Отслеживание загрузки документа

Событие конца загрузки документа в RightJS называется просто `ready` и вы
можете назначить его обработчик любым стандартным способом.

    $(document).onReady(function() {...});
    $(document).on('ready', function() {...});

Это событие можно точно так же обрабатывать с объектом {Window}.


### #on

    on(String name, Function callback[, arguments, ...]) -> Document self

Стандартный метод для подключения слушателей событий

    $(document).on('ready', function() {....});

### #observes

    observes(Function listener)                -> boolean
    observes(String name[, Function listener]) -> boolean

Проверяет если документ слушает то или иное событие

    var func = function() {};

    $(document).on('click', func);

    $(document).observes(func);              // -> true
    $(document).observes('mouseover', func); // -> false


### #listeners

    listeners()            -> Array of functions
    listeners(String name) -> Array of functions

Возвращает список слушателей событий, опционально отфильтрованный по типу.

    var func = function() {};

    $(document).on('click', func);

    $(document).listeners();            // -> [func]
    $(document).listeners('click');     // -> [func]
    $(document).listeners('mouseover'); // -> []



### #stopObserving

    stopObserving(Function listener)       -> Document self
    stopObserving(String name[, listener]) -> Document self

Отключает слушателей событий

    var listener = function() {};

    $(document).on('click', listener);

    $(document).stopObserving('click');

    $(document).stopObserving(listner);

    $(document).stopObserving('click', listner);

### #onReady

    onReady(Function callback[, arguments[, ....]]) -> Document self

Сокращение для `on('ready', ...)`

    $(document).onReady(function() {....});

