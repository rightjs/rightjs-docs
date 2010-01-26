# Documentation Structure

Some notes on the documentation organization on the site.

All the files are separated by language in the folders like `en/`, `ru/`.
Inside of every folder all the files and directories repeat the urls structure,
so if you're looking for a page `/goods/drag-n-drop/demo`, you need the file
`en/goods/drag-n-drop/demo.md`

There are also partial templates, that represent common pieces of text
for all the languages. For example HTML code of examples, common structures, etc.

Every partial template is situated inside of the `com/` directory in a sub-directory
that has the same name as the page it belongs to. For example the `browsers` partial
on the `/browsers` page is in the file called `com/browsers/_browsers.html.erb`

## RightJS Core API

The RightJS Core api-documentation is situated inside of the `en/docs/` directories
and repeat the packages/files structure of the core source code.


## Formatting

We use a slightly modified [Markdown](http://maruku.rubyforge.org/markdown_syntax.html)
syntax. It's basically the good old Markdown, but with the `erb` features support, so
when you see things like `<%= .... %>`, just leave them alone.


## Method Descriptions

When you describe an unit in the `docs/` folder, please keep it's description in
the following order, so it could be programmatically parsed out later

1. H1 header with the unit name
2. Basic description of the unit
3. List of the methods in the following format (the order doesn't matter)
   
   --------------------------------------
   \#\#\# \#methodName (or '.methodName' for class level methods)
   
       method(semantic) -> result
   
   Method description in here
   
       some(example, code)
   
   --------------------------------------

## Unit Cross-References

And we use the RDoc style cross-references. For example markers like `{String#trim}`
will be transformed into a link to the `String` class and its method `trim`. Use
`#` symbol for instance methods and `.` for class methods/properties.

All the documentation will be programmatically transformed later, so please,
use those markers instead of direct links.


## Cross-Page Links

All the pages have their own links space inside of the language they belong to.
Please use absolute paths to refer certain pages, like `/download`, `/docs`,
`/ui/calendar`, etc.


## Headers usage

In the documentation we use three types of headers in the following way

* H1 (#) for the very first header as a whole document header
* H2 (##) is used as a plain text documentation chapters
* H3 (###) is used as a method description header

You also can create standard `H2` headers with anchors like that

    ## Header Text, :anchor

Please, keep the headers clean, because they will be programmatically processed later




