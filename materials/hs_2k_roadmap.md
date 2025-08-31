
<!-- Intro ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Roadmap to confidently build small-to-medium general-purpose Haskell apps

This roadmap guides you through general-purpose Haskell skills, that are required to confidently write ~2000 LOC general-purpose Haskell apps.

It also equips you with enough foundation to explore any further Haskell direction of your choice.

This roadmap: 
* Focuses on learning well-established software design approaches
* Destinguishes absolutely-needed (universal) approaches from situational (nice-to-haves)
* Deliberately ignores esoteric Haskell side

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Bird view ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Bird-view on whole roadmap

This roadmap can be summarized in 3 steps:

|   |Language|Tooling|
|---|---|---|
|Step 1| Pure functions + ADTs and Simple Monads (Maybe, IO)	| just plain ghci is enough				|
|Step 2| Monad stacks/transformers (+ also learn Lens here)		| cabal/stack proj with dependencies	|
|Step 3| Free monad DSLs + GADTs								| maybe try building GUI application	|

By the end of each step write small toy app ~300 LOC with architecture built around learned topics.

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Language ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Language roadmap

> General advice:
> * Focus more on HOW TO USE complex patterns (monads/functors/lens/etc.), not on THEIR INTERNALS (you can always learn internals later)
> * Category theory is not needed (nor will it help too much) to finish this roadmap
> * For Monad, following definition is enough to work with it:
>   **Monad in Haskell is a typeclass (typeclass is smth like interface), and in software design Monad is a pattern for composing computations**

Ideally you should be familiar with **pure functions and side-effects**, **immutables** and **higher-order functions** before starting.

Step 1 (beginner):
1. Haskell basic syntax (if-then-else, `.` and `$`, patter matching, case-of, let-in, where, guards, signatures, import syntax, list comprehensions)
2. Some Haskell principles: lazyness, curry-by-default (just be aware of them), IO is pure (wut)
3. ADTs: product and sum types, records, probably also familiarize yourself with DDD
4. Typeclasses
5. Base monad usage (Functor/Applicative/Monad basic theory, do-notation, using IO/Maybe monads)
6. Language extensions — *just be aware that they exist and know how to activate them*
7. Explore Prelude content (:browse Prelude)
8. (see Tooling chapter) Learn how to organize your project into modules

Step 2 (intermediate):
1. R/W/S and RWS monads
2. Monads stack via transformers lib (focus on: WriterT, ReaderT, StateT, ExceptT)
3. Monads stack via mtl lib

Step 3 (advanced):
1. GADTs
2. Free Monad, Interpreter pattern
3. Final Tagless 
4. `optional` HFM (approach by Alexander Granin)

Things you don't need right away, but please learn them at some point:
* `beginner` Monoids — *see how Lists, Strings and numbers can be Monoids*
* `beginner` Traversable, Foldable — *see how to write idiomatic and concise folds*
* `intermed` Lens — *buffed setters and getters (I recommend trying `microlens` lib — see how to index/set/get values in structures like [[1,2,3],[4,5,6]])*
* `advanced` Type families, Rank-N types, Higher kinded types, Data kinds — *nice-to-haves to at least understand some tricky type signatures used in base libs*

> Sources:
> * Learn you a Haskell for Greater Good — teaches you everything up to monads
> * fsharpforfunandprofit.com — great explanations of how to use ADTs in DDD (although language is F#)
> * adit.io — visual monads explanation (beginner-level friendly)
> * William Yao (or Haskell wikibooks) on RWS monads
> * William Yao on transformers (gives great explanation on how transformers and mtl approaches differ)
> * `TODO` add sources on GADTs, Free/FT/HFM

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Tooling ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

## Tooling roadmap

> Main haskell tools:
> * **ghc** is compiler
> * **ghci** is used as REPL
> * **cabal** and/or **stack** are used for building/packaging (you usually choose one)

General advice:
* Don't rush yourself into using cabal/stack, since Haskell tooling sometimes is not very beginner-friendly
* Clearly understand what is **package** (lib) and what is **module** in Haskell packaging world
* Avoid trying to install any of multimedia libs (GUI, Plotters, things like that) before you feel confident in working with cabal/stack

Step 1 — ghci:
1. Stay in **ghci** until you REALLY need non-default lib
   * ghci by itself will carry you very far (up to transformers)
   * You don't really need non-default libs when learning basics (and default modules like "import Control.Monad" are always available in ghci)
   * For now, use **ghc** and **run-ghc** to run HelloWorld.hs scripts
   * Ignore tutorials that require non-default libs (they are not beginner-level anyway)
2. Learn how to organize you project into modules
   * Such projects can still be run with just plane **ghci**

Step 2 — learn how to create/build/run/REPL cabal (or stack) project:
1. Start with no-dependencies
2. Try adding simple dependencies (like microlens)

Step 3 — try building project with complex lib:
* For complex libs with large dependencies (like GUI libs) — be prepared that including them
  into your project may be non-trivial (especially on Windows)
* They usually require some extra non-haskell software be installed on your system — be sure to meet those requirements
* Familiarizing yourself with compilation toolchains will help a lot here (c/make, static/dynamic linking, mingw on Windows, etc.)

<!-- __________________________________________________________________________/ }}}1 -->

<!-- What's next ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Possible further directions

Explore [Haskell map (bird-view)](https://github.com/rmnavr/hs_study/blob/main/materials/hs_map.md)
to get more details on directions proposed below.

You should be now well equipped to explore any direction you like:
* Widening your general haskell toolbelt with universal and situational patterns — *by now you have enough foundation to comfortly learn those topics*
* Exploring libs for your domain of interest (GUI, frontend, DS, ...) — *by now you at least won't be parallized by looking into new libs*
* Advanced typing (generics, dependent types, ...) — *probably to prepare yourself for Type-Driven-Design*
* Effects systems — *probably to find your favourite one if you were not satisfied with FT or HFM*
* Software design and architecture — *to properly scale your 2000 LOC apps into 10000+ LOC apps*
* Cathegory Theory — *but again, don't expect it to boost your programming skills directly*

<!-- __________________________________________________________________________/ }}}1 -->

