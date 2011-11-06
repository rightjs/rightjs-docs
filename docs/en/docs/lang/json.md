# JSON

RightJS provides the standard `JSON` interface for the old browsers which
doesn't have it by default.


### .stringify

    JSON.stringify(mixed data) -> String JSON data

Converts anything into JSON format

    JSON.stringify({a:1}); // -> '{"a":1}'


### .parse

    JSON.parse(String data) -> mixed data

Parses JSON string into JavaScript data

    JSON.parse('{"a":"b"}); // -> {a: "b"}