# Tooling

Software:
* ghc (compiling) — [[→ ghc docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/)
* ghci (REPL, debugging) — [[→ ghci docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html)
* Cabal and Stack
* on Windows: msys, mingw, compiler toolchain
* `Others` ghc-pkg, ghcup

Main websites:
* hackage
* stackage
* hoogle
* haskell.org
* wiki.haskell.org

# Language overview

Topics are given without differentiation between Beginner/Intermediate/Advanced levels.

* Basic syntax
  * imports
  * pattern matching (as-pattern: "@"), case of, guards, where, let in
  * lambda functions, list comprehensions (list pattern: "x:xs"), do blocks
* Typing
  * `Typing keywords` data, type, newtype, class, instance
  * `Prelude basic types` Eq, Show, Int/Float/String, ...
  * `Monads and Monoids stem` See below
  * ADTs (product and sum types), record syntax
  * GADTs, Generics
  * kinds, type families, higher kinded types (rankN types) 
  * DataKinds, linear types, phantom types, existential types, dependent types, refinement types, promoted
* Monads stem
  * `Main types` Functor, Applicative, Monad
  * `Basic monads Zoo` IO, List, Maybe, Either, RWS (Reader, Writer, State), Continuation, Lazy, Operational
  * `Other types` Arrow, Alternative, MonadPlus, Comonad, Profunctor
  * `Transformers` transformers lib, mtl lib
* Free monads
  * Free monads, Church-encoded Monads
  * Final Tagless, Hierarchical Free Monads 
* Monoids stem
  * Monoid, Semigroup
  * Traversable, Foldable, Zippers
  * Free Monoid
  * Lens
* Extensions, metaprogramming
  * Language extensions
  * Template haskell, quasiquoting
  * Liquid haskell
* Experimental (esoteric sides of Haskell, not widely used in production)
  * ... to add ...

Architectural:
* Service handle
* Higher-order effects libs, algebraic effects
* FRP
* FT, HFM

