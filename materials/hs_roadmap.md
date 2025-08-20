# My actual roadmap of learning Haskell

Below are actual steps which I took to learn haskell.

By "learn" I mean the following:
* I learned basic theory (not math theory, but more like writing monads from scratch)
* I toyed into basic mini-apps implementing what I learned

I insuccessfully tried lot's of shortcuts, yet only slow road given below worked.

> Notice that below there are no recommendations on learning math theory (of monads and other types). 
> As many production Haskell programmers say, math is not a requirement for learning Haskell.
> There is nothing bad in diving into cathegory theory, but don't expect it to automatically convert into programming skills.
> 
> **Monad in Haskell is a typeclass, and in software design it is a pattern for composing computations**.
> This definition is enough to work with it.

# Basic

Tooling:
* Learn how to work in REPL with ghci, don't care about compiling and adding libs for now

Language:
* Pure functions and values, Immutables
* Basic syntax
* Pattern matching
* typeclasses
* ADTs: sum and product types
* Functor, Applicative, Monad
* IO and Maybe monad

Make sure to be fluent with:
* functional composition `.` and application `$`
* using Maybe and IO monads in code

Recommended sources:
* Learn you a Haskell for Greater Good — language overview
* fsharpforfunandprofit.com — ADT for DDD (although language is F#)
* adit.io — visual monads explanation

Project to toy into:
* mini-app that allows arythmetic on Units (like 5 gm + 0.03 kg = 35 gm) around ~300 LOC
* architecture is built only on ADTs, also Maybe monad used, no other fancy stuff
* don't try to make code elegant too much

# Intermediate

Tooling:
* Cabal or stack: learn how to create a project and add simple dependencies
* Learn how to compile hello-world executable with ghc and with cabal

Language:
* Reader, Writer, State, RWS monads
* Transformers: theory, transformers lib, mtl lib
* GADTs

Recommended sources:
* William Yao on RWS monads, haskell wiki
* William Yao on transformers (gives great explanation on how transformers and mtl differ)

Project to toy into:
* mini-app about withdrawing and depositing into bank accound around ~200 LOC
* architecture is utilizing RWS monad
* once app is implemented with RWS monad, rewrite it into transformer in transformer or mtl lib

# Advanced

* Free Monads, FT, HFM
* ... add more ...


