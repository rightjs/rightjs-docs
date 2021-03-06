# Табы

`Tabs` - это стандартный движок табов для RightJS. Он предоставляет возможность легко
создавать элементы табов, а так же поддерживает виджеты гармошки и карусельки в одом плагине.

<%= partial '/ui/head', :locals => {:name => 'tabs'} %>

<%= anchors_index %>

## Список возможностей, :features

Виджет табов предоставляют следующие возможности:

* Три виджета в одном (табы, карусель, гармошка)
* Все включено в одном небольшом (~10k) файле
* Чистый CSS дизайн, никаких внешних зависимостей от картинок
* Простое и удобное использование
* Возможна загрузка контента через AJAX
* Интерфейс для управления табами программно
* Восстановление состояния по анкерам url-адресов и кукисам
* Семантически дружелюбная разметка совместимая с табами jQuery


## Основы использования, :usage

Использование табов очень простое. Подключите один из вышеперечисленных файлов
на вашу страницу, и подготовьте структуру элементов табов в следующем виде.

    <ul>
      <ul>
        <li><a href="#tab-1">Tab 1</a></li>
        <li><a href="#tab-2">Tab 2</a></li>
      </ul>

      <li id="tab-1">Tab 1 Content</li>
      <li id="tab-2">Tab 2 Content</li>
    </ul>

Вы так же можете использовать оригинальный для jQuery формат с тэгами DIV

    <div>
      <ul>
        <li><a href="#tab-1">Tab 1</a></li>
        <li><a href="#tab-2">Tab 2</a></li>
      </ul>

      <div id="tab-1">Tab 1 Content</div>
      <div id="tab-2">Tab 2 Content</div>
    </div>

После этого вам необходимо инициализировать объект виджета простым JavaScript вызовом

    <ul id="my-tabs">
    //...
    new Tabs('my-tabs');

Вы так же можете просто назначить класс `rui-tabs` на вашем элементе, и
скрипт автоматически найдет и проинициализирует виджет когда страница загрузится

    <ul class="rui-tabs">
      // ...
    </ul>

Опции с использование атрибутов в стиле HMTL5 так же доступны

    <ul class="rui-tabs" data-tabs="{select:2}">
      // ...
    </ul>

## Различные варианты, :variants

Для того что-бы создать виджет карусели, просто добавьте к вашему элементу
css-класс `rui-tabs-carousel`.

    <ul id="my-carousel" class="rui-tabs-carousel">
      // ...
    </ul>

Для виджета гармошки, используйте стандартную структуру списка с описаниями
из тэгов `DL/DT/DD`.

    <dl>
      <dt><a href="#">Tab 1</a></dt>
      <dd>Tab 1 Content</dd>
      <dt><a href="#">Tab 2</a></dt>
      <dd>Tab 2 Content</dd>
    </dl>

Все остальные вещи, как-то удаленная загрузка контента, опции, события и т.п.
работают одинаково для всех видов виджетов


## Удаленная загрузка, :remote

Для того чтобы заставить скрипт загружать ваши данные с удаленного сервера через
{Xhr} запросы, все что вам требуется это указать их адреса в ссылках списка табов.
В этом случае вам так же не нужно создавать элементы панелей, скрипт сам сгенерирует
их когда потребуется.

    <ul>
      <ul>
        <li><a href="content/tab-1.html">Tab 1</a></li>
        <li><a href="content/tab-2.html">Tab 2</a></li>
      </ul>
    </ul>

Так же существует смешанный подход. Вы можете использовать анкеры как в обычных табах
и использовать общий для всех табов url-адрес содержащий плейсхолдер `%{id}`, как в
следующем примере

    <ul id="my-tabs">
      <ul>
        <li><a href="#tab-1">Tab 1</a></li>
        <li><a href="#tab-2">Tab 2</a></li>
      </ul>
    </ul>
    // ...
    new Tabs('my-tabs', {url: '/content/%{id}.html'});

В этом случае скрипт будет заменять плейсхолдер анкерами ссылок и обращаться к адресам

    /content/tab-1.html
    /content/tab-2.html


## Указание текущего таба, :current

Существует несколько способов для указания таба который пользователь увидит по умолчанию.

Вы можете просто добавить css-класс `rui-tabs-current` на нужном элементе списка табов.

    <ul id="my-tabs">
      <ul>
        <li><a href="#tab-1">Tab 1</a></li>
        <li class="rui-tabs-current"><a href="#tab-2">Tab 2</a></li>
      </ul>
    </ul>

Вы так же можете указать индекс текущего таба в опции `selected`. Еще вы можете активировать
опцию `Cookie` и скрипт будет автоматически хранить индекс последнего таба в кукисах.

И в конце концов, скрипт поддерживает указатели на табы путем использования анекров url-адресов.
Если скрипт найдет анкер из списка табов совпадающий с указанным в текущем адресе, он
автоматически покажет этот таб. Таким образом пользователи могут давать ссылки на конкретный таб.

