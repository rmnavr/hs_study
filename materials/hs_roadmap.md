
# Roadmap to writing small-to-medium general-purpose apps in Haskell

## Roadmap overview

Complete these instructions ...
1. Learn every topic on chapter [Universal pragmatic core](https://github.com/rmnavr/hs_study/blob/main/materials/hs_map.md#Universal-pragmatic-core) of *Haskell map*
2. Explore the same *Haskell map* to become aware of topics you DON't require to learn (which are everything except Universal pragmatic core)
3. Learn tooling by steps given below

... and you will be able to:
* confidently build well-structured ~2k LOC apps (dive into software design to scale to 10k+ LOC)
* confidently move to any further (more specialized) direction of your choice

## Roadmap of learning tooling

In given order:
1. Stay as long as possible in plain ghci (because learning Haskell tooling can be surprisingly painfull)
   * you can finish all 3 checkpoints without leaving ghci
   * yes, you can simply ignore tutorials that require 3rd-party libs for now
2. Try building/repling cabal/stack proj with no dependencies
3. Try building/repling cabal/stack proj with simple dependencies
4. Try building/repling cabal/stack proj with complex dependencies like GUI libs (may be non-trivial, especially on Windows)

## Roadmap of learning language

General advice for learning language:
* Category theory is not needed (nor does it help too much) to learn Haskell
* Focusing on HOW TO USE complex patterns (monads/functors/lens/etc.) is often more beneficial than focusing on THEIR INTERNALS

Main checkpoints are to build mini-apps (~300 LOC) with architectures based on:
1. **Pure functions + ADTs + Simple monads (Maybe, IO)**
   > Required topics:
   > - basic syntax
   > - typeclasses (how to implement Show typeclass for example — nothing more fancy)
   > - ADTs, best if you also familiarize yourself with DDD (this is where ADT shine)
   > - what Functor/Applicative/Monad are and how are they composed (just be familiar with it)
   > - basic usage of Maybe and IO monad
2. **Monad stacks with mtl approach** — write app with at least config and log capabilities
   > Required topics:
   > - you'll need to understand **newtype** keyword
   > - RWS monads (understant that they wrap functions, not values)
   > - see how to work with RWS-group, MaybeT and ExceptT transformers (also, with IO inside stack)
   > - transformers lib approach to composition (lift)
   > - mtl lib approach to composition (via typeclasses)
3. *Not as universal, but still widely used*
   **Free monadic DSLs + GADTs** (details/instructions `TODO`)

I strongly advice to learn usage of **lenses** somewhere after checkpoint 1 (I advice **microlens** library),
however you don't necessarily need lenses to finish all 3 checkpoints.

