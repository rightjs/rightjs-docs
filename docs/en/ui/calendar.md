# Right Calendar

Right Calendar is the standard calendar/datepicker feature for RightJS

<%= partial '/ui/head', :locals => {:name => 'calendar'} %>

<%= anchors_index %>


## Features List, :features

Right Calendar has the following features:

* Allows to pick dates and times
* Supports multiple months in a greed
* Supports date/time limits
* Can be used as an inline widget
* Can automatically initialize on input fields as a helper
* Tiny (just 6k gzipped) file, no image or css dependencies
* Everything is included in a single file
* i18n support


## Usage Basics, :usage

The usage of Right Calendar is really simple. Just grab the file above, include it on your page and you
are good to go. Right Calendar does not require any images and all the styles are inlined inside the javascript file

    <script src="/javascripts/right-calendar.js" type="text/javascript"></script>

After that you will have the `Calendar` unit available

    new Calendar({format: 'US'}).insertTo('that-element');

    new Calendar({showTime: true}).assignTo('that-input');



## Inputs Auto-Initialization, :initialization

Calendars can automatically initialize on input fields as popup helpers. For that
simply use the standard HTML5 attribute `data-calendar`, like that:

    <input type="text" data-calendar="" />

    <input type="text" data-calendar="{format: 'US'}" />

You also can specify the external trigger element, like an icon.

    <input type="text" id="my-input" />
    <img src="calendar.png" data-calendar="{update: 'my-input'}" />

All the initialization happens on demand when the user starts to interact with the fields


## Options List, :options

There are several options you can pass into the `Calendar` constructor or use with the auto-initialization feature

Name           | Default    | Description
---------------|------------|-------------------------------------------------------------------
format         | 'ISO'      | one of the predefined formats name or a format string
showTime       | null       | a marker if the time picker should be displayed
showButtons    | false      | a marker if the bottom buttons should be displayed
minDate        | null       | the minimum date you can select
maxDate        | null       | the maximum date you can select
fxName         | 'fade'     | the visual effect name, use `null` if you don't want any fx
fxDuration     | 'short'    | the visual effects duration
firstDay       | 1          | 1 for Monday, 0 for Sunday
numberOfMonths | 1          | a number of month to display, or a \[x,y\] months greed definition
timePeriod     | 1          | the time picker min time quantity in minutes
twentyFourHour | null       | a marker if the 24 or 12 hours time picker should be used
listYears      | false      | show the year switching buttons
hideOnPick     | false      | a marker if the popup should get hidden when user picks a date
update         | null       | an input field that should be updated when the user picks a date
trigger        | null       | a trigger element reference for calendar helpers
highlight      | null       | a list of dates to highlight
cssRule        | '\*\[data-calendar\]' | the auto-initializable calendar elements css-rule


You also can alter the `Calendar.Options` object to make the changes global.

The `showTime` and `twentyFourHour` options have `null` value by default, which means that those options
will be automatically determined depending on the specified time format option. You also might specify
a boolean value to enforce those options.


## Dates Formatting, :formatting

Right Calendar uses the
[GNU strftime](http://www.gnu.org/software/libc/manual/html%5Fnode/Formatting-Calendar-Time.html#index-strftime-2660)
formatting system and there are the following placeholders available:

Key | Description
----|------------------------------------------------------------------------
%a  | The abbreviated weekday name ('Sun')
%A  | The  full  weekday  name ('Sunday')
%b  | The abbreviated month name ('Jan')
%B  | The  full  month  name ('January')
%d  | Day of the month (01..31)
%e  | Day of the month without leading zero (1..31)
%m  | Month of the year (01..12)
%y  | Year without a century (00..99)
%Y  | Year with century
%H  | Hour of the day, 24-hour clock (00..23)
%k  | Hour of the day, 24-hour clock without leading zero (0..23)
%I  | Hour of the day, 12-hour clock (01..12)
%l  | Hour of the day, 12-hour clock without leading zero (0..12)
%p  | Meridian indicator ('AM'  or  'PM')
%P  | Meridian indicator ('pm'  or  'pm')
%M  | Minute of the hour (00..59)
%S  | Second of the minute (00..59)
%%  | Literal '%' character

There are also few predefined date formats are available:


Name  | Format     | Example
------|------------|--------------------
ISO   | '%Y-%m-%d' | 2009-08-18
POSIX | '%Y/%m/%d' | 2009/08/18
EUR   | '%d-%m-%Y' | 18-08-2009
US    | '%m/%d/%Y' | 08/18/2009


## Events List, :events

Right calendar supports the following list of events

Name   | Description
-------|-------------------------------------------------
show   | the calendar element was shown
hide   | the calendar element was hidden
change | user selects a date or time
done   | user hits the 'done' button

You can use any standard {Observer} methods to process those events. Shortcuts like `onChange`,
`onDone` are also available.


## API Reference, :api

Right Calendar has all the same API as {Element} plus the following methods:

Method                      | Description
----------------------------|----------------------------------------------------------------------
setDate(date)               | sets the date, the date might be a Date instance or a String
getDate()                   | returns the current date
setValue(String date)       | sets the date by a string value
getValue()                  | returns the date as a formatted string
format(\[String format\])   | returns a string representation of the current date
assignTo(element\[,trigger\]) | assigns the calendar to auto appear at the element; if the trigger is specified a calendar will appear only by clicking on the trigger element


## Style Alterations, :styles

If you need to alter the calendar view to make it fit your design, please use the following
elements structure description as a guidance.

    <div class="rui-calendar rui-panel">
      <div class="swaps">
        <div class="rui-button next-month">&lsaquo;</div>
        <div class="rui-button prev-month">&rsaquo:</div>
      </div>

      <table class="greed">
        <tr><td>

          <table class="month">
            <caption>January</caption>
            <thead><tr>
              <th>Mo<th>Tu<th>...
            </tr></thead>
            <tbody>
              <tr>
                <td class="blank">
                <td class="selected">
                <td class="disabled">
                <td class="highlighted">
                <td><td><td><td>...
              .....
            </tbody>
          </table>

        </td></tr>
      </table>

      <div class="timepicker">
        <select></select> : <select></select>
      </div>

      <div class="buttons">
        <div class="rui-button">Now</div>
        <div class="rui-button">Done</div>
      </div>
    </div>
