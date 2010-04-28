# Function

RightJS extends the `Function` unit prototype to provide the standard FP
features like binding, curring and chains. It also adds a couple of methods
for nicer delayed and periodical calls handling.


### .include

    Function.include(Object new_methods[, Boolean dont_overwrite) -> Function

Registers new functionality for `Function` instances

If the second argument is `true`, then the method _will skip_ already existing methods

    Function.include({
      double: function() {
        return this.call() * 2;
      }
    });
    
    var two = function() {
      return 2;
    };
    
    two.double(); // -> 4



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

Binds the function to the given scope as if it was handling the first 
argument as an event:

    var object = {
      attr: 'value'
    };
    var func = function(event, arg1, arg2) {
      return this.attr +' > '+ event.eventName +' > '+ arg1 +' > '+ arg2;
    };
    
    $('some-element')
      .onClick(
        func.bindAsEventListener(object, 'argument1', 'argument2')
      )
      .fire('click');
  
    // -> 'value > click > argument1 > argument2'


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

The standard functional approach right currying feature

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
milliseconds have expired.

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
milliseconds.

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
