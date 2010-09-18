# Browser

`Browser` is a global object that contains markers allowing you to determine
the current type of browser. The following keys are available:

Key           | Description                         |
--------------|-------------------------------------|
IE            | Internet Explorer of any version    |
Opera         | Opera browser                       |
WebKit        | WebKit based browser                |
Gecko         | Gecko based browser                 |
MobileSafari  | MobileSafari browser                |
Konqueror     | KDE default browser                 |
OLD           | an internal marker for IE 6 and 7   |

Usage is pretty much straight forward:

    if (Browser.OLD) {
      alert("Welcome to the hell");
    }

Check the [browsers](/browsers) page for more information on supported browsers.
