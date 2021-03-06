# Ajaxed Photo Gallery


__NOTE__: This article is meant to describe internal processes and some approaches on an
ajaxed web-application development. If you simply need something that works on rails, try
our official rails plugin for RightJS [right-rails](http://github.com/MadRabbit/right-rails),
it has all the things already implemented and nicely wrapped up.



## The Source Code Download, :source

In this article we will develop a whole RESTful application, not all of it will be published,
but you can grab the full source code of the project at this git-hub repository.

<http://github.com/MadRabbit/right-gallery>

`git clone git://github.com/MadRabbit/right-gallery.git`

It's just a simple ruby-on-rails application, I'm sure you can find out how to fire it up and play with the thing.



## The Strategy, :strategy

There are many ways to implement an ajaxed RESTful application, some of them more simpler than others,
but we will use a kind of mixed approach. We will start with a standard working CRUD controller
and basic functionality and then create a JavaScript wrap up over it.

The target is to implement a transparent ajax functionality the way that the original one was still
available, so that the user could always hit the right mouse button and choose to open the links in
new tab or window or simply give a link for another user to edit or create new pictures in the gallery.

We also aim to make a great deal of the original templates re-usage and javascript code simplicity.

For this demo we will use ruby-on-rails, simply because most of the dynamic language people know
their way around it, or at least familiar with terminology and the way it organizes the things.


## Some Preparations, :preparations

There are might be several ways to organize source code and templates of a ruby-on-rails application
and to have some sort of basis we will start with a standard CRUD controller generated by the rails
scaffold generator.

Then we extract a picture partial out of the `index` template so that we could reuse it in our
scripts generating separated blocks for pictures. The `index` and `_picture` templates should
look something like this

    // index.html.erb
    <h1>Listing pictures</h1>

    <div id="pictures">
      &lt;%= render @pictures %>
    </div>


    // _picture.html.erb
    &lt;% div_for picture do %>
      &lt;%= link_to image_tag(picture.thmb_url), picture.full_url %>

      &lt;%= link_to 'Edit', edit_picture_path(picture) %>
      &lt;%= link_to 'Destroy', picture, :confirm => 'Are you sure?', :method => :delete %>
    &lt;% end %>


We also extract a `_form` partial out of the `new` and `edit` templates, so we could
reuse the form body in ajaxed forms later.

    // new.html.erb
    <h1>New picture</h1>

    &lt;%= render 'form' %>


    // edit.html.erb
    <h1>Edit picture</h1>

    &lt;%= render 'form' %>


    // _form.html.erb
    &lt;% form_for(@picture, :html => {:multipart => :true}) do |f| %>
      &lt;%= f.error_messages %>
      // .....
      <p class="buttons">
        &lt;%= f.submit  f.object.new_record? ? 'Create' : 'Update' %>
      </p>
    &lt;% end %>

Okay, enough with the preparations lets get to the fun part

## Pictures Deleting, :deleting

Lets start with something simple, for example images deleting.

As we decided to go for unobtrusive approach, we will hijack the `delete`
links assign our own `onclick` handler. This way if we get screwed up with something,
the original functionality will back us up.

For the beginning we need to add a css class `delete` to the delete link
in the `_picture` partial, so we could find and process them.

    // _picture.html.erb
    &lt; div_for picture do %>
      ......
      &lt;%= link_to 'Destroy', picture, :class => :delete //...
    &lt;% end %>

Adding such classes is a good practice anyway, it will let you paint those links
with some different color later, maybe add some fancy icon, etc.

Okay now lets highjack the event

    function hijack_links() {
      $$('#pictures a.delete').each(function(link) {
        link.onclick = function(event) {
          event.stop();

          if (confirm("Are you sure?")) {
            Xhr.load(this.href+".js", { method: 'delete' });
          }
        };
      });
    }
    hijack_links();

We use a function so that we could call this code again when we upload new pictures via ajax.

Then we need to add the `.js` format handler to the `destroy` method
in our Rails controller.

    def destroy
      .....
      respond_to do |format|
        ....
        format.js
      end
    end

This will receive our ajax calls and render some piece of javascript that will remove our image.
So we need some template called `destroy.js.erb`

    // destroy.js.erb
    remove_picture(&lt;%= @picture.id %>);


    // index.html.erb
    function remove_picture(id) {
      $('picture_'+id).remove();
    }

We could just write something like `$('picture_&lt;%= @picture.id %>').remove()` in the template
but it's always better to keep all the functionality in one place and work through some sort
of an interface. It will let you grow a simple library and then refactor and improve it separately
without touching any other templates.

Okay, let's move to the next part


## Files Uploading, :uploading

As it is an ajaxed maintenance I would like to have a hidden form for an instant pictures uploading.
For this purpose we simple create a dummy `@picture` variable and render the `_form` partial
right under the `'New picture'` link at the `index` template, and then add the
`onclick` attribute to the link, which will toggle the form

    // index.html.erb
    // .....
    &lt;%= link_to 'New picture', new_picture_path,
      :onclick => "$('new-form-container').toggle('slide'); return false;" %>

    <div id="new-form-container">
      &lt;% @picture = Picture.new %>
      &lt;%= render 'form' %>
    </div>

As the result, when the user clicks the link he will see the form slides in and out, but he will also
be able to call the link context menu, open the address in new tab|window and have access to the
basic maintenance as usual.

Then below those elements we will need a piece of JavaScript code that will convert the form
into a remote form. Conventionally the new picture form in ruby-on-rails will have the
`new_picture` id. So we use it.

    function remotize_form(id) {
      $(id).remotize().enable().action += '.js';
    };
    remotize_form('new_picture');

We created a separated function so that we could reuse it to activate another forms later. And
as all the altering methods in RightJS return back a reference to an object, we can do fancy calls
like `form.remotize().enable().action`.

Then, as you see we altered the form `action` property so that we could have a different format for
ajaxed requests, which we can handle in the rails application controller by adding another format
handler like that

    // PicturesController
    def create
      // ....
      respond_to do |format|
        // ....
        format.js
      end
    end

And finally we create a simple `create.js.erb` file that will render the response of our calls
and generate some JavaScript code that will trigger changes on our page.

It checks if the picture was saved, then generates the new picture thumbnail block and finally rerenders
the picture form. We need this form update anyway, if there were problems then the form will contain
explanations and marks for the issues, if the upload was successful then we will need a new clean form again.

    &lt;% unless @picture.new_record? %>
      insert_picture("&lt;%= escape_javascript(render(@picture)) %>");

      &lt;% @picture = Picture.new # resetting the instance to have a clean form %>
    &lt;% end %>

    replace_form('new_form', "&lt;%= escape_javascript(render('form')) %>");

Once again we defined two proxy functions, one will insert the new image on the page, the other
updates the form. Implementation is really simple.

    function insert_picture(source) {
      $('pictures').insert(source);
      hijack_links();  // find and process the new links
    };

    function replace_form(id, source) {
      $(id).replace(source);
      remotize_form(id);
    };

Okay. This looks simple enough. Two short functions and we are in business.



## Unfortunately It Won't Work, :wont

The problem is that when you have a file field on your form and you initiate a remote submit,
in reality you submit the form through a hidden `iframe` element. And then, when you load
a _javascript_ response in an iframe element, smart IE browsers will nicely offer you to download
the response on your disk, which is obviously not what we need.

Because an IFrame is eventually just another window, the only response that an IFrame can process
correctly is the `text/html` one. And then if we even override the response type in our rails
application it still won't work because an IFrame has it's own context and document.

Solving those things might be tricky and bring quite a mess in your code, but luckily there is
a simple way out.

All you need is to create another simple html layout that will wrap the iframed uploads, like this

    // app/view/layouts/iframed.html.erb
    <html>
      <head>
        <script type="text/javascript">
        // <![CDATA[
          with (self.parent) {
            &lt;%= yield %>
          }
        // ]]>
        </script>
      </head>
    </html>

And then slightly change the `format.js` call in your controller, like this

    def create
      ....
      format.js { render :layout => 'iframed', :content_type => 'text/html' }
    end

The idea is simple. We simply wrap our response script in an html response where
it will get evaluated in the context of the parent window, like if it was an usual Xhr
request and usual JavaScript response.

The reason of doing it this way is simple. This let you keep your javascript response
template consistent with the others and simple, like if you really worked with an XHR requests.
And then you'll have for your self another layout which you can lately reuse for another operations.

Okay, this was the whole trick. After that the uploads will work nicely.



## Pictures Editing, :editing

Lets finish up with the thing by adding an ajax pictures editing functionality. Now
when we know how the things work, there will be no problem.

First we need to add the `edit` css class to our edit links so we could hijack
clicks. Exactly how we did it with the pictures deleting feature.

    // _picture.html.erb
    ....
      link_to 'Edit', edit_picture_path(picture), :class => 'edit', //...


    // index.html.erb
    function hijack_links() {
      // delete links processing in here

      $$("#pictures a.edit").each(function(link) {
        link.onclick = function(event) {
          event.stop();
          Xhr.load(this.href + ".js");
        }
      });
    }

We don't need to touch our controller for generating a GET response for the
`edit` action, we just create the `edit.js.erb` template and
add another function that will handle the things on the page

    // edit.js.erb
    show_edit_form(&lt;%= @picture.id %>, "&lt;%= escape_javascript(render("form")) %>");


    // index.html.erb
    function show_edit_form(id, source) {
      $$('form.edit_picture').each('remove'); // nuking any old forms

      remotize_form(
        $('picture_'+id).insert(source)
          .first('form.edit_picture').show('fade')
      );
    }

The script is simple. It just removes any possibly hanging around old popups.
Then we add the received form source to the picture block, find our form, make
it nicely appear and finally make it remote.

That's all we need to load and show the remote form. Now lets catch the form
submissions, just like we did in the new pictures uploading. We define the `.js`
response handler in the `update` method in our controller

    def update
      ....
      respond_to do |format|
        ....
        format.js   { render :layout => 'iframed', :content_type => 'text/html' }
      end
    end

Then add some simple template called `update.js.erb` and a javascript function
called `update_picture` that will handle the things.

    // update.js.erb
    &lt;% if @picture.valid? %>
      update_picture(&lt;%= @picture.id %>, "&lt;%= escape_javascript(render(@picture))%>");
    &lt;% else %>
      replace_form('edit_picture_&lt;%= @picture.id%>', "&lt;%= escape_javascript(render('form')) %>");
    &lt;% end -%>


    // index.html.erb
    function update_picture(id, source) {
      $('picture_'+id).replace(source);

      hijack_links();
    };

This is pretty much all about it.


## Summary, :summary

That might looked like a bit long article, but if you take a look at the whole thing
you will see how nicely we reused all the original templates and handled all the process
in just a few short and simple JavaScript functions.

We were very unobtrusive didn't wreak the original functionality and now our user
has an option, use the ajax interface or the basic features on separated pages.

And we also had created a simple library of JavaScript functions, that can be evolved
separately.


## The Further Steps, :further

If you download the source code out of the github repository you'll find a complete
application where more things solved like the the Lightbox feature usage, spinners handling,
some more visual effects processing etc.
