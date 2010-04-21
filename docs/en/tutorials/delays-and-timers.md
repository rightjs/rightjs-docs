# Delays And Timers
<% set_unit_scope('Function') %>

There are several additional features, which will help you to deal with
various delays and periodical calls. Basically those are wraps over the native
`window.setInterval` and `window.setTimeout` functions that will let you write
nicer and easier to read and support code.

## Creating Delays, :create

There is nothing simpler than creating delayed and periodical calls in
RightJS. For this purpose the {Function} unit has two methods {#delay} and
{#periodical}, so whenever you have a function you can call those methods
with a delay in milliseconds and you're good to go

    var callback = function() {
      // .....
    };
    
    // delay the call at 1 second
    callback.delay(1000);
    
    // call it periodically every 2 seconds
    callback.periodical(2000);

You also can use carrying with your delays and periodical calls

    var timer = function(message) {
      console.log(message);
    };
    
    timer.delay(100, '100 ms passed');
    timer.delay(200, '200 ms passed');
    timer.delay(300, '300 ms passed');

In this case RightJS will call the callback function in the given time with
given arguments, which in some cases is extremely useful

## Canceling Delays, :cancel

The same way as `window.setInterval` and `window.setTimeout`, {#delay} and
{#periodical} methods return markers, which you can use to cancel the
delayed or periodical calls.

    var marker = my_function.delay(100);
    
    window.clearTimeout(marker);
    
    var marker = my_function.periodical(100);
    
    window.clearInterval(marker);

But in RightJS markers are also objects and have nice methods to cancel delays
and stop periodical calls, like that:

    var timer = my_function.delay(100);
    
    timer.cancel();
    
    var timer = my_function.periodical(100);
    
    timer.stop();

This way it is much more readable and easier to handle.
