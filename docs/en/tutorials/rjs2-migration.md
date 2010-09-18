# RightJS 2 Migration Guide

Before moving any further, please check the following articles, they will give
you the basic overview of all the changes RightJS 2 brings in

 * [What's New in RightJS 2](/tutorials/what-new-in-rjs2)
 * [What's New in RightJS UI 2](/tutorials/what-new-in-rui2)

Once you've finished that, you will generally know what to do, but lets
summarize the things in a simple pre-flight check



## 1. Update Builds, :builds

First of all for sure, go to the [Downloads](/download) page and grab new
builds, save them instead of the old ones. You also will need fresh builds
of all [UI](/ui) and [Plugins](/plugins). And also don't forget to update
the [i18n modules](http://github.com/rightjs/rightjs-ui/tree/master/i18n/) if
you use them, there were some changes too.

If you use [right-rails](http://github.com/MadRabbit/right-rails), just run
the standard `right_rails` generator, it will replace all your old files with
the new ones



## 2. Check Arguments Access, :args

This is the most painful part of migration. Because we switching from direct
elements access to dom-wrappers, you don't have immediate access to elements
properties and need to use the {Element#set} and {Element#get} methods.

    # old
    element.id;

    # new
    element.get('id');

    # old
    element.id = 'my-id';

    # new
    element.set('id', 'my-id');

But you can cheat in here and access your elements directly via the `_`
property, which refers directly to the raw dom-object.

    element._.id;
    element._.id = 'my-id';

It's perfectly legit, so don't hesitate, use it. To work with the `innerHTML`
property use the {Element#html} method, it work both ways

    element.html(); // -> returns the innerHTML property
    element.html('boo hoo!'); // sets the innerHTML

There is also a list of several new {Element} methods that might be helpful,
you can find them [over here](/tutorials/what-new-in-rjs2#new-dom-methods)


## 3. Window and Document access, :windoc

If you need the `window` and `document` object extensions, use the same `$()`
function on them as you do with any other element on the page.

    $(window).size();
    $(document).onReady();

We don't extend the dom-elements anymore. Any of them.


## 4. Events Delegation, :ujs

UJS support in RightJS 2 was cleaned up, updated and extended. The sweet
{String#on} method is still in place, but the `Event.delegate` hacks were
removed in favor of the {Element#delegate} and {Element#undelegate} methods.

If you used `Event.delegate`, check those. They have pretty close API and
simplify lots of things.


## 5. Deprecated Methods, :deprecations

Because dom-wrappers don't put any constrains on us anymore, some methods were
renamed a bit to make them more meaningful. Check the list of new dom methods
[over here](/tutorials/what-new-in-rjs2#new-dom-methods).

The old methods will be around for a while, so no hurry with that, you can
skip this step if short on time.


## 6. UI Module Updates, :ui

UI modules at their core are pretty much the same, but there were several
major adjustments that supposed to make them more consistent with each other
and easier to use.

 1. The css class names prefix was changed from `right-` to `rui-`. It is less
    arrogant and fun, but have less chances to interrupt with the user's
    classes.

 2. Automatic UI initialization was changed from all sorts of classes and
    attributes to standard HTML5 attributes with names like
    `data-[widget-name]`

 3. All widgets are elements now, and therefore the events system was changed
    a bit, instead of feeding your listeners with all sorts of arguments,
    widgets now fire custom dom-events and all the data is attached to the
    event objects.

There also were small fixes in the HTML structure, CSS, i18n here and there,
some options were added, some removed, so if you use some widgets more than
"as is", you should check their pages at the [UI](/ui) section.

