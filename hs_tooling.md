This is map of Haskell basic tooling (libs, compilers, etc.)

# Tooling

* ghc (compiling, language extensions) — https://downloads.haskell.org/ghc/latest/docs/users_guide/
* ghci (REPL) — https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html
* cabal and stack
* on Windows: msys, mingw, compiler toolchain
* ghc-pkg
* *ghcup*

# Websites

* hackage
* stackage
* hoogle
* haskell.org
* wiki.haskell.org


# Packaging

Libs (or "Packages") are collections of:
- modules (organized namespaces)
- files *.hs that correspond to modules
- executables and other stuff

Core packages and modules:
- full list of packages coming with ghc install by default: https://downloads.haskell.org/ghc/latest/docs/users_guide/9.12.2-notes.html#included-libraries
- **Prelude** is imported automatically and reimports mostly from **base** package (but from others too)
