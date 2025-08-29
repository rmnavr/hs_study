
# Description

This roadmap focuses on learning well-established software design approaches and deliberetly ignores esoteric Haskell side.

Finishing this roadmap should make you feel confident in how to write 10000+ LOC general-purpose apps in Haskell.

# Bird-view on whole roadmap

Roughly, this roadmap can be summarized in 3 steps:

|   |Language|Tooling|
|---|---|---|
|Step 1| Pure functions + ADTs and Simple Monads (Maybe, IO)	| just plane ghci is enough				|
|Step 2| Monad stacks/transformers (+ also learn Lens here)		| cabal/stack proj with dependencies	|
|Step 3| Free monad DSLs (FT, HFM, Other) + GADTs				| maybe try building GUI application	|

By the end of each step write small toy app ~300 LOC with architecture built around learned topics.

# Language roadmap

> Some advice:
> * Focus more on HOW TO USE complex patterns (monads/functors/lens/etc.), not on THEIR INTERNALS (you can always learn internals later)
> * Category theory is not needed (nor will it help too much) to finish this roadmap
> * For Monad, following definition is enough to work with it:
>   **Monad in Haskell is a typeclass (typeclass is smth like interface), and in software design Monad is a pattern for composing computations**
> * Skipping steps will probably not work, be patient

Ideally you should be familiar with **pure functions and effects**, **immutables** and **higher-order functions** before starting.

Step 1:
1. Haskell basic syntax (if-then-else, `.` and `$`, patter matching, case-of, let-in, where, guards, signatures, import, list comprehensions)
2. Some Haskell principles: lazyness, curry-by-default (just be aware of them)
3. ADTs: product and sum types
4. Typeclasses
5. Base monad usage (Functor/Applicative/Monad theory, do-notation, using IO/Maybe monads)
6. Language extensions (just be aware that they exist and know how to activate them)
7. Explore Prelude content (:browse Prelude)

Step 2:
1. R/W/S and RWS monads
2. Monads stack via transformers lib (try for example: StateT Config IO a)
3. Monads stack via mtl lib

Step 3:
1. GADTs
2. Free Monad, Interpreter pattern
3. FT (current standard)
4. HFM (approach by Alexander Granin) or other effect-lib you like

Somewhere in parallel:
* `beginner` Monoids — see how Lists, Strings and numbers can be Monoids 
* `intermed` Lens — buffed setters and getters (I recommend trying `microlens` lib — see how to index/set/get values in structures like [[1,2,3],[4,5,6]])
* `advanced` Type families, Rank-N types, Higher kinded types

Sources:
* Learn you a Haskell for Greater Good — teaches you everything upto monads
* fsharpforfunandprofit.com — great explanations of how to use ADTs in DDD (although language is F#)
* adit.io — visual monads explanation (beginner-level friendly)
* William Yao (or Haskell wikibooks) on RWS monads
* William Yao on transformers (gives great explanation on how transformers and mtl approaches differ)
* `TODO` add sources on GADTs, Free/FT/HFM

## Tooling roadmap

> Main haskell tools:
> * **ghc** is compiler
> * **ghci** is used as REPL
> * **cabal** and/or **stack** are used for building/packaging (you usually choose one)

Some advice:
* Don't rush yourself into using cabal/stack, since Haskell tooling sometimes is not very beginner-friendly
* Clearly understand what is **package** (lib) and what is **module** in Haskell packaging world
* Avoid trying to install any of multimedia libs (GUI, Plotters, things like that) before you feel confident in working with cabal/stack

Step 1 — ghci:
1. Stay in **ghci** until you REALLY need non-default lib
   * ghci by itself will carry you very far (upto transformers)
   * You don't really need non-default libs when learning basics (and default modules like "import Control.Monad" are always available in ghci)
   * For now, use **ghc** and **run-ghc** to run HelloWorld.hs scripts
   * Ignore tutorials that require non-default libs (they are not beginner-level anyway)
2. Learn how to organize you project into modules
   * Such projects can still be run with just plane **ghci**

Step 2 — learn how to create/build/run/REPL cabal (or stack) project:
1. Start with no-dependencies
2. Try adding simple dependencies (like microlens)

As for complex libs with large dependencies (like GUI libs) — be prepared that including them into your project may be non-trivial (especially on Windows).
Familiarizing yourself with compilation toolchains will help a lot here (c/make, static/dynamic linking, mingw on Windows, etc.).

