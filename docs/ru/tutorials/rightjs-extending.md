# RightJS пособие по расширению

Начиная с версии 2.0.0, все юниты в RightJS являются по сути обычными
JavaScript классами. В них нет ничего хитрого и вы можете расширять свойство
`prototype` напрямую, как это обычно делается в JavaScript

    String.prototype.isBob = function() {
      return this.indexOf('Bob') > -1;
    };

    "Bob".isBob();  // true
    "Mary".isBob(); // false

    Array.prototype.hasBob = function() {
      return this.indexOf('Bob') > -1;
    };

    ["Bob"].hasBob();   // true
    ["Mary"].hasMary(); // true

    Element.prototype.isBob = function() {
      return this.hasClass('bob');
    };

    Event.prototype.isBob = function() {
      return this.target.hasClass('bob');
    };

    Document.prototype.hasBob = function() {
      return this.find('.bob').length > 0;
    };

    Xhr.prototype.getBob = function() {
      return this.load('/bob');
    };

Думаю смысл понятен. Любой класс в RightJS может быть расширен таким способом.
Но мы так же предлагаем несколько более удобных возможностей.


## Совместно используемые модули в стиле Ruby, :mixins

Во-первых, RightJS поддерживает инжекцию-функциональности с помощью совместно
используемых методов в стиле Ruby. Если вы не знакомы с терминологией, то
смысл всего этого очень прост. Скажем у вас несколько методов которые вы бы
хотели использовать с разными классами и вы собрали их в хэш объект

    var BobOrNot = {
      hasBob: function() {
        return this.indexOf('Bob') > -1;
      },

      hasNoBob: function() {
        return !this.hasBob();
      }
    };

Мы называем такие хэши совместно используемыми модулями или коротко `mixin`.
В основном потому, что это модули и вы можете инжектировать их в различные
классы следующим образом

    String.include(BobOrNot);
    Array.include(BobOrNot);

    "Bob".hasBob();    // true
    ["Bob"].hasBob();  // true

    "Mary".hasBob();   // false
    ["Mary"].hasBob(); // false

Используя метод `.include()` вы можете расширять любые классы в RightJS и вы
так же можете скармливать им несколько модулей за раз:

    Element.include(Module1, Module2, ...);
    Number.include(Module1, ..);
    Window.include(....);
    Xhr.include(...);
    Fx.include(...);

Все это делается для того, чтобы вы могли легко организовывать все ваши
расширения в модули и подключать их когда и где необходимо.


## Расширение уровня класса, :class

В предыдущей главе мы рассмотрели как вы можете легко расширять
функциональность объектов используя метод `.include()`. Но вы так же можете
расширять уровень самого класса. Для этого существует метод `.extend()`

    String
      .include({ method1: function() {} })
      .extend({  method2: function() {} });

    // в результате вы получите следующее
    "string".method1();
    String.method2();

Метод `.extend()` так же может получать несколько модулей за раз.


## Обратные вызовы после расширений, :callbacks

RightJS так же поддерживает обратные вызовы после расширений. Они могут вам
понадобиться если вы захотите например использовать один и тот же модуль с
классами которые имеют различные API.

Для этих целей вы можете добавлять в ваши модули методы типа
`selfIncluded` или `selfExtended` (стиль с подчеркиваниями так же доступен
`self_included` и `self_extended`). После того как ваш модуль был инжектирован
в какой либо класс, этот метод будет вызван и получит соответствующий класс
в качестве аргумента.

Например, скажем по какой-то причине я бы хотел использовать описанный выше
модуль `BobOrNot`, не только с классами {String} и {Array}, но так же с
объектами классов {Element} и {Document}. Не знаю, возможно мне нужен общий
интерфейс для полиморфной обработки объектов этих типов. Я могу легко это
сделать с помощью функции обратного вызова:

    var BobOrNot = {
      selfIncluded: function(klass) {
        if (klass === Element) {
          Element.prototype.hasBob = function() {
            return this.hasClass('bob');
          };
        } else if (klass === Document) {
          Document.prototype.hasBob = function() {
            return this.find('div.bob').length > 0;
          };
        }
      },

      // остальные методы модуля...
    };

    // теперь мы можем вставлять модуль в классы
    String.include(BobOrNot);
    Array.include(BobOrNot);
    Element.include(BobOrNot);
    Document.include(BobOrNot);

Имейте ввиду однако, что метод `selfIncluded` не будет вставлен в класс, т.к.
метод `.include()` автоматически отфильтрует его.


## Перегрузка методов, :overloading

И последний топик в данной статье. Он не относится к RightJS напрямую, но это
часто задаваемый вопрос, поэтому я приведу тут пару примеров.

Иногда вам нужно не просто добавить несколько новых методов, но заменить
существующий, при этом заменить его так, чтобы можно было вызывать старый
метод когда нужно. Вы можете проделать этот трюк следующим образом

    var old_append = Element.prototype.append;

    Element.prototype.append = function() {
      if (my_conditions) {
        // ваша специальная обработка тут
      } else {
        return old_append.apply(this, arguments);
      }
    };

Как видите, идея очень проста. Вы сохраняете старый метод в какой-либо
переменной, а затем вызываете его когда нужно с использованием JavaScript
метода `.apply`.


Вот в общем-то и все.


