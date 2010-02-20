# Download

By default RightJS comes in two files. One of them is the actual core, which works 
for all the modern browsers while the other one is a dynamically loadable module 
with patches for old browsers.

<%= partial 'options' %>

# Two-Files Build Usage Principles

1. Copy both the core and the old browsers support module files into your JavaScript
directory.

2. Include the core file as usual:

        <script src="where/it/is/right.js"></script>

3. Don't worry about the olds file, RightJS will automatically load it when needed.

4. Make sure the file names remain as follows:

        right[bla-bla-bla].js
       right-olds[bla-bla-bla].js
        

# Hot Link

As we didn't quite make it to the Google API hosting yet. You can use the hot-links
above to have a common RightJS library connection.

The first link always points to the _latest_ version of RightJS and will get automatically
updated over the time. The second link always points to _that exact_ version of RightJS.



# Custom Build

By default RightJS comes with several plugins like advanced form handling, cookies 
and so on already baked in. You can switch things you don't use off and thus reduce 
the build size down to 18k.

Furthermore, there are a number of plugins from the [RightJS Goods](/goods) project
which can  be embedded into your build as well.

[Custom Build Page](<%= builds_path %>)


# Server-Side Build

RightJS is also available as a server-side library. In this case it contains only the
native JavaScript unit extensions and the {Class}, {Observer}, {Options} units along
with all the non-DOM utility functions from the {Util} module.

Our server-side build follows the CommonJS principles and is ready for use with the
[node.js](http://nodejs.org) framework.


# GitHub Repository

The original source code of the project can be found on Github:

<http://github.com/rightjs/rightjs-core>

`git clone git://github.com/rightjs/rightjs-core.git`


# License

RightJS is an open-source project.

All the source code are released under the terms of the MIT-License.

All the documentation on this site is released under the
[Creative Commons 3](http://creativecommons.org/licenses/by-nc-sa/3.0/) license
