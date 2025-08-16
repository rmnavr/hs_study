Systematic bird-view on Haskell (mostly just TOC, no explanations, no destinction between beginner/intermediate/etc.):
* [Haskell's toolchain](https://github.com/rmnavr/hs_study/blob/main/map/hs_tooling.md) (compile, REPL, etc.) 
* [Basic language syntax and constructs](https://github.com/rmnavr/hs_study/blob/main/map/hs_basesyntax.md)
* Typing system:
  * [Monad family](https://github.com/rmnavr/hs_study/blob/main/map/hs_monads.md)
  * [Monoid family](https://github.com/rmnavr/hs_study/blob/main/map/hs_monoids.md)
  * [Typing overview](https://github.com/rmnavr/hs_study/blob/main/map/hs_typing.md)
* [Meta-programming](https://github.com/rmnavr/hs_study/blob/main/map/hs_meta.md)

Haskell levels can be devided to:
* Beginner (enough to start writing programs in Haskell)
* Intermediate (monads, transformers)
* Advanced/Architectural (somewhat language agnostic)
* Other stuff (experimental, not really used in production, etc.)

Haskell topics levels overview:
* Beginner (enough to start writing programs in Haskell, as taken from [[→ You are already smart enough to learn Haskell]](https://williamyaoh.com/posts/2019-10-05-you-are-already-smart-enough.html)):
  * basic syntax
  * pure functions and values, immuts
  * pattern matching
  * sum and product types (ADTs)
  * how to glue together IO to make side effects
* Intermediate:
  * Functor, Applicative, Monad
  * Free Monads, Monad Transformers, FT, HFM
  * GADTs
