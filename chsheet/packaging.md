Clearly distinguish between:
* **Lib** (or it's synonim **Package**) — collection of **modules**, executables, etc.
* **Module** — organized namespace with corresponding `*.hs` files 

Core packages and modules:
* Full list of packages coming with ghc install by default:
  * [[→ ghc 9.12.2 docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/9.12.2-notes.html#included-libraries)
  * [[→ ghc 9.6.6 docs]](https://downloads.haskell.org/~ghc/9.6.6/docs/users_guide/9.6.6-notes.html#included-libraries)
* **Prelude** is imported automatically and reimports mostly from **base** package (but from others too)
