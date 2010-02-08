# Function

RightJS extends the `Function` unit prototype to provide the standard FP
features like binding, curring and chains. It also adds a couple of methods
for nicer delayed and periodical call handling.

### #bind

    bind(Object scope[, argument,...]) -> Function new

Binds the function to be executed in the specified context. Additionally, it
can take optional curry arguments:
  
    var object = {
      attr: 'value'
    };
    var func = function(arg1, arg2) {
      return this.attr + ': '+arg1 + ': '+ arg2;
    };
    
    var bind = func.bind(object, 'argument1');
    
    var result = bind('argument2');
    
    // -> 'value: argument1: argument2'


### #bindAsEventListener

    bindAsEventListener(Object scope[, argument, ...]) -> Function new

Binds the function to the given scope as if it were handling the first 
argument as an event:

    var object = {
      attr: 'value'
    };
    var func = function(event, arg1, arg2) {
      return this.attr +' > '+ event.eventName +' > '+ arg1 +' > '+ arg2;
    };
    
    var observer = new Observer();
    observer.on('foo', func.bindAsEventListener('argument1', 'argument2'));
    observer.fire('foo');
  
    // -> 'value > foo > argument1 > argument2'


### #curry

    curry(mixed value[, mixed value, ...]) -> Function new

The standard functional approach currying feature.

    var multiplier = function(x, y) {
      return x * y
    };
    var double = multiplier.curry(2);
    
    double(2); // 4
    double(4); // 8
    double(8); // 16
  

### #rcurry

    rcurry(mixed value[, value, ...]) -> Function new

The right functional approach currying feature

    var callback = function() { return $A(arguments); };
    
    var with_one = callback.rcurry(1);
    var with_two = callback.rcurry(1,2);
    
    with_one(1);     // -> [1,1]
    with_one(1,2);   // -> [1,2,1]
    
    with_two(1);     // -> [1,1,2]
    with_two(1,2,3); // -> [1,2,3,1,2]


### #delay

    delay(Integer timeout) -> Number timeout marker

Schedules the delayed execution of the function after `timeout`
seconds have expired.

__NOTE__: This method returns a timeout pointer. Call the `cancel()`
method on this pointer to abort the timer

    var func = function() {
      alert('boo');
    };
    
    var timeout = func.delay(2000);
    
    // You should see the boo in 2 seconds.

    // Cancel the delayed execution like this:
    window.clearTimeout(timeout);
    
    // Or like that:
    timeout.cancel();


### #periodical

    periodical(Integer timeout) -> Number timeout marker

Schedule the function to be periodically executed every `timeout` 
seconds.

__NOTE__: This method returns a timeout pointer. Call the `stop()`
method on this pointer to stop the periodical execution.

    var func = function() {
      // check something
    };
    
    var marker = func.periodical(4000);
    
    // Now the function will get executed every 4 seconds.
    
    // Stop the periodical execution like this:
    window.clearInterval(marker);
    
    // Or like that:
    marker.stop();


### #chain

    chain(Function func[, value, ...]) -> Function new

Schedules the argument function to be called immediately after
the main function. Optionally with some pre-bound arguments:
    
    var f1 = function(list, num) { list.push(num); };
    var f2 = function(list, num) { list.push(num); };
    var f3 = function(list, num) { list.push(num); };
    
    var list = []; // <- will track the calls
    
    var f = f1.chain(f2, list, 2).chain(f3, list, 3);
    
    f(list, 1); // calls the first function
    
    list // -> [1, 2, 3]
