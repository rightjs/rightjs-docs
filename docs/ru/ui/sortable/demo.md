# Демо сортируемых списков
<%= partial 'scripts' %>

Несколько примеров использования виджета [сортируемых списков](/ui/sortable)

## Вертикальный список, :vertical

<p>
  <ul class="sortable" data-sortable="">
    <li>Элемент №1</li>
    <li>Элемент №2</li>
    <li>Элемент №3</li>
    <li>Элемент №4</li>
    <li>Элемент №5</li>
  </ul>
</p>

## Горизонтальный список, :horizontal

<p>
  <ul class="sortable horizontal" data-sortable="">
    <li>Элемент №1</li>
    <li>Элемент №2</li>
    <li>Элемент №3</li>
    <li>Элемент №4</li>
    <li>Элемент №5</li>
  </ul>
</p>

## Связанные списки, :linked

<p>
  <ul class="sortable" id="list-1" data-sortable="{accept: 'list-2'}">
    <li>Элемент №1</li>
    <li>Элемент №2</li>
    <li>Элемент №3</li>
    <li>Элемент №4</li>
    <li>Элемент №5</li>
  </ul>

  <ul class="sortable" id="list-2" data-sortable="{accept: 'list-1'}">
    <li>Элемент №1</li>
    <li>Элемент №2</li>
    <li>Элемент №3</li>
    <li>Элемент №4</li>
    <li>Элемент №5</li>
  </ul>
</p>


## Удаленный список, :remote

<p>
  <ul class="sortable" data-sortable="{url: '%{id}/move.html', Xhr: {evalScripts: true}}">
    <li id="item_1">Элемент №1</li>
    <li id="item_2">Элемент №2</li>
    <li id="item_3">Элемент №3</li>
    <li id="item_4">Элемент №4</li>
    <li id="item_5">Элемент №5</li>
  </ul>
</p>
<p>
  <div id="moving-status"></div>
</p>


## Специальный список с хэндлерами, :custom

<p>
  <ul class="sortable" id="custom" data-sortable="{itemCss:'li.item', handleCss: 'div.handle'}">
    <li class="nothing"></li>
    <li class="item">Элемент №1 <div class="handle">&equiv;</div></li>
    <li class="item">Элемент №2 <div class="handle">&equiv;</div></li>
    <li class="item">Элемент №3 <div class="handle">&equiv;</div></li>
    <li class="item">Элемент №4 <div class="handle">&equiv;</div></li>
    <li class="item">Элемент №5 <div class="handle">&equiv;</div></li>
    <li class="nothing"></li>
  </ul>
</p>
