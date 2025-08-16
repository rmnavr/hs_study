
<!-- what I like ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# What I (rmnavr) personally like about Haskell

As a language:
* compiled, only ~ x3 times slower than C
* REPL
* staticly/strictly typed
* functional SOA
* pure, immuts
* encourages some good practives (IO, separation of concerns)
* nice syntax: ML-like, pointfree possibility, composability (curry by default)

You can learn Software design through Haskell:
* functional architecture SOA (ft, hfm, ...)
* exposes you to linux compiling toolchain (and to how OS works)

As a tool:
* overall a pleasant language to use
* great at refactoring, making fundamental changes to codebase, getting back to after 3 years of pause
* compared to other languages: less LOC (but more terse code), probably more productivity (but don't make unrealistic expectations)
* SOA for parsers, DSLs, backends, etc.

Other:
* hard but rewarding intellectual challenge

<!-- __________________________________________________________________________/ }}}1 -->
<!-- what i wish somebody told me ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Key takeaways from [[→ What I wish somebody told me when I was learning Haskell]](https://www.poberezkin.com/posts/2021-04-21-what-i-wish-somebody-told-me-when-i-was-learning-Haskell.html)

* Haskell is **type-centric**, not **function-centric**
* Think with correct terms:
  * IO is a recipe, not an action (functions with IO are still pure)
  * Functions are NOT **called/executed**, they are **applied/evaluated**
  * Functions do not **return** values, they are a **binding of function code to the function name**
  * Names are not **variables**, and they are not **assigned**, they are **bound to values**.
  * Do syntax does not define **execution steps**, it defines the **sequence of actioks bound via their Monad type class interface**
* Do not rely on imperative syntax and thinking
* Haskell code is terse, and requires more time on reading
* Understand Haskell codebase by reading types and signatures, not function definitions
* Haskell program is developed top-down with narrowing restrictions (not bottom-up with widening restrictions)
* Haskell libs are usually mini-DSLs and usually require more time to grasp (as compared to other languages)


<!-- __________________________________________________________________________/ }}}1 -->


