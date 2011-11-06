# JSON

RightJS предоставляет стандартный `JSON` для старых браузеров в случае если
он не доступен по умолчанию.


### .stringify

    JSON.stringify(mixed data) -> String JSON data

Конвертирует данные в JSON формат

    JSON.stringify({a:1}); // -> '{"a":1}'


### .parse

    JSON.parse(String data) -> mixed data

Конвертирует данные из JSON строк в JavaScript объекты

    JSON.parse('{"a":"b"}); // -> {a: "b"}