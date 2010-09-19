# Демо рейтинга
<% content_for :modules, javascript_include_tag('/builds/ui/right-rater.js') %>

Несколько простых примеров использования виджета [рейтинг](/ui/rater) из библиотеки [RightJS UI](/ui).

## Простые рейтинги, :simple

<p>
  <div class="rui-rater">
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="rui-rater">
    <div class="active">&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="rui-rater">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="rui-rater">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="rui-rater">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="rui-rater">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
  </div>
</p>


## Блокируемые рейтинги, :disabled

<p>
  <div class="rui-rater" data-rater="{disabled:true}">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  этот рейтинг заблокирован
</p>
<p>
  <div class="rui-rater" data-rater="{disableOnVote:true}">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  этот рейтинг заблокируется как только вы выберете значение
</p>

## Назначенный рейтинг, :assigned

<p>
  <div class="rui-rater" data-rater="{update:'the-field'}">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  <input type="text" id="the-field" size="1" value="2" />
</p>

## Удаленный рейтинг, :remote

<p>
  <div class="rui-rater" data-rater="{url:'test', Xhr:{evalScripts:true,spinner:'rate-spinner'}}">
    <div class="active">&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>

  <%= image_tag 'spinner.gif', :id => 'rate-spinner', :style => "display:none" %>
  <span id="remote-rater-output"> </span>
</p>

## Программно сгенерированные рейтинги, :generated

<div id="auto-generated"> </div>
<script type="text/javascript">
// <![CDATA[
  6..times(function(i) {
    new Rater({
      halfs: true, value: i
    }).insertTo($E('p').insertTo('auto-generated'));
  });
// ]]>
</script>

<div style="height: 10em"> </div>