Приоритет выбора текущего таба следующий

    URL -> Cookie -> CSS Class -> First


## Список опций, :options

Существует следующий список поддерживаемых опций для табов

Имя             | Умолчание | Описание
----------------|-----------|------------------------------------------------------------------
idPrefix        | ''        | префикс для ID атрибутов панелей
tabsElement     | null      | ссылка на элемент списка табов (на случай если он расположен в другом месте)
resizeFx        | 'both'    | `'slide'`, `'fade'`, `'both'` или `null` чтобы отключить
resizeDuration  | 400       | длительность эффекта переключения
scrollTabs      | false     | флаг, если необходимо использовать прокрутку для списка табов
scrollDuration  | 400       | длительность эффекта прокрутки табов
selected        | null      | индекс таба по умолчанию
disabled        | \[\]      | список индексов заблокированных табов
closable        | false     | если `true`, то табы будут иметь иконку закрытия
loop            | false     | длительность паузы в мс для эффекта слайдшоу
loopPause       | true      | флаг, ставит слайдшоу на паузу, когда пользователь помещает курсор над табами
url             | false     | общий url-адрес для табов, должен содержать плейсхолдер `%{id}`
cache           | false     | флаг, если необходимо кэшировать табы загружаемые с сервера
Xhr             | null      | дополнительные опции для {Xhr} запросов
Cookie          | null      | {Cookie} опции, если необходимо хранить индекс последнего таба

Вы можете использовать любые из вышеперечисленных опций с конструктором класса `Tabs`

    new Tabs('my-tabs', {
      idPrefix: 'my-',
      selected: 2,
      Xhr: {spinner: 'spinner'}
    });

Или вы можете использовать HTML5 атрибут `data-tabs` непосредственно на ваших элементах

    <ul data-tabs="{idPrefix:'my-', selected:4}">
      // ...
    </ul>

## Список событий, :events

Данный скрипт поддерживает следующий список событий

Имя     | Описание
--------|------------------------------------------------
select  | когда таб был показан
hide    | когда таб был скрыт
click   | когда пользователь кликает по табу
load    | когда удаленный таб был загружен
disable | когда таб был заблокирован
enable  | когда таб был разблокирован
add     | когда новый таб был добавлен
remove  | когда таб был удален из списка
move    | когда таб был передвинут в новое место

Каждый слушатель событий будет получать ссылку на объект таба как аргумент.


## API документация, :api

Существует следующий простой интерфейс для объектов класса `Tabs`

Метод                            | Описание
---------------------------------|----------------------------------
select(index)                    | показывает таб по индексу (_integer_!)
add(title, content\[, options\]) | создает новый таб
remove(index\[s\])               | удаляет таб(ы)
move(index, position)            | перемещает таб в новую позицию
disable(index\[s\])              | блокирует таб(ы)
enable(index\[s\])               | разблокирует таб(ы)
startLoop(\[delay_ms\])          | запускает цикл слайдшоу
stopLoop()                       | останавливает слайдшоу


Метод `add` может получать хэш опций со следующими ключами

* `id` - имя анкера таба
* `url` - url-адрес контента для удаленного таба
* `position` - позиция таба в списке


## Настройки стилей, :styles

В наиболее простом случае, после того как объект табов был создан, он назначит
следующие css-классы на элементы струтуры

    <ul class="rui-tabs">
      <ul class="rui-tabs-list">
        <li class="rui-tabs-tab rui-tabs-current"><a href="#">Tab 1</a></li>
        <li class="rui-tabs-tab"><a href="#">Tab 2</a></li>
      </ul>

      <li class="rui-tabs-panel rui-tabs-current">Content 1</li>
      <li class="rui-tabs-panel">Content 2</li>
    </ul>

Скрипт так же будет использовать css-классы `rui-tabs-current` и `rui-tabs-disabled`
для текущих и заблокированных табов соответственно.

Виджет карусели и табы с прокруткой, будут немного трансформированы для создания
соответствующих элементов управления

    <ul class="rui-tabs">
      <div class="rui-tabs-scroller">
        <div class="rui-tabs-scroller-prev">&laquo;</div>
        <div class="rui-tabs-scroller-next">&raquo;</div>

        <ul class="rui-tabs-list">
          ..........
        </ul>
      </div>

      ............
    </ul>

Далее, для табов загружаемых с сервера, скрипт будет использовать блокирующий элемент следующей структуры

    <ul class="rui-tabs">
      <ul class="rui-tabs-list">
        // ...
      </ul>

      <li class="rui-tabs-panel">
        <div class="rui-tabs-panel-locker">
          <div class="rui-spinner">
            <div class="glow"></div><div></div><div></div><div></div>
          </div>
        </div>
      </li>
    </ul>

Виджет гармошки, не претерпит никаких структурных изменений, за исключением того что
для его элементов будут назначенные те же самые css-классы

    <dl class="rui-tabs">
      <dt class="rui-tabs-tab">Tab 1</dt>
      <dd class="rui-tabs-panel">Tab Content</dd>
      // ...
    </dl>
