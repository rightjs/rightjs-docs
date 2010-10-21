# Table Wrapper

Table plugin is a tables specific dom-wrapper for RightJS, it introduces the
new `Table` class, which has several additional tables related methods and
allow you to sort tables by columns.

<%= partial '/plugins/download', :locals => {:name => 'table'} %>

## Tables Sorting, :sorting

If you need sortable tables in your app, there is nothing simpler than that.
Just include one of the files above onto your page, and mark your header
columns like that

    <table>
      <tr>
        <th class="sortable">Name</th>
        <th class="sortable numeric">Price</th>
        ....
      </tr>
      ...
    </table>

That's all it takes. As you can see you can use normal `text` kinds of
sortables and also you can mark some columns to be sorted as `numeric` data.

__NOTE__: to make it working, you have to use `TH` tags so that the script
could understand that this is a header element the user interacts with.


## Live Example, :example
<% content_for :modules, javascript_include_tag('/builds/plugins/right-table.js') %>
<style type="text/css">
  table th.sortable {
    cursor: pointer;
  }
  table th span.sort-marker {
    color: #444;
    margin-left: .5em;
  }
</style>

A simple live example of sortable tables. We have some integers in here, some
textual data, some dashed floats and some html content as well.

<p>
  <table>
    <tr>
      <th class="sortable numeric">ID</th>
      <th class="sortable">Name</th>
      <th class="sortable numeric">Price</th>
      <th class="sortable">Description</th>
    </tr>
    <tr>
      <td>1</td>
      <td>Banana</td>
      <td>1-11</td>
      <td><em>Bana</em>n<strong>a</strong></td>
    </tr>
    <tr>
      <td>2</td>
      <td>Apple</td>
      <td>1-01</td>
      <td><em>A</em><strong>ppl</strong>e</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Orange</td>
      <td>1-10</td>
      <td><em>Or</em>a<u>ng</u>e</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Apricot</td>
      <td>2-00</td>
      <td><u>Ap</u>r<em>ic</em>ot</td>
    </tr>
  </table>
</p>

## API Reference, :api

This plugin introduces the `Table` class into the system. And as any other
dom-wrapper, you can use it directly to create your tables programmatically

    var table = new Table({id: 'my-table'})
      .insertTo(document.body)
      .addClass('pretty-table');

or, you can just access your tables in any usual way

    $('my-table'); // -> Table

In any case your tables will be dynamically type casted to the `Table` class
instances, which are inherited from the {Element} class

    var table1 = new Table({id: 'my-table'});
    var table2 = $('my-table');

    table1 instanceof Table; // -> true
    table2 instanceof Table; // -> true

    table1 instanceof Element; // -> true
    table2 instanceof Element; // -> true

`Table` class also provides you with some additional methods

Name     | Description
---------|--------------------------------------------------------------
sort(column\[, order\[, type\]\]) | sorts the table by a column
rows()   | returns an array of data rows (without headers and footers)
header() | returns an array of table's header rows
footer() | returns an array of table's footer rows

`Table#sort` method, except of the column index, can receive the `order`
argument, which can be either `'asc'` or `'desc'`.

And it also takes the third `type` argument that specify the algorithm used to
sort the data. It can be one of the following:

* `'text'` (default) - to sort the column as usual text
* `'numeric'` - to sort the column as numeric data
* any other function to hook your own algorithms

## Options List, :api

There is also a bunch of options available via the `Table.Options` object or
with a standard `data-table` attribute as you do with UI widgets.

Name       | Default | Description
-----------|--------------|-----------------------
ascMarker  | '&#x25BC;' | asc marker content
descMarker | '&#x25B2;' | desc marker content
algorithm  | 'text'         | default sorting algorithm 'text' or 'numeric'
order      | 'asc'          | default order 'asc' or 'desc'

That's pretty much it