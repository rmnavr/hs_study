
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

Below are the most general-purpose and pragmatic haskell topics you absolutely need and cannot avoid.

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
* ADTs, record syntax
* GADTs

Monads:
* Functor, Applicative, Monad
* Monads Zoo: IO, List, Maybe, Either, RWS
* Transformers (transformers/mtl libs approaches)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language core+ ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Other Pragmatic topics

Below are widely used, but little bit less universal haskell topics.

Monoids:
* Monoid, Semigroup
* Traversable, Foldable, Zippers
* Lens

Modern practices:
* Basic language extensions (that are more like convenience-aimed rather than language-changing)
* Text vs String vs ByteString

Typing:
* Type families
* Higher kinded types
* Rank N types
* Datakinds

Free monadic DSLs (effect systems):
* Free monads, Church-encoded Monads
* Final Tagless (somewhat industry-standard)
* Hierarchical Free Monads (opinionated choice)

Effect systems (choose the one you like more):
* RWS monad for simple apps (part of the language core)
* mtl-style (part of the language core)
* DI via ReaderT
* `lib` polysemy
* `lib` capabilities
* `lib` fused effects

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language widening ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Specialized, Experimental, Esoteric

Topics below should widen your Haskell toolbelt, although you can live without most of them.
Those topics are not all necessarily advanced.

Somewhat general purpose patterns:
* Alternative, MonadPlus
* Lazy, Operational, STM

Effects systems, algebraic effects libs:
* Fused effects, Freer, Extensible-effect, effectful, polysemy

Highly situational (and maybe even esoteric):
* Comonad, Arrow
* Profunctor
* Yoneda, Coyoneda
* Free Monoid

Composition techniques:
* Parser combinators
* Cont
* Some exotic pointfree notations

Advanced typing:
* Generics
* Linear, Phantom, Existential, Promoted
* Dependent, Refinement types (liquid haskell)

Extensions, metaprogramming:
* Language extensions (non-basic)
* Template haskell (quasiquoting)

<!-- __________________________________________________________________________/ }}}1 -->

# Other directions (less haskell-centric)
<!-- Software Design ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Software Design in Haskell

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

## Architecture in Haskell

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


