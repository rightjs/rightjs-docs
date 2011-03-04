# Casting плагин

`Casting` это плагин который открывает дополнительные возможности для
динамической типизации dom-оберток в RightJS.

<%= partial '/plugins/download', :locals => {:name => 'casting'} %>


## Основная идея, :idea

По умолчанию, RightJS позволяет вам регистрировать новые динамические типы
для элементов с определенным именем тэга. Например

    Element.Wrappers.TABLE = new Class(Element, {
      sort: function() {
        // сортируем таблицу
      }
    });

После этого, каждый раз когда вы создаете или обращаетесь к элементу таблицы,
он будет автоматически обернут в объект указанного вами класса.

    var table1 = new Element('table');
    var table2 = $('some-table-id');

    table1 instanceof Element.Wrappers.TABLE; // -> true
    table2 instanceof Element.Wrappers.TABLE; // -> true

Данный плагин позволяет вам регистрировать новые типы, не просто по имени
тэга, но так же и для определенных css-классов и элеметов с нужными ID

    var BlueElement = Element.Wrappers.set(
      '.blue', new Class(Element, {...})
    );

    var GreenElement = Element.Wrappers.set(
      '.green', new Class(Element, {...})
    );

    var ThatDiv = Element.Wrappers.set(
      'div#that', new Class(Element, {...})
    );

    // ...

После этого, когда инициализируется обертка, класс `Element` будет динамически
менять тип используемой обертки в зависимости от зарегистрированых правил.



## Допустимые css селекторы, :css

Вы можете использовать следующие типы css селекторов с методом
`Element.Wrappers.set`

 * 'tag'
 * '#some-id'
 * '.class-name'
 * 'tag#some-id'
 * 'tag.class-name'

__ВНИМАНИЕ__: данный плагин не поддерживает все прочие css селекторы!



## API документация, :api

Данный плагин добавляет следующие методы к объекту `Element.Wrappers`

Название                            | Описание
------------------------------------|---------------------------------
set(String css_rule, Class wrapper) | регистриует новый тип для указанного правила
get(String css_rule)                | находит зарегистрированый тип по css-правилу
get(Class wrapper)                  | находит список css-правил для обертки
has(String css_rule)                | проверяет если существует тип для указанного css-правила
has(Class wrapper)                  | проверяет если данная dom-обертка зарегистрирована
remove(String css_rule)             | удаляет зарегистрированый тип по правилу
remove(Class wrapper)               | удаляет все записи для указанного класса



