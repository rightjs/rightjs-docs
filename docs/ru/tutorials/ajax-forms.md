# Ajax формы

Данная статья рассматривает различные вопросы работы с формами через ajax.

## Отправка форм через Ajax, :sending

В целом, существует всего лишь один метод который вам нужно помнить, для того,
чтобы отправить форму через ajax, {Form#send}. В простейшем случае это
выглядит вот так.

    <form id="my-form" ...>
      // ...
    </form>

    $('my-form').send();

Данный метод автоматизирует все рутинные операции, он считывает атрибуты
формы, как-то `action` и `method`, затем собирает данные из полей ввода,
сериализует их, создает соответствующий {Xhr} запрос, отправляет его, получает
и обрабатывает ответ с сервера. Он так же автоматически блокирует форму на
время отправки ее на сервер.


## Пометка форм для отправки через Ajax, :remotize

Во многих случаях вам не нужно программно отправлять форму из скрипта, но
каким либо образом пометить ее, так что каким бы способом пользователь не
попытался эту форму отправить, она всегда уходила через Ajax.

Для этого случая существует метод {Form#remotize} который делает такие пометки

    $('my-form').remotize();

    $('my-form').submit(); // -> идет через ajax

Для того чтобы отменить изменения и сделать форму опять обычной, используйте
метод {Form#unremotize}

    $('my-form').unremotize();

    $('my-form').submit(); // -> идет обычным http

Вы так же можете использовать опцию `remote` когда создаете формы программно
в ваших скриптах, в таком случае ваша форма будет автоматически помечена для
отправки через ajax

    var form = new Form({remote: true, action: '/url'});

    form.submit(); // -> идет через ajax


## Указание опций, :options

Ajax формы в RightJS работают полностью через интерфейс класса {Xhr}, в
следствии чего вы можете указывать все те же стандартные опции сразу с
методом {Form#send}

    $('my-form').send({
      onSuccess: function() {
        console.log("Успешно!", this.text);
      },
      onFailure: function() {
        console.log("И тут что-то пошло не так", this.text);
      }
    });

Вы так же можете указывать опции с методом {Form#remotize}, в данном случае
они будут сохранены в памяти и использованы когда пользователь попытается
отправить форму

    $('my-form').remotize({
      onComplete: function() {
        console.log("Закончил", this.getHeaders());
      }
    });


## Использование спиннеров, :spinners

Класс {Xhr} в RightJS имеет встроенный обработчик спиннеров, так что вы можете
указывать их напрямую в опциях.

    $('my-form').send({
      spinner: 'the-spinner-element'
    });

Но в случае ajax форм, вам не нужно делать даже этого. Когда вы отправляете
форму через ajax, RightJS автоматически попытается найти на данной форме
элемент с css-классом `spinner` и использовать его в качестве спиннера

    <form id="my-form">
      <img src="spinner.gif" class="spinner" />
    </form>

    $('my-form').send(); // использует 'img.spinner'


## Отправка файлов через Ajax, :uploading

RightJS имеет встроенный обработчик отгрузки форм с файлами через Ajax.
Программный интерфейс в данном случае никаким образом не меняется, вы все так
же просто вызываете метод {Form#send}, но в данном случае есть несколько
тонких моментов о которых следует помнить.

Проблема в том, что в обычном случае вы не можете отправлять файлы через {Xhr}
запросы. Просто потому, что объекты класса `XmlHTTPRequest` не поддерживают
данную функциональность. Поэтому, когда вам нужно отправить форму с файлом
через Ajax, используются скрытые элементы `IFrame` вместо обычных
`XmlHTTPRequest` объектов.

RightJS делает все эти операции автоматически, так что вам не нужно об этом
беспокоиться, но т.к. мы используем скрытый `IFrame` элемент, существует
несколько ограничений.

Во-первых, единственным тип данных которые вы можете отсылать в ответ с
сервера, это обычный HTML контент. В противном случае, если вы скажем пошлете
назад кусок JavaScript кода, IE браузеры предложат вашему пользователю
сохранить его на диск вручную.

Во-вторых любые куски HTML кода или текст, будут трансформированы браузером,
который попытается сделать из них обычную web-страницу с HTML и BODY тэгами.
В-третьих весь ваш JavaScript код будет выполнен в контексте этого скрытого
фрейма.

Таким образом единственный способ которым вы можете отправить ответ назад с
сервера, это если вы создадите JavaScript код и обернете его в простую
веб-страницу следующим образом.

    <html>
      <head>
        <script type="text/javascript">
          with (window.parent) {
            // your JavaScript goes in here
          }
        </script>
      </head>
    </html>

Фокус в том, что вы отсылаете назад нормальную HTML страницу, которая содержит
необходимый JavaScript код, который в свою очередь будет автоматически
выполнен в контексте того окна где находится ваша изначальная форма.

__ВНИМАНИЕ__: т.к. ваш скрипт будет автоматически исполнен браузером в момент
загрузки, вы не должны использовать опцию `evalScripts`, т.к. в таком случае
ваш скрипт будет исполнен дважды.

