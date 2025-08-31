
<!-- Intro ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Haskell bird-view map

This Haskell map structures all the different haskell-related topics.
It should give you good bird-view picture on Haskell and it's tooling.

* Topics are given without differentiation between Beginner/Intermediate/Advanced levels.
* Points marked with `TODO` require better structuring.

Table of contents:
- [Tooling](#Tooling)
- [Language](#Language)
- [Softwared Design](#Software-Design-in-Haskell)
- [Architecture](#Architecture-in-Haskell)

<!-- __________________________________________________________________________/ }}}1 -->

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
<!-- Language core ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# General-purpose language core

> Detailed roadmap of learning this "language core" is given in 
> [Roadmap to writing small-to-medium general-purpose apps in Haskell](https://github.com/rmnavr/hs_study/blob/main/materials/hs_2k_roadmap.md) 

Basic principles:
* purity, side-effects
* higher-order functions
* curry-by-default (in Haskell)
* immutability
* lazyness
* static typing

Basic Syntax:
* functions composition (.) and application ($)
* function/type signatures
* if-then-else
* pattern matching, case of, guards, where, let in
* lambda functions
* as-pattern (@), cons operator (:)
* list comprehensions
* do blocks
* typing keywords: data, type, newtype, class, instance
* imports syntax (as, qualified, hiding)

Typing:
* Prelude basics: Eq, Show, Int/Float/String, ...
* Typeclasses
* ADTs, record syntax
* GADTs
* Type families, higher kinded types, rank N types, datakinds

Monoids:
* Monoid, Semigroup
* Traversable, Foldable, Zippers
* Lens

Monads:
* Functor, Applicative, Monad
* Monads Zoo: IO, List, Maybe, Either, RWS
* Transformers via transformers lib (also: ExceptT)
* Transformers via mtl lib

Free monadic DSLs (effect systems):
* Free monads, Church-encoded Monads
* Final Tagless
* Hierarchical Free Monads 

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language widening ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Widening your haskell toolbelt

Somewhat general purpose patterns:
* Alternative, MonadPlus
* Lazy, Operational, STM

Highly situational (and maybe even esoteric):
* Comonad, Arrow
* Profunctor
* Yoneda, Coyoneda
* Free Monoid

Composition techniques:
* Cont
* Parser combinators 

Advanced typing:
* Generics
* Linear, Phantom, Existential, Promoted
* Dependent, Refinement types (liquid haskell)

Extensions, metaprogramming:
* Language extensions
* Template haskell (quasiquoting)

Advanced effects systems:
* Algebraic effects
* Fused effects, Freer, Extensible-effect, effectful, polysemy

<!-- __________________________________________________________________________/ }}}1 -->

<!-- Software Design ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Software Design in Haskell

Topics:
* Testing
* Errors, Logging
* Concurency, Async (STM Monad)
* Interop (FFI)
* Performance, Profiling with ghc
* Documentation (Haddoc)
* Reprodusable building (cabal/stack, nix)
* Publishing your proj/lib on hackage/stackage

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Architecture ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Architecture in Haskell

FP approaches:
* make illegal state irrepresentable
* pure core imperative shell

Traditional architectures:
* ReaderT for DI
* 3-layered-cake
* onion, ports and adapters

Architectures:
* CQRS
* Actor model
* Event sourcing
* Service handle
* FRP
* Elm architecture (MVU)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Math ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Math and Computation theory

If you are into those kind of things, dive into:
* Lambda calculus
* Cathegory theory 
* Hindley-Milner typing

Although be aware, that knowing all of it will not directly make you better haskeller.

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Domains ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Domains

* Frontend (JS/HTML)
* GUI
* DS
* Writing/parsing languages
* ...

<!-- __________________________________________________________________________/ }}}1 -->

