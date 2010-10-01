# Sizzle

This plugin provides support of the [Sizzle](http://sizzlejs.com) css
selectors engine for RightJS.

<%= partial '/plugins/download', :locals => {:name => 'sizzle'} %>

## What And Why, :what

By default RightJS uses native css selectors that majority of modern browsers
provide, this way we have fast support of majority of standard CSS selectors
up to the Level 3.

Sizzle is an external css selectors engine that provides a full stack CSS3
selectors support on all browsers, plus it provides several additional
conventional selectors, like `:odd`, `:even`, `:not`, etc.

    $('my-table').find('tr:odd');
    $('my-table').find('tr:even');

    $('my-list').first('li:not(*.marked)');

That's pretty much it.

