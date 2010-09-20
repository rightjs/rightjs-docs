<%

@title_text = 'Welcome Home!'

@promo_texts = {

  :friendly => {
    :title    => "It's Friendly",
    :subtitle => "Easy to read syntax",
    :text     => %Q{
      <p>
        RightJS is designed for dynamic languages crowd, as such, it has very simple
        in use but well structured system where everything you need is quickly accessible
        and easily tweakable.
      </p>
      <p>
        At one side RightJS has a really nice and simple, easy to read and write syntax
        that makes it a snap to use an extend even for noobs. And on the other hand it
        supports multiple paradigms, has extensive OOP and FP abilities along side with
        many other features that will make any tough professional happy.
      </p>
    },
    :more     => "Getting started"
  },

  :compact => {
    :title    => "It's Compact",
    :subtitle => "Weighs just 15k!",
    :text     => %Q{
      <p>
        RightJS is a really compact framework of just 15k of gzipped code, and as the matter
        of fact it already has several plugins backed in. It has  dom manipulations handling,
        native unit extensions, basic visual effects, extensive OOP abilities, AJAX, additional
        form features, cookies. You name it!
      </p>
      <p>
        And RightJS is not just small by itself, it has a number of small and fast plugins,
        you can add them to the main build, or switch off unnecessary features stripping it
        down to a very skinny core.
      </p>
    },
    :more     => "Custom builds page"
  },

  :fast => {
    :title    => "It's Fast",
    :subtitle => "Possibly THE Fastest!",
    :text     => %Q{
      <p>
        RightJS takes the performance issue very seriously, we do lots of regressive
        and performance testing to make sure all methods in the framework work
        as fast as they possibly can.
      </p>
      <p>
        RightJS reuses all native functionality every browser can provide and it
        doesn't overcomplicate things with too fancy, slow features. As the result,
        RightJS beats up all the modern frameworks in most of routine operations,
        and in many cases, gets really close to the pure dom code performance.
      </p>
    },
    :more     => "Benchmarks page"
  }

}

@hots_block = {
  :title     => "What's Hot?",
  :ui        => "A collection of useful interfaces and widgets",
  :plugins   => "A collection of common use plugins",
  :showcases => "Slick applications/games built with RightJS"
}


%>
<%= partial 'page' %>
