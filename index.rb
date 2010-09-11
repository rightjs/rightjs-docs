#!/usr/bin/env ruby

#
# This is a simple Sinatra app to work with the documentation
#
# Installation:
#   sudo gem install sinatra maruku json
#
# Fire up:
#   ./index.rb
#
# Browse:
#   http://localhost:3000
# 
# Copyright (C) 2010 Nikolay V. Nemshilov aka St.
#

require 'rubygems'
require 'sinatra'
require 'maruku'
require 'json'

set :port,        3000
set :sessions,    true
set :views, Proc.new { File.join(root, "docs") }

GOODS_LIST = %w{json effects events behavior dnd rails}
UIS_LIST   = %w{autocompleter calendar tabs rater slider selectable sortable lightbox tooltips in-edit uploader resizable colorpicker}
API_PACKS  = %w{core dom fx lang util}

LANGUAGES  = %w{
  Ruby
  Python
  Java
  JavaScript
  Scala
  Haskell
  Lisp
  Lua
  Perl
  Prolog
}

Sinatra::Templates.instance_eval do
  RIGHTJS_TICKETS_TRACKER_URL = 'http://tickets.com'
  RIGHTJS_VERSION             = "1.5.4"
  class PagesController
    LANGUAGES = LANGUAGES
  end
end

helpers do
  def image_tag(path, options={})
    "<img src=\"http://rightjs.org/images/#{path}\"#{options.collect{|k,v| " #{k}=\"#{v}\""}.join('')} />"    
  end
  
  def link_to(text, url, options={})
    "<a href='#{url}'#{options.collect{|k,v| " #{k}=\"#{v}\""}.join('')}>#{text}</a>"
  end
  
  def menu_link_to(*args)
    "<li>#{link_to(*args)}</li>"
  end
  
  def javascript_include_tag(*args)
    args.collect{ |path|
      "<script type='text/javascript' src='http://rightjs.org#{path}'></script>"
    }.join("\n")
  end
  
  def stylesheet_link_tag(*args)
    args.collect{ |path|
      "<link rel='stylesheet' type='text/css' href='http://rightjs.org/stylesheets/#{path}.css' />"
    }.join("\n")
  end
  
  def content_for(name, content)
    @content_for ||= {}
    @content_for[name] ||= ''
    @content_for[name] += "\n"+ content
  end
  
  def check_box_tag(name, value, checked=nil)
    "<input type='checkbox' name='#{name}' id='#{name.gsub('[','_').gsub(']', '')
      }' value='#{value}'#{' checked="true"' if checked} />"
  end
  
  def label_tag(key, name)
    "<label for='#{key}'>#{name}</label>"
  end
  
  def builds_path
    "/builds"
  end
  
  def custom_builds_path
    "http://rightjs.org/builds/custom"
  end
  
  def tutorial_path(name)
    "/tutorials/#{name}"
  end
  
  def goods_list
    GOODS_LIST.collect do |key|
      {
        :key  => key.to_sym,
        :name => key.capitalize,
        :url  => "/goods/#{key}"
      }
    end.sort_by{|i| i[:name]}
  end
  
  def ui_list
    UIS_LIST.sort.collect do |key|
      {
        :key  => key.to_sym,
        :name => key.capitalize,
        :url  => "/ui/#{key}"
      }
    end.sort_by{|i| i[:name]}
  end
  
  def goods_modules_menu
    "<ul>\n"+
      goods_list.collect{ |obj| "<li><a href=\"#{obj[:url]}\">#{obj[:name]}</a></li>" }.join("\n")+
    "</ul>"
  end
  
  def ui_modules_menu
    "<ul>\n"+
      ui_list.collect{ |obj| "<li><a href=\"#{obj[:url]}\">#{obj[:name]}</a></li>" }.join("\n")+
    "</ul>"
  end
  
  def right_js_classes_menu
    "<ul>"+
      API_PACKS.collect{ |package|
        "<li><b>#{package.capitalize}</b></li>\n"+
        "<ul>\n"+
          Dir.new("docs/#{@lang}/docs/#{package}").entries.select{ |e| e != '.' && e != '..'}.collect { |file|
            name = file.gsub /\.md$/, ''
            "<li><a href='/docs/#{package}/#{name}'/>#{name.capitalize}</a></li>"
          }.join("\n")+
        "</ul>"
      }.join("\n")+
    "</ul>"
  end
  
  def set_unit_scope(name)
    @unit = name
  end
  
  def contact_email
    "<a href='mailto:info@rightjs.org'>info@rightjs.org</a>"
  end
  
  def chapter(name, key)
    "<h2>#{name}, :#{key}</h2>"
  end
  
  def anchors_index
    "<h2>Index will be here</h2>"
  end
  
  def partial(name, *args)
    if name[0,1] == '/'
      els = name.split('/')
      els[els.size-1] = "_"+els.last
      filename = "com#{els.join('/')}.html"
    else
      filename = "com/#{@path}/_#{name}.html"
    end
    
    if args.first && args.first[:collection]
      args.first[:collection].collect{ |value|
        args.first[:locals] = {}
        args.first[:locals][name.split('/').last.to_sym] = value
        erb filename.to_sym, *args
      }.join("\n")
    else
      erb filename.to_sym, *args
    end
  end
