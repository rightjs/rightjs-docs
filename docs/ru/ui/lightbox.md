# Лайтбокс

`Lightbox` - это стандартный плагин лайтбокса для RightJS

<%= partial '/ui/head', :locals => {:name => 'lightbox'} %>

<%= anchors_index %>

## Список возможностей, :features

Данный плагин обладает следующими возможностями

* Может показывать любой HTML контент
* Поддерживает загрузку контента через {Xhr}
* Поддерживает ссылки на видео ресурсы
* Работает с коллекциями/галлереями
* Автоматическая инициализация по атрибуту `rel="lightbox"`
* Все упаковано в один маленький (4k gzipped) файл
* Не имеет зависимостей от других файлов css или картинок
* Поддержка интернационализации


## Базовое использование, :usage

Наш лайтбокс не требует, никаких дополнительных телодвижений. Просто подключите его файл.

    <script src="/javascripts/right-lightbox.js"></script>


## API интерфейс, :api

Класс `Lightbox` имеет следующий простой интерфейс

Метод                                | Описание
-------------------------------------|---------------------------------------------------
show(mixed content\[, Object size\]) | показывает данный контент
load(String url\[, Object options\]) | загружает контент через {Xhr} запрос
hide()                               | закрывает лайтбокс

Вы можете использовать данные методы, как на уровне класса

    Lightbox.show('some content');
    Lightbox.load('/some/address');
    Lightbox.hide();

Так и на уровне объектов

    var box = new Lightbox();
    box.show('some content');
    box.load('/some/url');
    box.hide();


## Автоматическая инициализация ссылок, :links

Вы посылать элементы ссылок в метод `show`, скрипт автоматически считает из
них адрес и заголовок, распознает если это ссылка на картинку, видео или просто
удаленный ресурс и покажет соответствующий лайтбокс.

    // <a href="/some/url" title="Some Content" id="the-link">click me</a>

    Lightbox.show($('the-link'));

Но вам не нужно делать даже и этого. Данный скрипт поддерживает автоматическую
инициализацию ссылок, подобно проекту [Lightbox 2](http://www.huddletogether.com/projects/lightbox2).
Все что от вас требуется это установить на ссылках атрибут `rel="lightbox"` и скрипт
автоматически будет следить за кликами на этих ссылках и показывать лайтбокс.

Можно так же помечать последовательности/коллекции ссылок с помощью атрибута
`rel="lightbox[roadtrip]"`

## Ссылки на видео, :video

Наша реализация лайтбокса поддерживает так же ссылки на основные ресурсы потокового видео.

* YouTube
* Google Video
* Vimeo

Все работает прозрачно и в точно том же виде, что и для ссылок на любые другие ресурсы,
просто поставьте маркер `rel="lightbox"` и скрипт будет открывать видео в лайтбоксе

    <a href="http:/www.youtube.com/watch?v=VAfnbIrQTSk"
       rel="lightbox">Мультик про завхват власти над миром</a>


## Список опций, :options

Вы можете использовать следующие опции с виджетом лайтбокса

Имя             | Умолчание  | Описание
----------------|------------|----------------------------------------------------------------------------------
endOpacity      | 0.8        | конечная прозрачность блокирующего элемента
fxDuration      | 200        | длительность визуальных эффектов
hideOnEsc       | true       | флаг, если нужно закрывать лайтбокс по кнопке Esc
hideOnOutClick  | true       | флаг, если лайтбокс должен закрываться по клику вне бокса
showCloseButton | true       | флаг, если кнопка закрытия должна быть видна
group           | null       | имя группы для работы с галлереями
cssRule         | "a\[data-lightbox\]" | css-правило для автоматически инициалзируемых ссылок
mediaWidth      | 425        | video player width
mediaHeight     | 350        | video player height

Вы можете указать любые из них с конструктором, или изменить глобально в переменной `Lightbox.Options`

    var hard_box = new Lightbox({
      hideOnEsc:       false,
      hideOnOutClick:  false,
      showCloseButton: false
    });
    hard_box.setTitle('Fill It Up');
    hard_box.show('some required form');

## Настройки стилей, :styles

Если вам потребуется изменить настройки стилей, используйте следующее описание
структуры элементов как руководство.

    <div class="rui-lightbox">
      <div class="rui-lightbox-locker"></div>

      <div class="rui-lightbox-dialog">
        <div class="rui-lightbox-title"></div>

        <div class="rui-lightbox-body">
          <div class="rui-lightbox-body-inner">
            <div class="rui-lightbox-body-locker">
              <div class="rui-spinner"></div>
            </div>
            <div class="rui-lightbox-scroller">
              <div class="rui-lightbox-content">
                Your content in here
              </div>
            </div>
          </div>
        </div>

        <div class="rui-lightbox-nav">
          <div class="close">&times;</div>
          <div class="prev">&larrow;</div>
          <div class="next">&rarrow;</div>
        </div>
      </div>
    </div>
