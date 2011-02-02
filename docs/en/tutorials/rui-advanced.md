# Advanced RightJS UI Tutorial
<% set_unit_scope('Element') %>

This tutorial describes some advanced features of RightJS IU and supposed to
give you basic understanding of the internal architecture and ways to extend
the system

<%= anchors_index %>

## Widgets === Elements, :elements

One of the greatest things about RightJS 2 is that it allows you to inherit
any dom-units, and this is exactly what's going on in RightJS UI. All the
widgets represent normal page elements and inherited from the basic {Element}
class.

    var calendar = new Calendar();

    calendar instanceof Calendar; // true
    calendar instanceof Element;  // true

    Calendar.parents.include(Element); // true

It is simple but very powerful idea, because now with any widget you can do
all the same things as with any other regular element on the page

    calendar.set('id', 'my-calendar');
    calendar.addClass('my-calendar');
    calender.insertTo('my-element');

Keeping this in mind you can answer most of everyday questions, for example:

#### How do I find currently selected cell on my `Calendar`?

You just {#find} {#first} `td` element that is `selected`

    calendar.first('td.selected');
    // or
    calendar.find('td.selected')[0];

#### How do you I append an element to `Sortable` ?

You just {#append} it

    var sortable = new Sortable('my-list');

    sortable.append('<li>last item</li>')

    // or put on top if you need
    sortable.insert('<li>first item</li>', 'top');

#### How do I update a `Dialog` content?

You just {#update} it

    var dialog = new Dialog();
    dialog.update('with some text');

And so on. Every time when you need to do something unusual with a widget and
you don't see a corresponding method on its API documentation, check for the
{Element} API all its methods will be there.



## Widgets === Classes, :classes

The second greatest thing about RightJS is that all the dom-wrappers,
including {Element} are essentially just normal classes. So if widgets are
elements and elements are classes, then widgets are classes as well.

You can use the standard functionality injection technique and register your
own methods

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

You also free to use inheritance and create your own things. For example say
I want a `Dialog` unit that will have a `Reload` button, which will
reload dialog's content via ajax.

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

Now say I want a version of the `ReloadableDialog` that will have a `Back`
button, which will load the previous address

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

You're free to inherit anything you want as many times as you see suitable