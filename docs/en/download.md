# Download

By default RightJS comes in two files. One of them is the actual core, which works for all the modern browsers,
the other one is a dynamically loadable module with patches for old browsers.

<%= partial 'options' %>

# Two-Files Build Usage Principles

1. Copy both, the core and the old browsers support module files into your javascripts directory next to each other

2. Include the core file in usual way

        <script src="where/it/is/right.js"></script>

3. Don't worry about the olds file, RightJS will automatically load it when needed.

4. Keep the file names in a corresponding way, like that

        right[bla-bla-bla].js
       right-olds[bla-bla-bla].js
        

# Custom Build

By default RightJS comes with several plugins like advanced forms handling, cookies, etc. already baked in.
You can switch the things you don't use off, and reduce the build size down to 18k.

There are also a number of plugins out of the [RightJS Goods](/goods) project that can be embedded into your builds too.

[Custom Build Page](<%= builds_path %>)


# Server-Side Build

RightJS also available as a server-side library. In this case it contains only the
native JavaScript unit extensions, plus the {Class}, {Observer}, {Options} units along
side with all the non-dom utility functions out of the {Util} module.

Our server-side build follows the CommonJS principles and ready to be used with the
[node.js](http://nodejs.org) framework


# GitHub Repository

The original source code of the project is situated at the github account over here

<http://github.com/rightjs/rightjs-core>

`git clone git://github.com/rightjs/rightjs-core.git`


# License

RightJS is an open-source project released under terms of the MIT-License.
