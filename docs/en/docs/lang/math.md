# Math

RightJS overloads the {.random} method to make it more comfortable to use.

### .random

    Math.random()                           -> Float random between 0 and 1
    Math.random(Integer end)                -> Integer random between 0 and the end number
    Math.random(Integer start, Integer end) -> Integer random between the start and end

The original method is overloaded to provide more flexible semantics.

    Math.random();    // some Float   between 0 and 1
    Math.random(10);  // some Integer between 0 and 10
    Math.random(1,4); // some Integer between 1 and 4

