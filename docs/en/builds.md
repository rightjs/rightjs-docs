# Custom Build Creation

You are free to create your own build of RightJS which best fits your needs.

To create the builds we use [Front Compiler](http://github.com/MadRabbit/frontcompiler),
the most effective JavaScript compression library written in Ruby.

## Custom Builder
<%= partial 'form' %>

<div style="font-size: 80%">
  <h2>The Self-Building Feature</h2>
  <p>
    The self-building feature creates self-building javascript code which
    reconstructs itself on the browser side. It gives you an additional 25-30%
    compression, but in exchange it takes about 5 to 100 ms for reconstruction. The
    exact duration depends on the browser and hardware.
  </p>
  <p>
    For most real life applications it is practically not noticable to the user,
    but if you are creating an extremely light-weight application and care about
    user experience you might consider turning this feature off.
  </p>
</div>

