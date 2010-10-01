# Plugins Index


RightJS Plugins is a subproject of RightJS that contains officially supported common use extensions
for RightJS

All the source code of the project is available under terms of the MIT license at the
github service.

<http://github.com/rightjs/rightjs-plugins>

`git clone git://github.com/rightjs/rightjs-plugins.git`

You can include any of the following modules as separated files on your page, or you
can include them in the main build at the [custom builds page](<%= builds_path %>)

<%
@module_descriptions = {

  :rails    => "Provides a conventional ajax operations interface and RightJS core "+
               "extensions with underscored and ruby-like aliases.",

  :dnd      => "The standard drag-and-drop library for RightJS",

  :effects  => "By default RightJS comes with a basic Fx engine and a few most used visual "+
                "effects. This module contains a library of all the additional visual effects.",

  :json     => "This module provides the standard JSON import/export feature. Additionally "+
               "when included it provides better JSON responses check for the {Xhr} module and "+
               "also an ability to save and retrieve objects and arrays in the {Cookie} module transparently.",

  :jquerysh => "This plugin changes the `$()` function behavior to the one the jQuery users used to",

  :sizzle   => "Sizzle CSS selectors engine support for RightJS"
}
%>

<%= partial 'unit', :collection => plugins_list %>
