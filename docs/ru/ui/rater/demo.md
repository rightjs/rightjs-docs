# Демо рейтинга
<% content_for :modules, javascript_include_tag('/builds/ui/right-rater-min.js') %>

Несколько простых примеров использования виджета [рейтинг](/ui/rater) из библиотеки [RightJS UI](/ui).

## Простые рейтинги, :simple

<p>
  <div class="right-rater">
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="right-rater">
    <div class="right-rater-glow">&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="right-rater">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="right-rater">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="right-rater">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div><div>&#9733;</div>
  </div>
</p>
<p>
  <div class="right-rater">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
  </div>
</p>


## Блокируемые рейтинги, :disabled

<p>
  <div class="right-rater" data-rater-options="{disabled:true}">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  этот рейтинг заблокирован
</p>
<p>
  <div class="right-rater" data-rater-options="{disableOnVote:true}">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  этот рейтинг заблокируется как только вы выберете значение
</p>

## Назначенный рейтинг, :assigned

<p>
  <div class="right-rater" data-rater-options="{update:'the-field'}">
    <div class="right-rater-glow">&#9733;</div>
    <div class="right-rater-glow">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  <input type="text" id="the-field" size="1" value="2" />
</p>

## Удаленный рейтинг, :remote

<p>
  <div class="right-rater" data-rater-options="{url:'test', Xhr:{evalScripts:true,spinner:'rate-spinner'}}">
    <div class="right-rater-glow">&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
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