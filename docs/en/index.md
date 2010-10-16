<%

@title_text = 'Welcome Home!'

@promo_texts = {

  :friendly => {
    :title    => "Why?",
    :text     => %Q{
      <p>
        Because we love JavaScript, because we care how it's done and
        because we believe that JavaScript programming can be much
        more civilized, pleasant and interesting process.
      </p>
      <p>
        There are much more people working with JavaScript than just web-designers
        and front-side developers. Majority of server-side developers are also
        involved in JavaScript programming one way or another. And this produces
        a demand for tools that will be comfortable and natural to use for everyone.
      </p>
      <p>
        Tools that feel right no matter what you do and what your experience is.
      </p>
    },
    :more     => "Getting started"
  },

  :compact => {
    :title    => "How?",
    :text     => %Q{
      <p>
        RightJS is all about complexity control that allows you to do your job the way
        you think it's right in any given circumstances.
      </p>
      <p>
        On one side it has very simple syntax that allows you to deal with simple
        things in simple way. If you're just a web-designer it has all the usual things
        in simple and predictable API, flawored with many shortcuts and syntax sugar.
      </p>
      <p>
        On the other side RightJS provides extensive OOP and FP features, JavaScript
        core extensions, kick-ass dom-wrappers with inheritance and lots and lots of
        other things that will make any seasoned professional to perform at his best.
      </p>
    },
    :more     => "Top 12 Features"
  },

  :fast => {
    :title    => "What?",
    :text     => %Q{
      <p>
        RightJS is a modular JavaScript framework. It has a very skiny (15k gzipped)
        core that has all the standard features, like dom-manipulation, animation,
        forms, cookies, events handling and so one.
      </p>
      <p>
        But core in RightJS is not just a closed monolyth, on contrary, it is an open
        structure, much like Ruby or Python. It provides you with an environment and
        basic building blocks, which you can reuse, patch, bend and hack, making the
        core itself to fit your application.
      </p>
      <p>
        And boy it's fast!
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