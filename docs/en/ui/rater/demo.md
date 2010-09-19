# Rater Demo
<% content_for :modules, javascript_include_tag('/builds/ui/right-rater.js') %>

There are some basic use-cases for the [Rater](/ui/rater) widget out of the [RightJS UI](/ui) library.

## Simple Raters, :simple

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

## Disabled Raters, :disabled

<p>
  <div class="rui-rater" data-rater="{disabled:true}">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  This rater is disabled
</p>
<p>
  <div class="rui-rater" data-rater="{disableOnVote:true}">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  This rater will get disabled once you click on it
</p>

## Assigned Rater, :assigned

<p>
  <div class="rui-rater" data-rater="{update:'the-field'}">
    <div class="active">&#9733;</div>
    <div class="active">&#9733;</div>
    <div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>
  <input type="text" id="the-field" size="1" value="2" />
</p>

## Remote Rater, :remote

<p>
  <div class="rui-rater" data-rater="{url:'test', Xhr:{evalScripts:true,spinner:'rate-spinner'}}">
    <div class="active">&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div><div>&#9733;</div>
  </div>

  <%= image_tag 'spinner.gif', :id => 'rate-spinner', :style => "display:none" %>
  <span id="remote-rater-output"> </span>
</p>

## Automatically Generated Raters, :generated

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
