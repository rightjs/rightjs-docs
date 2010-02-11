# Fx Basics

By default RightJS comes with the basic visual effects package. It has one base 
(abstract) class `Fx`, which defines the common visual effects interface and is used 
as the basis for all the other effect classes.

## Events

`Fx` objects handle the following events:

* start
* finish
* cancel
 
In line with the general events handling convention this means that you can 
use all the common `on`, `stopObserving` etc methods as well as `onStart`, 
`onFinish`, `onCancel` shortcuts.

## Options

All visual effects support the following options:

Name       | Default  | Description                                           |
-----------|----------|-------------------------------------------------------|
duration   | 'normal' | the effect duration in ms or a string predefined name |
transition | 'Sin'    | the transition algorithm used for the effect          |
queue      | true     | boolean marker if the effect should be queued         |

## Durations

There are three named durations which an be used in `Fx` options:

Name   | Value             |
-------|-------------------|
short  | 200 ms            |
normal | 400 ms (default)  |
long   | 800 ms            |

## Transitions

There are several predefined transitions for visual effects. You can use
them in options or specify your own function if you need.

Name | Description                                               |
-----|-----------------------------------------------------------|
Sin  | slow at the beginning and the end, but fast in the middle |
Cos  | fast at the beginning and the end, but slow in the middle |
Exp  | slow at the beginning, quickly accelerates to the end     |
Log  | fast at the beginning, quickly slows down to the end      |
Lin  | a constant speed transition                               |

The default transition `Sin` is a good choice in most cases.


### #initialize

    initialize([Element element[, Object options]])

The basic constructor
  

### #start

    start() -> Fx self

Starts the effect.

__NOTE__: _DO NOT_ overload this method! If you need to make some preparations
in your effect, use the {#prepare} method. This method just receives your
attributes and holds them inside the visual effects queue.


### #finish

    finish() -> Fx self

Forces the effect to stop and marks it as a completely finished.


### #cancel

    cancel() -> Fx self

Cancels the effect and interrupts the visual effects queue.


### #pause

    pause() -> Fx self

Puts the effect on pause with the ability to be resumed later.


### #resume

    resume() -> Fx self

Resumes a paused effect.


### #prepare

    prepare([....]) -> void
    
Abstract method which gets called with the same arguments as the {#start} 
method when the visual effects queue reaches this effect.


### #render

    render(Float position) -> void

Abstract protected method where the actual effect rendering is supposed to 
happen. During the effect run it receives float numbers from `0` to `1` that
represent the position of the effect from the beginning to the end.
