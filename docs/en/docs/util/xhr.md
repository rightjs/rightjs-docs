# Xhr

Xhr is the standard XML HTTP request handler for RightJS.

## Options

Xhr objects support the following options:

Name         | Default | Description                                 |
-------------|---------|---------------------------------------------|
method       | 'post'  | request method (get/post/put/delete)        |
encoding     | 'utf-8' | encoding                                    |
async        | true    | asynchronous request                        |
evalScripts  | false   | extract/eval JavaScripts from the response  |
evalResponse | false   | eval response as JavaScript code            |
evalJSON     | true    | eval JSON responses automatically           |
secureJSON   | true    | should JSON responses be validated?         |
urlEncoded   | true    | urlencode the parameters                    |
spinner      | null    | common spinner element                      |
spinnerFx    | 'fade'  | fx name to show/hide the spinner            |
params       | null    | default parameters                          |

Any of the options can be set globally by altering the {Xhr.Options}
object or be passed along with any Xhr functionality interface.


## Spinners

The {Xhr} class in RightJS handles the spinners automatically. Specify them
as an element object instance or as an element-id.

    Xhr.Options.spinner = $('spinner');
    
    // now the spinner element will appear before the request
    // and automatically get hidden on complete or cancel
    new Xhr('/foo/bar').send();
    
    // in this case Xhr will process both the global and custom spinners
    new Xhr('/foo/bar', {
      spinner: 'custom-spinner'
    }).send();


## Parameters

You can send custom parameters with XHR requests. Specify them either as a
url-encoded string or as an object.

There are different levels.

You can specify global params which will be sent with all subsequent XHR
requests:

    Xhr.Options.params = 'myapp=true';
    
    // will send 'myapp=true' params with any following requests.
    Xhr.load('/foo/bar');
    
    new Xhr('/foo/bar').send();

You can specify per-request parameters by sending them as options:

    var xhr = new Xhr('/foo/bar', {
      params: {myapp: true}
    });
  
    xhr.send(); // the server will see the 'myapp=true' params

And you can specify the params by use of the {Xhr#send} method:

    var xhr = new Xhr('/foo/bar').send('myapp=true');

__NOTE:__ If you specify params on several levels, they will be merged into
a single hash once a request is being made.


## Events

The RightJS Xhr class is inherited from the standard {Observer} class, which
means that Xhr instances follow all the standard observer rules. You can add,
list and remove event handlers the usual way.

The Xhr class supports the following events:

Name     | Description                                                  |
---------|--------------------------------------------------------------|
create   | after the XmlHTTPRequest object has been instanciated        |
request  | after the request has been sent                              |
complete | after the request has completed (either successfully or not) |
success  | after the request bas completed _successfully_               |
failure  | after the request has _failed_                               |
cancel   | after the request has been canceled _manually_               |

__NOTE:__ Every callback will receive two arguments. The first one is the
request instance and the second one is the actual original request instance.

You can attach listeners to these events globally as well by use of the `Xhr` 
class level observers:

    Xhr.onCreate(function() {...});
    Xhr.onFailure(function() {...});
    
In this case `Xhr` will call your listeners on _every_ XHR request.


## JSON handling

If the option `evalJSON` is true, Xhr will try to evaluate responses that
come with a JSON content-type and assign the result to the `responseJSON` 
property.

    Xhr.load('/some.json', {
      onSuccess: function(request) {
        var json = request.responseJSON;
      
        // ....
      }
    });
    
## Short Response Names

To access the server responses use either the standard names `responseText`,
`responseXML`, `responseJSON` or any of the shortified names:

* this.text -> this.responseText
* this.xml  -> this.responseXML
* this.json -> this.responseJSON
    

### .Options

    Xhr.Options -> Object

Default Xhr options, see the options chapter above for more details.

    Xhr.load('/some/url'); // -> 'post' request
  
    Xhr.Options.method = 'get';
    
    Xhr.load('/some/url'); // -> 'get' request


### .load

    Xhr.load(String url[, Object options]) -> Xhr new

Shortcut for `new Xhr(url, options).send();` which creates a new XHR
request instance and sends it.
  
__NOTE:__ Will perform a `GET` request by default.

    Xhr.load('/some/url', {
      onSuccess: function(request) {
        // do something about it
      }
    });
  
### #initialize

    initialize(String url[, Object options]) -> Xhr new

Standard constructor. The second argument is an options hash with any
of the standard keys.

    var xhr = new Xhr('/some/url');
    var xhr = new Xhr('/some/url', {
      method: 'get',
      onSuccess: some_success_handler
    });

### #setHeader

    setHeader(String name, String value) -> Xhr self

Setter for additional headers which should be sent along with the request.

    var xhr = new Xhr('/some/url');
    xhr.setHeader('Content-type', 'application/x-www-form-urlencoded');

### #getHeader

    getHeader(String name) -> String value

Reads the response headers.

    var xhr = new Xhr('/foo/bar');
    xhr.send();
    // ...
    xhr.getHeader('Content-type');

### #successful

    successful() -> boolean

Checks if the request has completed with a successful status.

    var xhr = new Xhr('/foo/bar', {
      onComplete: function(request) {
        if (request.successful()) {
          // do something
        }
      }
    }).send();


### #send

    send([String params])  -> Xhr self
    send([Object params])  -> Xhr self
    send([Form   element]) -> Xhr self

Sends the request to the server.

    var xhr = new Xhr('/foo/bar');
    xhr.send();
    
    // or
    
    xhr.send('foo=bar&moo=boo');
    
    // or
    
    xhr.send({foo: 'bar'});


### #update

    update(Element element[, mixed params])   -> Xhr self
    update(String element_id[, mixed params]) -> Xhr self

Sends the request and then updates the given element with the result of the 
request.

    var xhr = new Xhr('/foo/bar');
    
    xhr.update(element);
    xhr.update('element-id');
    xhr.udpate(element, 'foo=bar');
    xhr.udpate(element, {foo: 'bar'});
  

### #cancel

    cancel() -> Xhr self

Cancels an active request.

    var xhr = new Xhr('/foo/bar');
    xhr.send();
  
    xhr.cancel();
  
