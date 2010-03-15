# Строки

RightJS расширяет класс строк несколькими дополнительными стандартными 
методами для обработки наиболее часто встречающихся операций.


### .include

    String.include(Object new_methods[, Boolean dont_overwrite) -> String

Регистрирует новые методы для объектов типа `String`

Если второй аргумент равен `true`, то данный метод _пропустит уже существующие_ методы

    String.include({
      double: function() {
        return this + ' ' + this;
      }
    });
    
    'boo'.double(); // -> 'boo boo'



### #empty

    empty() -> boolean

Проверяет если строка пуста

    ''.empty();  // -> true
    ' '.empty(); // -> false
    'a'.empty(); // -> false


### #blank

    blank() -> boolean

Проверяет если строка содержит только пустые символы

    ''.blank();   // -> true
    ' '.blank();  // -> true
    "\n".blank(); // -> true
    ' a'.blank(); // -> false


### #trim

    trim() -> String new

Удаляет все пробелы в начале и конце строки

    ' asdf '.trim(); // -> 'asdf'


### #stripTags

    stripTags(); -> String new

Удаляет все HTML тэги из строки

    'a <b>c</b> d'.stripTags(); // -> 'a c d'


### #stripScripts

    stripScripts();                  -> String new
    stripScripts(true);              -> String new
    stripScripts(Function receiver); -> String new

Удаляет все JavaScript элементы из строки.

Вы также можете указать аргумент `true`, в этом случае метод выполнит все
найденные скрипты в контексте текущего окна.

Так же можно указать функцию. В этом случае метод сбросит в нее текст всех
найденных скриптов.

    var string = 'asdf<script>alert('bla');</script>';
    
    string.stripScripts();     // -> 'asdf'
    string.stripScripts(true); // -> 'asdf' и вы увидите alert
    
    string.stripScripts(function(script) {
      // делаем что-либо с данным скриптом
    });
    
    // вернет 'asdf'


### #extractScripts

    extractScripts() -> String scripts

Находит все скрипты в строке и возвращает их одной строкой

    var string = 'asdf <script>alert(1);</script>asdf<script>alert(2);</script>';
    
    string.extractScripts(); // -> 'alert(1);alert(2);'


### #evalScripts

    evalScripts() -> String self

Исполняет все скрипты в строке.

__ВНИМАНИЕ:__ данный метод _не удаляет_ скрипты из строки

    var string = 'asdf <script>alert(1);</script>';
    
    string.evalScripts(); // 'asdf <script>alert(1);</script>' и увидите alert


### #camelize

    camelize() -> String new

Конвертирует строку в верблюжий стиль

    'foo_bar'.camelize(); // -> 'fooBar'
    'foo-bar'.camelize(); // -> 'fooBar'




### #underscored

    underscored() -> String new

Конвертирует строку в стиль с подчеркиваниями

    'fooBar'.underscored();  // -> 'foo_bar'
    'foo-bar'.underscored(); // -> 'foo_bar'


### #capitalize

    capitalize() -> String new

Делает первые буквы каждого слова заглавными

__ВНИМАНИЕ__: данный метод поддерживает UTF-8 символы

    'boo boo boo'.capitalize();    // -> 'Boo Boo Boo'
    'йокарный бабай'.capitalize(); // -> 'Йокарный Бабай'



### #includes

    includes(String token) -> boolean

Проверяет если текущая строка содержит указанную подстроку

    'foo'.includes('bar'); // -> false
    'foo'.includes('oo');  // -> true



### #startsWith

    startsWith(String token[, boolean ignorecase]) -> boolean

Проверяет если текущая строка начинается с указанной подстроки

    'onSomething'.startsWith('on');           // -> true
    
    'onSomething'.startsWith('onsome');       // -> false
    'onSomething'.startsWith('onsome', true); // -> true



### #endsWith

    endsWith(String token[, boolean ignorecase]) -> boolean

Проверяет если текущая строка заканчивается указанной подстрокой

    'image.gif'.endsWith('.gif');       // -> true
    
    'image.gif'.endsWith('.GIF');       // -> false
    'image.gif'.endsWith('.GIF', true); // -> true



### #toInt

    toInt([Integer base]) -> Integer

Конвертирует данную строку в целое число

    '123'.toInt(); // -> 123



### #toFloat

    toFloat() -> Float

Конвертирует данную строку в число с плавающей точкой.

__ВНИМАНИЕ:__ данный метод конвертирует запятые и тире в десятичную точку.

    '123.45'.toFloat(); // -> 123.45
    '123,45'.toFloat(); // -> 123.45
    '123-45'.toFloat(); // -> 123.45


### #on

    behave(String event, Function callback)              -> void
    behave(String event, String callback[, arg, arg...]) -> void
    behave(Object events_hash)                           -> void

Подключает общего слушателя событий уровня документа используя
технуку делегирования обработки событий

    // простой пример
    "div.red".on('click', function() {
      alert("Это красный DIV");
    });

    // со ссылкой на обработчик по имени
    "div.red".on('click', 'addClass', 'that-was-red');

    // обработка нескольких событий одновременно
    "div.red".on({
      mouseover: function() { this.addClas('that-was-red')},
      mouseout:  ['removeClass', 'that-was-red'],
      click:     'hide'
    });



### #behave

    behave(String event, Function callback)              -> void
    behave(String event, String callback[, arg, arg...]) -> void
    behave(Object events_hash)                           -> void

__УСТАРЕВШЕЕ__: Старое название метода {#on}


