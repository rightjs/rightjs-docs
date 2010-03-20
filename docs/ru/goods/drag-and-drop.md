# Модуль Drag'n'Drop

Это стандартный модуль drag-and-drop для RightJS. Как и большинство библиотек подобного рода,
он содержит два базовых класса `Draggable` и `Droppable`. По каждому из них существует
отдельная статья, а так же есть общая для них демо страница

* [Draggable](/goods/drag-and-drop/draggable)
* [Droppable](/goods/drag-and-drop/droppable)
* [Демо страница](/goods/drag-and-drop/demo)

<%= anchors_index %>

<%= partial '/goods/download', :locals => {:name => 'dnd'} %>

## Автоматическая инициализация, :discovery

Данный модель предоставляет стандартную для RightJS возможность авто-инициализации
по специальному атрибуту `'rel'` и атрибутам с опциями в стиле HTML5:

    <div rel="draggable" data-draggable-options="{revert: false}">Куда тащите?</div>

    <div rel="droppable" data-droppable-options="{accept: '.sinner'}">Вот сюда</div>

## Методы уровня элементов, :methods

Так же существует несколько методов уровня dom-элементов позволяющие конвертировать
элементы в таскаемые объекты и цели для сброса

Название                   | Описание
---------------------------|--------------------------------------
makeDraggable(\[options\]) | делает элемент таскаемым
undoDraggable()            | отключает возможность таскать элемент
makeDroppable(\[options\]) | превращает элемент в цель для сброса
undoDroppable()            | отключает функциональность цели для сброса


## Замечания по производительности, :performance

В данной реализации библиотеки, количество _таскаемых_ объектов на странице не имеет
влияния на скорость работы модуля. Любое их количество будет обработано с одинаковой скоростью.

Но, производительность _зависит_ от количества _целей для сброса_ на странице. Тут так же существует
разница между целями использующими опцию перекрытия (overlap) и просто следящие за положением курсора
(по умолчанию). Первые из них работают несколько медленнее чем вторые. Поэтому если у вас на странице
собралась сотня целей для сброса, стоит подумать использовать или нет опцию перекрытия.