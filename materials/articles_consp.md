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

