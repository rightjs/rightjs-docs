# Список виджетов RightJS UI

RightJS UI - это подпроект содержащий стандартные элементы пользовательского интерфейса для RightJS

Весь исходный код данного проекта доступен в открытом доступе под MIT лицензией на сервисе github.

<http://github.com/rightjs/rightjs-ui>

`git clone git://github.com/rightjs/rightjs-ui.git`

<%
@module_descriptions = {
  :autocompleter => "Autocompleter это стандартный виджет автоподстановок для RightJS",

  :calendar      => "Calendar виджет календаря для RightJS. Он может работать как совместно с полем ввода "+
                    "для выбора даты/времени, а так же может работать и как независимый виджет календаря",

  :tabs          => "Tabs стандартный, три в одном (табы/карусель/гармошка) движок табов для RightJS",

  :slider        => "Slider стандартный виджет слайдера, может работать как независимый элемент страницы, "+
                    "так и в составе форм",

  :selectable    => "Настраиваемая замена для стандартных полей выбора, способная содержать любой "+
                    "html код в полях меню",

  :sortable      => "Sortable стандартный виджет сортируемых списков для RightJS",

  :lightbox      => "Лайтбокс виджет для RightJS со всеми стандартными возможностями. Показывает "+
                    "любой html контерт, работает с галлереями картинок, ходит через AJAX.",

  :tooltips      => "Виджет настраиваемых тултипов для RightJS",

  :rater         => "Простой виджет рейтингов, работает как сам по себе, так и в составе форм",

  :'in-edit'     => "Простой виджет in-place редакторов RightJS",

  :uploader      => "Виджет для отображения статуса отправки форм",

  :resizable     => "Виджет блоков с изменяемым размером",

  :colorpicker   => "Виджет для выбора цвета",

  :dialog        => "Стандартный виджет диалогов для RightJS",

  :billboard     => "Билборд/слайдшоу виджет для RightJS",

  :tags          => "Виджет для создания полей ввода тэгов",

  :rte           => "Стандартный полнотекстовый редактор для RightJS"
}
%>

<%= partial 'unit', :collection => ui_list %>
