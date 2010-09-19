# Демо сортируемых списков
<%= partial 'scripts' %>

Несколько примеров использования виджета [сортируемых списков](/ui/sortable)

## Вертикальный список, :vertical

<p>
  <ul class="sortable" data-sortable="">
    <li>Item #1</li>
    <li>Item #2</li>
    <li>Item #3</li>
    <li>Item #4</li>
    <li>Item #5</li>
  </ul>
</p>

## Горизонтальный список, :horizontal

<p>
  <ul class="sortable horizontal" data-sortable="">
    <li>Item #1</li>
    <li>Item #2</li>
    <li>Item #3</li>
    <li>Item #4</li>
    <li>Item #5</li>
  </ul>
</p>

## Связанные списки, :linked

<p>
  <ul class="sortable" id="list-1" data-sortable="{accept: 'list-2'}">
    <li>Item #1</li>
    <li>Item #2</li>
    <li>Item #3</li>
    <li>Item #4</li>
    <li>Item #5</li>
  </ul>

  <ul class="sortable" id="list-2" data-sortable="{accept: 'list-1'}">
    <li>Item #1</li>
    <li>Item #2</li>
    <li>Item #3</li>
    <li>Item #4</li>
    <li>Item #5</li>
  </ul>
</p>


## Удаленный список, :remote

<p>
  <ul class="sortable" data-sortable="{url: '%{id}/move.html', Xhr: {evalScripts: true}}">
    <li id="item_1">Item #1</li>
    <li id="item_2">Item #2</li>
    <li id="item_3">Item #3</li>
    <li id="item_4">Item #4</li>
    <li id="item_5">Item #5</li>
  </ul>
</p>
<p>
  <div id="moving-status"></div>
</p>
