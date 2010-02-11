# RegExp

### .escape

    RegExp.escape(String string) -> String new

Escapes all the command characters in the string so it can safely be used 
as a part of a regular expression:

    RegExp.escape('[{!}]'); // -> "\[\{\!\}\]"