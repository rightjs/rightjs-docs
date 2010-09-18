# Ajax Forms

This article covers various questions about working with forms via ajax.

## Sending Forms Via Ajax, :sending

Basically there is just one method you should know to send any sort of forms
via ajax {Form#send}, which in a simple case looks like that

    <form id="my-form" ...>
      // ...
    </form>

    $('my-form').send();

This method does all the routine operations automatically, it grabs the form
attributes, like the `url` and `method`, then collects all the data on the
form, serializes, escapes, then creates an {Xhr} request, sends it, receives
and handles the response. It also will automatically block the form during the
request to the server.

## Marking Forms Remote, :remotize

In many cases you don't need to send a form programmatically, instead of that
you need to mark somehow the form so that it was automatically going via ajax,
no matter when and how it was submitted. For such cases use the method
{Form#remotize}, it will do exactly that.

    $('my-form').remotize();

    $('my-form').submit(); // -> goes via ajax

After this, when the user or your script submits the form in any way, it will
be automatically sent via ajax. To bring the form back and undo the changes,
use the method {Form#unremotize}

    $('my-form').unremotize();

    $('my-form').submit(); // -> goes via http

You also can use the `remote` option when you create your form
programmatically, in this case it will be marked as remote by default

    var form = new Form({remote: true, action: '/url'});

    form.submit(); // -> goes via ajax


## Specifying Options, :options

Ajax forms in RightJS work entirely through the {Xhr} class interface.
Therefore you can use all the same options with the {Form#send} method

    $('my-form').send({
      onSuccess: function() {
        console.log("Succesful", this.text);
      },
      onFailure: function() {
        console.log("Failed", this.text);
      }
    });

And you also can use those options with the {Form#remotize} method, in which
case all your options will be stored internally and then used to send the form
via ajax when someone submits it

    $('my-form').remotize({
      onComplete: function() {
        console.log("Completed", this.getHeaders());
      }
    });

## Spinners Handling, :spinners

The {Xhr} unit in RightJS has a baked in spinners handling feature, so you
simply specify a reference to your spinner element in options and it will be
nicely handled.

    $('my-form').send({
      spinner: 'the-spinner-element'
    });

But in case of ajax forms you don't need to do even that. When you try to
submit a form via ajax, RightJS will check if the form contains an element
with the css-class `spinner` and if finds one will automatically use it
as the current spinner

    <form id="my-form">
      <img src="spinner.gif" class="spinner" />
    </form>

    $('my-form').send(); // uses the 'img.spinner'

## Files Uploading Via Ajax, :uploading

RightJS has a built-in files uploading handling via Ajax. Generally all the
interfaces in this case remain the same, you simply call the {Form#send}
method, but there are some tricky moments that you should keep in mind.

The problem is, that normally you cannot send files via {Xhr} requests,
because `XmlHTTPRequest` objects simply don't support this feature. So, when
you need to submit a form with a file on it, you use a hidden `IFrame` element
instead of an `XmlHTTPRequest` object to send your form to the server.

RightJS does it all automatically in the background, so you don't need to
worry about that, but as we use the `IFrame` element there are some
limitations and tricks.

First of all, the only type of responses from the server that you can use with
`IFrame` elements is plain html. Otherwise, if you say send back a piece of
JavaScript, IE browsers will offer the user to save it on his disk.
Secondly, all your response will be handled in the context of that hidden
frame element. Thirdly any pieces of text or HTML will be transformed by the
browser, which will try to make a normal web-page out of your content.

So, the only type of communication between the server and your script is if
you embed your JavaScript in a simple HTML page layout like that.

    <html>
      <head>
        <script type="text/javascript">
          with (window.parent) {
            // your JavaScript goes in here
          }
        </script>
      </head>
    </html>

The trick is that you send back a normal page that contains a piece of
JavaScript, which gets evaluated in the context of your actual working window.

__NOTE__: as the script will be evaluated automatically by the browser, you
should not specify the `evalScripts` key with your options, otherwise it
will be run twice.

