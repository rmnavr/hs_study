This is map of Haskell basic tooling (libs, compilers, etc.)

# Tooling

* ghc (compiling) — [[→ ghc docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/)
* ghci (REPL) — [[→ ghci docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html)
* cabal and stack
* on Windows: msys, mingw, compiler toolchain
* *Others: ghc-pkg, ghcup*

# Related themes

* language extensions
* debugging instruments (you can't just "print x" anywhere in code)

# Websites

* hackage
* stackage
* hoogle
* haskell.org
* wiki.haskell.org


# Packaging

Please clearly distinguish between:
- **Lib** (or it's synonim **Package**) — collection of **modules**, executables, etc.
- **Module** — organized namespace with corresponding `*.hs` files 

Core packages and modules:
- Full list of packages coming with ghc install by default: [[→ ghc docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/9.12.2-notes.html#included-libraries)
- **Prelude** is imported automatically and reimports mostly from **base** package (but from others too)
