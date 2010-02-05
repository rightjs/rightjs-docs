# Supported Browsers

RightJS is meant to be working with all modern as well as some old browsers still in use.

It was tested to work with the following browsers

<%= partial 'browsers' %>

## Quirks Mode

To make RightJS work correctly with styles and dimensions on Internet Explorer and Opera
browsers you have to specify the document type description on your page. For example:

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">

For more details about available DTDs, please visit [the wiki page](http://en.wikipedia.org/wiki/Quirks_mode)

RightJS has no intention to fix the nonstandard quirks mode behavior.

## The Old Browsers

RightJS tries to concentrate its efforts on modern browsers. While it provides basic
support for browsers like IE 6 and Konq 3, such old browsers have low priority when it
comes to performance optimization and specific browser problems patching.

## Internet Explorer 8

IE 8 has native support for CSS selectors. For a correct XHTML document this interface is
usually available by default, however, if you use hacks and non-standards you might need
to specify the following tag in your document header:
    
    <meta http-equiv="X-UA-Compatible" content="IE=8" />

Otherwise, the interface will not be available and RightJS will use its own manual CSS
selectors engine.
