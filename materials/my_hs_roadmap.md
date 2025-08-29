# Description

Finishing this roadmap should make you feel confident in how to write 10000+ LOC general-purpose apps in Haskell.
This roadmap focuses on well-established software design approaches and deliberetly ignores esoteric Haskell side.

General recommendations:
* Focus more on HOW TO USE complex patterns (monads/functors/lens/etc.), not on THEIR INTERNALS (you can always learn internals later)
* Category theory is not needed (nor will it help too much) to finish this roadmap
* GPT-5-mini knows Haskell well enough to be helpfull on whole roadmap (both for language and for tooling)
* For Monad, following definition is enough to work with it:
  **Monad in Haskell is a typeclass (typeclass is smth like interface), and in software design Monad is a pattern for composing computations**

# Bird-view on whole roadmap

Roughly, this roadmap can be summarized in 3 steps:

|   |Language|Tooling|
|---|---|---|
|Step 1| Pure functions + ADTs and Simple Monads (Maybe, IO)		| just plane ghci is enough					|
|Step 2| Monad stacks (transformers) (+ probably learn Lens here)	| try cabal/stack proj with dependencies	|
|Step 3| Free monad DSLs (FT, HFM, Other) + GADTs					| try GUI application						|

By the end of each step I encourage you to build small toy app ~300 LOC with architecture built around learned topics.

# Language roadmap

Step 1:
 1. Get some experience (in any language) with: Pure functions, Immutables, Higher-order functions
 2. Basic syntax (if-then-else, `.` and `$`, patter matching, case-of, let-in, where, guards, signatures, import, list comprehensions)
 3. ADTs: product and sum types
 4. Typeclasses
 5. Base monad usage (Functor/Applicative/Monad theory, do-notation, using IO/Maybe monads)
 6. Language extensions (just be aware that they exist and how to activate them)
 7. Explore Prelude content (:browse Prelude)

Step 2:
 8. R/W/S and RWS monads
 9. Monads stack via transformers lib (try for example: StateT Config IO a)
10. Monads stack via mtl lib

Step 3:
11. GADTs
12. Free Monad, Interpreter pattern
13. FT (current standard)
14. HFM (approach by Alexander Granin) or other effect-lib you like

Somewhere in parallel:
* `beginner` Monoids — see how Lists, Strings and numbers can be Monoids 
* `intermed` Lens — buffed setters and getters (I recommend trying `microlens` lib — see how to index/set/get values in structures like [[1,2,3],[4,5,6]])
* `advanced` Type families, Rank-N types, Kigher kinded types

Sources:
* Learn you a Haskell for Greater Good — teaches you everything upto and including monads
* fsharpforfunandprofit.com — great explanations of how to use ADTs in DDD (although language is F#)
* adit.io — visual monads explanation (beginner-level friendly)
* William Yao (or Haskell wikibooks) on RWS monads
* William Yao on transformers (gives great explanation on how transformers and mtl approaches differ)
* TODO: add sources on GADTs, Free/FT/HFM

## Tooling roadmap

> **ghc** is compiler, **ghci** is used as REPL, **cabal** and/or **stack** are used for building/packaging.

I encourage you to avoid trying to install any of multimedia libs (GUI, Plotters, things like that) before you feel confident in working with ghc and cabal/stack.

Step 1:
 1. When starting, I recommend working only with **ghci** and importing only from base modules (ignore tutorials that require non-base modules).
 2. Learn how to compile HellowWorld.hs with plane **ghc**

Step 2:
 3. Clearly understand how **package** (lib) is not the same as **module** in Haskell 
 4. Organize your toy project into modules
 5. Create cabal/stack project with simple dependencies (like microlens)
 7. Learn how to work with cabal/stack project in ghci (cabal repl)
 8. Compile your cabal/stack project

Step 3:
 9. Learn (on a surface-level) about compilation toolchains, c/linux/make — see how ghc uses all of it.
	On Windows learn also about mingw, see what purpose does it surve (by itself, and how ghc uses it)
10. Try including GUI lib into your project and writing hello-world app (on Windows may require some dark magic with mingw)

At some point also try:
* Including third-party package locally into your cabal/stack project (you can try including microlens package for example)