end

#
# Internationalized strings mock up
#
class String
  def t
    self.split('.').last
  end
  
  def underscore
    self.gsub('-', '_')
  end
end

#
# Patched maruku parser
#
class Shmaruku < Maruku
  def self.to_html(string) 
    self.new(string.gsub(/\{([a-z\.#]+)\}/im, "#{KEY}\\1#{KEY}")).to_html
  end
  
  def to_html
    html = super
    PATCHES.each{ |patch| html.gsub! *patch }
    html
  end

protected

  KEY     = "OH THIS TIME IM REALLY GONNA GET YA"
  PATCHES = [
    ['&#39;',                          "'"            ],
    ['&quot;',                         '"'            ],
    [/<h(\d)\sid='(.+?)'>/,            '<h\1>'        ],
    ['code>',                          'tt>'          ],
    ['<pre><tt>',                      '<code>'       ],
    ['</tt></pre>',                    '</code>'      ],
    ["<td style='text-align: left;'>", '<td>'         ],
    ["&amp;lt;",                       '&lt;'         ],
    ["&amp;gt;",                       '&gt;'         ],
    [/<div([^>]+)\/>/,                 '<div\1></div>'],
    [/#{KEY}([a-z\.#]+)#{KEY}/im,      '{\1}'         ]
  ]
end

#
# The routes processing
#
get "/langs/:lang" do
  session[:lang] = params[:lang]
  redirect params[:ret] || '/'
end

get "/favicon.ico" do
  erb ''
end

get "/ui/in-edit/response" do
  params[:text]
end

post "/ui/rater/test" do
  File.read("#{File.dirname(__FILE__)+"/docs/com/ui/rater/test.html.erb"}")
end

get %r{/ui/autocompleter/languages/(.+?).js} do |search|
  regexp = /(#{Regexp.escape(search)})/i
  
  '<ul>'+
    LANGUAGES.select{|l| l =~ regexp }.map{ |lang|
      "<li>#{lang.gsub(regexp, '<strong>\\1</strong>')}</li>"
    }.join('')+
  '</ul>'
end

get %r{/(.*)} do |path|
  @path = path == '' ? 'index' : path
  @path = @path.gsub('/dnd', '/drag-and-drop')
  
  @languages = {
    'en' => 'English',
    'ru' => 'Русский'
  }

  @lang = session[:lang] || 'en'
  
  @directory = "#{File.dirname(__FILE__)+"/docs"}"
  
  @filename = "#{@directory}/#{@lang}/#{@path}.md"
  @filename = "#{@directory}/com/#{@path}.html.erb" unless File.exists?(@filename)
  @filename = "#{@directory}/#{@lang}/not-found.md" unless File.exists?(@filename)
  
  @content = File.read(@filename)
  
  if @filename[@filename.size - 8, @filename.size] == 'html.erb'
    erb @content, :layout => false
  else
    @content = Shmaruku.to_html(erb(@content))
    @content.gsub!(/('|")\/(images|builds\/ui|builds\/goods|builds\/current)\//, '\\1http://rightjs.org/\\2/')
    
    # joining the cross-references
    @content.gsub! /([^%#])\{([a-z\.#]+[a-z])\}/i do |match|
      start = $1.dup
      desc  = $2.dup
      
      unit = desc =~ /\.|#/ ? desc.slice(0, desc.rindex(/\.|#[a-z]+$/i)) : desc
      unit = @unit if unit == ''
      
      package = !unit ? nil : API_PACKS.detect{ |name|
        File.exists? "#{@directory}/#{@lang}/docs/#{name}/#{unit.downcase}.md"
      }
      
      method = desc =~ /\.|#/ ? desc.slice(desc.rindex(/\.|#[a-z]+$/i)+1, desc.size) : ''
      
      match = if package && unit && unit != ''
        "<a href='/docs/#{package}/#{unit.downcase}#{method == '' ? '' : ('#'+method.downcase)}' class='api-ref'>#{
          unit == @unit ? '' : unit
        }#{ method != '' ? 
          (unit == @unit ? '' : desc.include?('#') ? '#' : '.') + method : ''
        }</a>"
      else
        desc
      end
      
      "#{start}#{match}"
    end
    
    title = @content.match(/\A<h1>(.+?)<\/h1>/)
    
    @title = title ? title[1] : "/"
    
    erb :page
  end
end

__END__

@@page
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>RightJS: <%= @title %></title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <%= javascript_include_tag '/hotlink/right.js', '/javascripts/application.js' %>
    <%= javascript_include_tag '/builds/ui/right-autocompleter.js' %>
    <%= stylesheet_link_tag 'application' %>
    <%= @content_for ? @content_for[:modules] : '' %>
    <%= stylesheet_link_tag 'rightjs-ui-home' if request.url.include?('/ui/') %>
    <%= javascript_include_tag('/builds/i18n/right-ui-i18n-ru.js') if @lang == 'ru' %>
  </head>
  <body>
    <div id="body">
      <div id="head">
        <a href="/" id="logo">RightJS</a>
        <div id="slogan">The Right JavaScript Framework</div>
        <div id="main-menu">
          <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/download">Download</a></li>
            <li><a href="/plugins">Plugins</a></li>
            <li><a href="/demos">Demos</a></li>
            <li><a href="/docs">Docs</a></li>
          </ul>
        </div>
        <div id="lang-switch">
          <select onchange="document.location.href='/langs/'+this.value+'?ret='+escape(document.location.href);">
            <% @languages.each do |lang, name| %>
            <option value="<%= lang %>"<%= " selected='true'" if lang == @lang%>><%= name %></option>
            <% end %>
          </select>
        </div>
      </div>
      <div id="main">
        <div id="sidebar">
          <div class="box">
            <label><%= 'sidebar.Documentation'.t %></label>
            <ul>
              <%= menu_link_to 'sidebar.Getting_Started'.t, '/tutorials/getting-started' %>
              <%= menu_link_to 'sidebar.Top_10_Features'.t, '/tutorials/top-10-features' %>
              <%= menu_link_to 'sidebar.API_Reference'.t, '/docs' %>
              <%= menu_link_to 'sidebar.Tutorials'.t, '/tutorials' %>
            </ul>
          </div>
        <% if request.url.include?('/docs') %>
          <div class="box">
            <label>API-Documentation</label>
            <%= right_js_classes_menu %>
          </div>
        <% else %>
          <div class="box">
            <label><%= 'sidebar.Additional'.t %></label>
            <ul>
              <%= menu_link_to 'sidebar.RightJS_Goods'.t, '/goods' %>
              <%= goods_modules_menu %>
              <%= menu_link_to 'sidebar.RightJS_UI'.t, '/ui' %>
              <%= ui_modules_menu %>
              <%= menu_link_to 'sidebar.Showcases'.t, '/showcases' %>
              <%= menu_link_to 'sidebar.Participate'.t, '/participate' %>
            </ul>
          </div>
        <% end %>
        </div>
        
        <div id="info">
          <%= @content %>
        </div>
        <div style="clear:both"></div>
      </div>
      <div id="foot">
        <div id="bottom-menu">
          <h2><%= 'menu.About_the_Framework'.t %></h2>
          <%= link_to "menu.Benchmarks".t, "/benchmarks" %> |
          <%= link_to "menu.Browsers".t,   "/browsers"   %> |
          <%= link_to "menu.Comparison".t, "/comparison" %> |
          <%= link_to "menu.Philosophy".t, "/philosophy" %> |
          <%= link_to "menu.Contacts".t,   "/contacts"   %>
        </div>
        <div id="copyright">Copyright &copy; 2008-2010 Nikolay V. Nemshilov aka St.</div>
      </div>
    </div>
  </body>
</html>