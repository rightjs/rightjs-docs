# Tooltips

Right tooltips is the native tooltips feature for RightJS.

<%= partial '/ui/head', :locals => {:name => 'tooltips'} %>

<%= anchors_index %>


## Usage Basics, :usage

There is nothing special about it. You just include the source file

    <script src="/javascripts/right-tooltips.js"></script>

Then specify the `rel="tooltip"` attribute on your elements where
you want the tooltips to appear and RightJS will generate them when the
page is loaded

## Options List, :options

There are some options you can customize

Name       | Default    | Description
-----------|------------|-----------------------------------------------------------------
fxName     | 'fade'     | the appearance fx name
fxDuration | 400        | the visual effect duration
delay      | 400        | the tooltip appearance delay
idSuffix   | '-tooltip' | the tooltip ids suffix
cssRule    | '\[rel=tooltip\]' | automatically initializeable tooltips rule
move       | true       | a marker if the tooltip should be moving with the mouse

In order to change the options alter the `Tooltip.Options` object, like this

    $ext(Tooltip.Options, {
      delay: 200,
      fxname: null
    });


## Style Adjustments, :styles

The tooltip elements have the following simple structure

    <div class="right-tooltip">
      <div class="right-tooltip-container">
        // your data is here
      </div>
    </div>

If the original element has an `id` attribute then related tooltip will have similar id with the `-tooltip`
suffix, so that you could style it separately if you need.
