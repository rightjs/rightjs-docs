# Supported Browsers

RightJS is meant to be working with all modern as well as some old browsers still in use.

It was tested to work with the following browsers

<%= partial 'browsers' %>

## Quirks Mode

To make RightJS work correctly with styles and dimensions on Internet Explorer and Opera
browsers you have to specify the document type description on your page. For example:

    <!DOCTYPE html>

For more details about available DTDs, please visit [the wiki page](http://en.wikipedia.org/wiki/Quirks_mode)

RightJS has no intention to fix the nonstandard quirks mode behavior.

## The Old Browsers

RightJS tries to concentrate its efforts on modern browsers. While it provides basic
support for browsers like IE 6 and Konq 3, such old browsers have low priority when it
comes to performance optimization and specific browser problems patching.
