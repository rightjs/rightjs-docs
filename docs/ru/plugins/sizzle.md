# Sizzle

Данный плагин предоставляет поддержку движка css селекторов
[Sizzle](http://sizzlejs.com) для RightJS.

<%= partial '/plugins/download', :locals => {:name => 'sizzle'} %>

## Что и зачем, :what

По умолчанию, RightJS поддерживает только стандартные CSS3 селекторы.

Sizzle - это внешняя библиотека для работы с css селекторами, которая
предоставляет несколько дополнительных, нестандартных, но общепринятых
селекторов, вроде `:odd`, `:even`, `:not`, и т.д.

    $('my-table').find('tr:odd');
    $('my-table').find('tr:even');

    $('my-list').first('li:not(*.marked)');

Думаю суть понятна.
