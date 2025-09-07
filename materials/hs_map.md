
# Haskell bird-view map
<!-- Intro ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

This Haskell map structures all the different haskell-related topics.
It should give you good bird-view picture on Haskell and it's tooling.

> Table of contents:
> - [Tooling](#Tooling)
> - [Language](#Language)
>   - [Universal pragmatic core](#Universal-pragmatic-core)
>   - [Other Pragmatic topics](#Other-Pragmatic-topics)
>   - [Specialized, Experimental, Esoteric](#Specialized-Experimental-Esoteric)
> - [Other directions](#Other-directions)
>   - [Softwared Design](#Software-Design-in-Haskell)
>   - [Architecture](#Architecture-in-Haskell)
>   - [Math](#Math-and-Computation-theory)
>   - [Domains](#Domains)

<!-- __________________________________________________________________________/ }}}1 -->

# Tooling
<!-- Tooling ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

Main tools:
* **ghc** (compiling) — [[→ ghc docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/)
* **ghci** (REPL, debugging) — [[→ ghci docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html)
* **cabal** — [[→ cabal docs]](https://cabal.readthedocs.io/en/stable/getting-started.html)
* **stack** — ...

Other:
* **ghcup**
* **ghc-pkg**
* **runghc**

Windows-related:
* **msys**
* **mingw**

Main websites:
* hackage
* stackage
* hoogle
* haskell.org
* wiki.haskell.org

Compilation topics:
* static/dynamic linking
* ...

<!-- __________________________________________________________________________/ }}}1 -->

# Language
<!-- Language core ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Universal pragmatic core

> Below are the most general-purpose and pragmatic
> haskell topics you absolutely need and cannot avoid.

Basic principles (in FP and in Haskell in particular):
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
* Records
* ADTs
> Main keywords: data, type, class, newtype

Monads:
* Functor, Applicative, Monad
* Monads Zoo: IO, Maybe, Either, RWS, List
* Transformers (transformers and mtl approaches)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language core+ ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Other Pragmatic topics

> Below are widely used, but little bit less universal haskell topics.

Monoids:
* Monoid, Semigroup
* Traversable, Foldable, Zippers
* Lens

Modern practices:
* Frequently used language extensions
* String vs Text vs ByteText

Typing:
* GADTs

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language widening ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Specialized, Experimental, Esoteric

> Topics below should widen your Haskell toolbelt,
> although you can live without most of them (unless your domain specifically requires them).
> Those topics are not all necessarily advanced.

General software design topics:
* Interop (FFI)
* Async (STM Monad)

Extensions, metaprogramming:
* Language extensions (non-basic)
* Template haskell (quasiquoting)

Somewhat general purpose patterns:
* Alternative, MonadPlus
* Lazy, Operational

Composition techniques:
* Exotic pointfree notations
* Continuation passing style (Cont)
* Parser combinators

Advanced typing (I):
* Type families
* Higher kinded types
* Rank N types
* Datakinds

Advanced typing (II):
* Generics
* Linear, Phantom, Existential, Promoted
* Dependent, Refinement types (liquid haskell)

Highly situational (and maybe even esoteric):
* Comonad, Arrow
* Profunctor
* Yoneda, Coyoneda
* Free Monoid

<!-- __________________________________________________________________________/ }}}1 -->

# Other directions (less haskell-centric)
<!-- Software Design ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Software Design in Haskell

Patterns for structuring app:
* Basic
  * Pure functions + ADTs
  * RWS monad
  * DI, Service handle, ReaderT
  * Transformers (mtl-style)
  * Final tagless
* Free
  * Free monads (DSL + interpreter), Church-encoded Monads
  * Hierarchical Free Monads (nested DSLs)
* Effect Systems
  * freer, freer-simple, freer-effects
  * extensible-effects
  * capabilities
  * polysemy
  * fused effects

Software design topics:
* Testing
* Logging
* Proper error messaging
* Performance, Profiling with ghc
* Documentation (Haddoc)
* Reprodusable building (cabal/stack, nix)
* Publishing your proj/lib on hackage/stackage
* Shipping your app

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Architecture ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Architecture in Haskell

FP approaches:
* make illegal state irrepresentable
* pure core, imperative shell
* 3-layered-cake

Traditional architectures:
* onion, ports and adapters

Architectures:
* CQRS
* Actor model
* Event sourcing
* FRP
* Elm architecture (MVU)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Math ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Math and Computation theory

If you are into those kind of things, dive into:
* Lambda calculus
* Cathegory theory 
* Hindley-Milner typing

Although be aware, that knowing all of it will not directly make you better haskeller.

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Domains ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Domains

* Frontend (JS/HTML)
* GUI
* DS
* Writing/parsing languages
* ...

<!-- __________________________________________________________________________/ }}}1 -->


