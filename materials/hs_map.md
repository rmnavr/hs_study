
This Haskell map structures all the different haskell-related topics.
It should give you good bird-view picture on Haskell and it's tooling.

* Topics are given without differentiation between Beginner/Intermediate/Advanced levels.
* Points marked with `TODO` require better structuring.

Table of contents:
- [Tooling](#Tooling)
- [Language](#Language)
- [Softwared Design](#Software-Design-in-Haskell)
- [Architecture](#Architecture-in-Haskell)

---

<!-- Tooling ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Tooling

Software:
* **ghc** (compiling) — [[→ ghc docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/)
* **ghci** (REPL, debugging) — [[→ ghci docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html)
* **cabal** and **stack**
* on Windows: **msys**, **mingw**
* Other: **ghc-pkg**, **ghcup**

Main websites:
* hackage
* stackage
* hoogle
* haskell.org
* wiki.haskell.org

Compilation topics:
* static/dynamic linking
* `TODO` Add more

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Language

Basic Syntax:
* imports
* function/type signatures
* functions composition (.) and application ($)
* pattern matching, case of, guards, where, let in, as-pattern (@), cons operator (:)
* lambda functions
* do blocks
* list comprehensions
* typing keywords: data, type, newtype, class, instance

Typing:
* Prelude basics: Eq, Show, Int/Float/String, ...
* typeclasses
* ADTs, record syntax
* GADTs
* `TODO` Type families, higher kinded types, rank N types
* `TODO` Generics, DataKinds, linear, phantom, existential, promoted
* `TODO` Dependent, Refinement types (liquid haskell)

Monads (composition):
* Functor, Applicative, Monad
* Main monads: IO, List, Maybe, Either, RWS; (and also: Continuation, Lazy, Operational)
* Relevant classes: Arrow, Alternative, MonadPlus, Comonad, Profunctor
* Transformers: transformers lib, mtl lib
* Free monad DSLs:
  * Free monads, Church-encoded Monads
  * Final Tagless
  * Hierarchical Free Monads 
  * `TODO` Effect systems and libs (fused effects, algebraic effects, etc.)

Monoids:
* Monoid, Semigroup
* Traversable, Foldable, Zippers
* Free Monoid
* Lens

Extensions, metaprogramming
* Language extensions
* Template haskell (quasiquoting)
* Liquid haskell

Experimental/Esoteric:
* `TODO` ...

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Software Design ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Software Design in Haskell

Topics:
* Testing
* Errors, Logging
* Concurency (STM Monad)
* Interop (FFI)
* Profiling, Performance
* Documentation (Haddoc)
* Reprodusable building (cabal/stack, nix)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Architecture ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Architecture in Haskell

FP Structures:
* Pure functions + ADTs
* Transformers
* Free Monads (effects DSLs) + GADTs

Architectural patterns:
* Service handle
* FRP
* Elm architecture (MVU)
* `TODO` Add more

Principles:
* 3-layered-cake
* DI in FP
* `TODO` Add more


<!-- __________________________________________________________________________/ }}}1 -->



