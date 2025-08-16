
<!-- my yapping ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# What I personally like about Haskell

As a language:
* only ~ x3 times slower than C (Haskell is compiled)
* has REPL
* staticly/strictly typed
* SOA funtional language (+pure, +immuts)
* SOA typing system (second only to Idris/Agda and such)
* encourages some good practives (IO, separation of concerns)
* nice syntax: ML-like, pointfree possibility, composability (curry by default)

Software design can be learned through Haskell:
* functional architectures SOA (FT, HFM, ...)
* ghc exposes you to Linux/Windows compilation toolchain (and to how OS works)

As a tool:
* overall a pleasant language to use
* great at refactoring, making fundamental changes to codebase, getting back to codebase after 3 years of pause
* compared to other languages: less LOC, but more terse code
* SOA for writing parsers, DSLs, backends, etc.

Other:
* hard but rewarding intellectual challenge

# Be aware of

* Math (Cathegory theory) is not required to learn Haskell
* Haskell can be used both in **enginnering** (pragmatic software design) and in **scientific research**
  (focused on esoteric and possibly impractical things that can lead to dead ends). 
  Be aware of what you are using Haskell for.
* Software design and Architecture is somewhat language agnostic:
  * focus more on patterns and solutions, not just on Haskell
  * you still need to learn languages of other types (system langs, dynamic langs, etc.) to be a good architect

<!-- __________________________________________________________________________/ }}}1 -->
<!-- from articles ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Key takeaways from articles

From [[→ What I wish somebody told me when I was learning Haskell]](https://www.poberezkin.com/posts/2021-04-21-what-i-wish-somebody-told-me-when-i-was-learning-Haskell.html):
* Haskell is **type-centric**, not **function-centric**
* Think with correct terms:
  > * IO is a recipe, not an action (functions with IO are still pure)
  > * Functions are NOT **called/executed**, they are **applied/evaluated**
  > * Functions do not **return** values, they are a **binding of function code to the function name**
  > * Names are not **variables**, and they are not **assigned**, they are **bound to values**.
  > * Do syntax does not define **execution steps**, it defines the **sequence of actioks bound via their Monad type class interface**
* Do not rely on imperative syntax and thinking
* Haskell code is terse, and requires more time on reading
* Understand Haskell codebase by reading types and signatures, not function definitions
* Haskell program is better developed top-down with narrowing restrictions (and not bottom-up with widening restrictions),
  although you don't need big design upfront (since refactoring is cheap in Haskell)
* Haskell libs are usually their own DSLs and require more time to grasp (as compared to other languages)

From [[→ Advice for Haskell beginners]](https://www.haskellforall.com/2017/10/advice-for-haskell-beginners.html):
* Have right expectations (Haskell is indeed pleasant language, but it will not give you Nirvana)
* Have right reasons (use Haskell to solve problems, instead of learning it for it's own sake)

<!-- __________________________________________________________________________/ }}}1 -->


