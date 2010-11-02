# RightJS UI продвинутые возможности
<% set_unit_scope('Element') %>

Данная статься описывает продвинутые возможности RightJS UI и должна дать вам
базовое представление о внутренней организации виджетов и способах их
расширения

<%= anchors_index %>

## Виджеты === Элементы, :elements

Одна из самых замечательных особенностей RightJS в том, что он позволяет вам
наследовать dom-элементы. Как следствие, все виджеты в RightJS UI по сути
являются наследниками базового класса {Element}.

    var calendar = new Calendar();

    calendar instanceof Calendar; // true
    calendar instanceof Element;  // true

    Calendar.parents.include(Element); // true

Это очень простая, но интересная идея. Т.к. все виджеты по сути являются
объектами класса {Element}, вы можете делать с ними все тоже самое что и с
любым другим элементом страницы

    calendar.set('id', 'my-calendar');
    calendar.addClass('my-calendar');
    calender.insertTo('my-element');

Держа в голове этот концепт, вы можете легко ответить на кучу повседневных вопросов,
например:

#### Как мне добраться до ячейки указывающей на текущий день в календаре?

Вы просто находите ее с помощью обычных методов {#find} {#first}

    calendar.first('td.selected');
    // или
    calendar.find('td.selected')[0];

#### Как мне добавить элемент в сортируемый список?

Совершенно обычным способом, с помощью методов {#append} или {#insert}

    var sortable = new Sortable('my-list');

    sortable.append('<li>последний элемент</li>')

    // или добавляем элемент в начало
    sortable.insert('<li>первый элемент</li>', 'top');

#### Как мне обновить содержимое диалога?

Используйте стандартный метод {#update}

    var dialog = new Dialog();
    dialog.update('какой-то текст');

И т.д. Каждый раз когда вам необходимо сделать что-либо необычное с виджетом и
вы не нашли подходящего метода в его описании, смотрите API класса {Element}
все его методы так или иначе должны быть доступны со всеми виджетами.



## Виджеты === Классы, :classes

Вторя замечательная особенность RightJS в том, что все dom-обертки, включая
{Element}, по сути являются обычными классами. Таким образом если виджеты это
dom-обертки, а dom-обертки - это классы, то все виджеты это тоже классы.

Вы можете добавлять в них свои методы с помощью стандартного подхода с
инжекцией функциональности

    Calendar.include({
      birthday: function(user) {
        this.setValue(user.birthday());
      }
    });

    Sortable.include({
      swapLastTwo: function() {
        var items = this.items();

        items[items.length - 1].insertTo(
          items[items.length - 2], 'before'
        );
      }
    });

Или же вы можете наследовать любой виджет и создавать свои собственные
типы. Например, скажем я хочу свой класс диалога который будет иметь кнопку
`Reload` по клику на которую содержимое диалога будет перезагружено через
ajax

    var ReloadableDialog = new Class(Dialog, {

      initialize: function(options) {
        this.$super(options);

        this.reloadButton = $E('div', {
          'class': 'rui-button',
          'html':  'Reload'
        }).onClick(this.relad.bind(this));

        this.footer.insert(this.reloadButton, 'top');
      },

      load: function(url, options) {
        this._url = url;
        return this.$super(url, options);
      },

      reload: function() {
        return this.load(this._url);
      }

    });

    var my_dialog = new ReloadableDialog();

А теперь, скажем я хочу еще один подкласс моего собственного класса
`ReloadableDialog`, но на этот раз он должен иметь еще и кнопку `Назад`
которая будет загружать в диалог контент из предыдущего адреса

    var DialogWithBackButton = new Class(ReloadableDialog, {

      initialize: function(options) {
        this.$super(options);

        this.backButton = $E('div', {
          'class': 'rui-button',
          'html':  'Back'
        }).onClick(this.goBack.bind(this));

        this.footer.insert(this.backButton, 'top');
      },

      load: function(url, options) {
        this._prevUrl = this._url;
        return this.$super(url, options);
      },

      goBack: function() {
        return this.load(this._prevUrl);
      }

    });

    var my_dialog = new DialogWithBackButton();

Как вы видите, все очень просто. Тут нет никаких ограничений, вы можете
наследовать и расширять то что вам нужно, столько раз сколько потребуется.