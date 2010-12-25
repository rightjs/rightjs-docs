# Dialog Widget

Dialog is a standard dialog widgets solution for RightJS

<%= partial '/ui/head', :locals => {:name => 'dialog'} %>

<%= anchors_index %>


## Features List, :features

* Works with any HTML content
* Works with ajax requests
* Provides standard Alert, Confirm and Prompt dialogs
* It can be dragged around the window
* It can be expanded to the window-wide mode
* Supports i18n modules
* Everything in a small (3.6k gzipped) file


## Usage Basics, :usage

There is nothing really special about this widget, it's all simple and
predictable. Just include on of the files above on your page and start making
your dialogs.

    new Dialog({
      title: 'Hello World!',
      html:  'Here I come!'
    }).show();

    // or like that
    new Dialog()
      .title('Hello World!')
      .html('Here I come!')
      .show();

Dialogs have most of the content related methods from the {Element} API
overloaded so they bypass the data right into the body block

    new Dialog()
      .html('Hi there!')
      .update('A new one!')
      .load('/some/url.html');

Just use them as nothing happened


## Standard Dialogs, :standard

This dialog widget comes with several standard dialog types already baked in.
We have your normal alerts

    new Dialog.Alert()
      .html("You're done!")
      .onOk(function() {
        console.log("I'm done");
      })
      .show();

Then we have the standard confirmation dialog

    new Dialog.Confirm()
      .html("Are you sure?")
      .onOk(one_callback)
      .onCancel(anotehr_callback)
      .show();

And we also have the prompts dialog, which can take some additional options

    new Dialog.Prompt({label: 'Enter your name'})
      .onOk(function() {
        console.log("Your name is: " + this.input.value());
      }).show();

And you also can specify all sorts of options for the {Input} field

    new Dialog.Prompt({
      label: 'Enter the password',
      input: {
        type:  'password',
        value: 'secret'
      }
    })
    .onOk(process_the_input)
    .show();

You can use anything you like, textareas, selectboxes and so one.


## Options List, :options

There is a number of options the `Dialog` instances support

Name       | Default | Description
-----------|-------|---------------------------------------------------------
lockScreen | true  | if you need it to lock the screen
fxDuration ' 'short' | dialog block appearance fx duration
draggable  | true  | allows the user to drag the dialog around
closeable  | true  | allows the user to close the dialog
expandable | false | show the user to expand/collapse the dialog window wide
showHelp   | false | show the 'Help' button
showIcon   | null  | `null` or some text to be show in the dialog body icon
title      | null  | default title to preset
html       | null  | html content to set on instance
url        | null  | url address that should be loaded on instance

The `Dialog.Prompt` class also supports two additional options

* `label` - the label above the input field
* `input` - the input field options (see {Input})


## Events List, :event

There is also a number of events that you can hook to your dialogs

Name     | Description
---------|---------------------------------------------------
ok       | when the `Ok` button was pressed
cancel   | when the user dismisses the dialog in any way
help     | when the `Help` button was pressed
expand   | when the user expands the dialog window-wide
collapse | when the user collapses the dialog from the window-wide mode
resize   | when the dialog gets resized
load     | when the dialog receives some content via ajax


## API Reference, :api

Basically `Dialog` unit is a subclass of {Element} class and has all the same
methods, but we have some new ones as well, plus some of the content
management methods were changed a bit

Name                 | Description
---------------------|------------------------------------------------------
show()               | inserts the dialog into the document and shows it
hide()               | hides the dialog and removes it out of the document
resize(\[size\])     | changes the size of the dialog and centers its position
title(\[text\])      | a method that sets/gets the title of the dialog
update(content)      | bypasses the content to the body element
html(\[content\])    | tunnels everything to the body element
load(url\[, options\]) | loads data into the body element via ajax
expand()             | expands the dialog window-wide
collapse()           | collapses the dialog back from the window-wide mode


## Style Alterations, :styles

Use the following basic HTML structure description if you need to alter
any styles

    <div class="rui-dialog">
      <div class="rui-dialog-head">
        <div class="icon"></div>
        <div class="title">...</div>

        <div class="tools">
          <div class="expand">&equiv;</div>
          <div class="close">&times;</div>
        </div>
      </div>

      <div class="rui-dialog-body">
        Your content in here
      </div>

      <div class="rui-dialog-foot">
        <div class="rui-button help">Help</div>
        <div class="rui-button ok">Ok</div>
        <div class="rui-button cancel">Cancel</div>
      </div>
    </div>

The standard dialogs like Alert, Confirm and Prompt will also receive
additional classes like `rui-dialog-alert`, `rui-dialog-confirm` and
`rui-dialog-prompt` so you can paint them separately.