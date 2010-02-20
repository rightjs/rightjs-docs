# Uploader

`Uploader` is a simple form uploading progress widget for RightJS

<%= partial '/ui/head', :locals => {:name => 'uploader'} %>

<%= anchors_index %>

## Features List, :features

* Super easy usage
* Pure HTML/CSS based design
* Everything in a tiny (2.5k) single file

## Server-Side Configuration, :server

This script is designed to work with standard web-server modules, for more
information on how to install and configure them, please take a look
by the following links

* [Apache](http://drogomir.com/blog/2008/6/18/upload-progress-bar-with-mod_passenger-and-apache)
* [Lighttpd](http://upload.lighttpd.net)
* [Nginx](http://wiki.nginx.org/NginxHttpUploadProgressModule)


## Usage Basics, :usage

The usage of the script is super easy, all you need is to include this script
on your page and add the `with-progress` css-class to your form.

    <script src=".../right-uploader.js"></script>
    
    <form class="with-progress" ...>
      ....
    </form>

That's all it takes. After that the script will automatically build a progress
bar widget at the _bottom_ of your form and show it when the form is submitted
in any way.

If you need the progress bar to be in any other place on your form or have
additional styles, you can create the progress-bar element manually where and
how you want it

    <form class="with-progress">
      <div class="right-progress-bar"></div>
      
      <p>
        <input type="file" name="picture" />
        <input type="submit" value="Send" />
      </p>
    </form>
    
You can either create it empty or with some standard content as described
in the [style alterations](#styles) section. In any case the script will find
it and use as the uploading progress bar widget.

And finally you can create uploaders programmatically by using the `Uploader`
class

    var uploader = new Uploader('my-form', {
      timeout: 400,
      onError: function() {
        alert("Oh shizzel!");
      }
    });


## Options List, :options

There is the following simple list of options, which you can use in any
standard for RigthJS way: by altering them globally at the `Uploader.Options`
variable, with the `Uploader` class constructor, or by specifying a custom
form element attribute named `data-uploader-options`

Name        | Default          | Description
------------|------------------|----------------------------------------------
url         | '/progress'      | Url where to ask for the uploading status
param       | 'X-Progress-ID'  | The uploading ID parameter name
timeout     | 1000             | Timeout in ms between status updates
round       | 0                | How many numbers after coma should be left
fxDuration  | 400              | The status update fx duration. Set to `0` to switch it off
formCssRule | '.with-progress' | Css-rule that identifies a form with progress bar


## Events List, :events

This script handles the following list of events

Name   | Description
-------|--------------------------------------------------------
start  | when uploading is started
update | when a status update was received
finish | when uploading is _successfully_ finished
error  | when uploading was interrupted _with an error_

All listeners will receive an object (hash) of the status data received
from the server.


## Style Alterations, :styles

Uploader is a really simple widget that has the following structure:

    <div class="right-progress-bar">
      <div class="bar"></div>
      <div class="num">0%</div>
    </div>

If an uploading was interrupted with an error this element will also receive
the `right-progress-bar-failed` css-class.







