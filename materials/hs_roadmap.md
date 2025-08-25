# My actual roadmap of learning Haskell

> Notice that below there are no recommendations on learning math theory (of monads and other types). 

> For Monad, following definition is enough to work with it:
> **Monad in Haskell is a typeclass, and in software design it is a pattern for composing computations**.

# Step 1 (Beginner)

Language:
* Pure functions and values, Immutables
* Basic syntax, Understanding function/type signature
* Functional composition `.` and application `$`
* Pattern matching, Guards, let-in, where
* List comprehensions
* Types keywords (data, type, newtype, class, ...)
* Typeclasses
* ADTs: sum and product types
* Functor, Applicative, Monad
* IO and Maybe monad, do-syntax

Tooling:
* Learn how to work in REPL with ghci (don't care about compiling and adding libs for now)

Recommended sources:
* Learn you a Haskell for Greater Good — language overview
* fsharpforfunandprofit.com — ADT for DDD (although language is F#)
* adit.io — visual monads explanation

Project to toy into:
* Build mini-app with just ADTs and Maybe monad (and IO monad for main). 
* Example app: arythmetic on Units (like 5 gm + 0.03 kg = 35 gm), around ~200 LOC

# Step 2 (Intermediate)

Tooling:
* Cabal or stack: learn how to create a project and add simple dependencies
* Learn how to compile hello-world executable with ghc and with cabal

Language:
* Reader, Writer, State, RWS monads
* Transformers: theory, transformers lib, mtl lib

Recommended sources:
* William Yao on RWS monads
* Haskell on wikibooks on RWS monads
* William Yao on transformers (gives great explanation on how transformers and mtl approaches differ)

Project to toy into:
* Build mini-app with RWS monad (use R for config, W for logging/errors, S for calculations)
* Then rewrite this app with transformers, and then with mtl lib
* Example;pp: withdrawing and depositing into bank account, around ~100 LOC

# Step 3 (Intermediate)

* GADTs
* Free monad
* FT
* HFM


