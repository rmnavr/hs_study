
# Roadmap of learning Haskell

<!-- Overview ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Overview

Finish 3 steps described below to feel confident in how 5000+ LOC general-purpose apps can be written in Haskell.
> And writing bigger apps is more like Architectural topic, not Haskell topic per se.

This roadmap focuses on well-established software design approaches and deliberetly ignores esoteric Haskell side.

You'll have to learn in parallel:
* Haskell as a language (functions, monads, typing, etc.)
* Haskell tooling (ghc, ghci, cabal/stack, etc.)

General recommendations:
* By the end of each step build small toy app ~300 LOC with architecture built around learned topics
* Focus more on HOW TO USE complex patterns (monads/functors/lens/etc.), not on THEIR INTERNALS (you can always learn internals later)
* Category theory is not needed (nor will it help too much) to finish all 3 steps
* GPT-5-mini knows Haskell well enough to be helpfull on all 3 steps (both for language and for tooling)

For Monad, following definition is enough to work with it:
**Monad in Haskell is a typeclass (typeclass is smth like interface), and in software design Monad is a pattern for composing computations**.

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Step 0 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Step 0 — intro to functional programming

Get some experience (in any language) with:
* Pure functions
* Immutables
* Higher-order functions (strategy pattern)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Step 1 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Step 1

Language (beginner):
* Basic syntax (type/function signature, function composition, pattern matching, case-of, let-in, where, if-then-else, guards)
* ADTs
* typeclasses
* Functor/Applicative/Monad (IO, List, Maybe), do-notation
* Prelude content overview
* Extras:
  * Imports syntax
  * Language extensions (just be aware that they exist)
  * List comprehensions
  * Monoid

Tooling:
* work only with **ghci** and import only from base modules (ignore tutorials that require non-base modules)
* learn how to compile HellowWorld.hs with plane **ghc**

Sources:
* Learn you a Haskell for Greater Good — language overview
* fsharpforfunandprofit.com — ADT for DDD (although language is F#)
* adit.io — visual monads explanation

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Step 2 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Step 2

> When on Windows, I advise you to avoid trying to install any of multimedia libs (GUI, Plotters, things like that)
> before you feel confident in doing described below things with ghc and cabal/stack.

Language (beginner-intermediate):
* R/W/S and RWS monads
* monads stack via transformers lib
* `optional` lens (I recommend trying `microlens` lib — see how to index/set/get values in structures like [[1,2,3],[4,5,6]])
* GADTs

Tooling:
* clearly understand how **package** (lib) is not the same as **module** in Haskell 
* organize your toy project into modules
* create cabal/stack project with simple dependencies (for now avoid libs with large amount of dependencies)
* `optional` try including third-party package locally into your project (you can try including microlens package for example)
* learn how to work with cabal/stack project in ghci (cabal repl)
* compile your cabal/stack project

Sources:
* William Yao on RWS monads
* Haskell on wikibooks on RWS monads
* William Yao on transformers (gives great explanation on how transformers and mtl approaches differ)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Step 3 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Step 3

Language (intermediate-advanced):
* Monads stack via mtl
* Free Monad and Interpreter patterns
* Architectural approach — Final Taggless (industry standard, but modern alternatives are actively developed)
* `optional` Architectural approach — Hierarchical Free Monads (by Alexander Granin)

Tooling:
* learn (on a surface-level) about compilation toolchains, c/linux/make — see how ghc uses all of it
* `when on Windows` learn also about mingw, see what purpose does it surve (by itself, and how ghc uses it)
* try including GUI lib into your project and writing hello-world app (on Windows may require some dark magic with mingw)

<!-- __________________________________________________________________________/ }}}1 -->

# What's next

Those 3 steps did NOT include lot's of general-purpose Haskell topics (advanced types, effect systems, specific domain libs, etc.).
However now you should be confident enough to explore Haskell on your own, where your needs and interest will lead you.

