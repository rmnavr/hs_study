
<!-- 3 simple ways to run ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# 3 simple ways to run simple scripts

HelloWorld-level scripts can be run quickly via:

1. `ghci` or `ghc --interactive` — start REPL session
2. `runghc HelloWorld.hs` — runs script without compilation (startup time ~1..2 seconds)
3. `ghc HelloWorld.hs` — will produce executable. Will files:
   - *.exe of 12Mb size for hello-world program with no dependencies
   - *.o  — can be deleted (machine code of some linking)
   - *.hi — can be deleted (type and function signatures)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- package vs module ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Terminology: Package vs Module

Clearly distinguish between:
* **Lib** (or it's synonim **Package**) — collection of **modules**, executables, etc
  > Example: `microlens`
* **Module** — organized namespace with corresponding `*.hs` files
  > Example: `Lens.Micro`

GHC comes with list of preinstalled packages:
* [[→ ghc 9.12.2 docs]](https://downloads.haskell.org/ghc/latest/docs/users_guide/9.12.2-notes.html#included-libraries)
* [[→ ghc 9.6.6 docs]](https://downloads.haskell.org/~ghc/9.6.6/docs/users_guide/9.6.6-notes.html#included-libraries)
* **Prelude** is imported automatically and reimports mostly from **base** package (it also imports many things from other modules too)

<!-- __________________________________________________________________________/ }}}1 -->
<!-- ghci exposure terminology ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Managing packages and modules

Explore packages lists:
* `ghc-pkg list` — shows list of base only packages (is it correct?)
* `cabal list --installed` — gives same list as `ghc-pkg list` but more verbose
* `ghc-pkg describe mtl` — gives list of modules exposed by package `mtl`

Steps for making new package available in ghci:
1. **Install** it (`microlens` for example). This package is now **hidden**
   (meaning it is not loaded in ghci memory, but can be).
2. **Expose** it (meaning now you will be able to call `import Lens.Micro`):
   * in current ghci session — via `:set -package microlens`
   * `ghci -package microlens` — start with package `microlens` exposed (but not imported)
3. You can now load it's modules content into ghci scope via **imports**:
   `import Lens.Micro`

Ghci:
* `it` is value of last REPL execution result
* `.ghci` file in proj dir can contain preloaded commands
* `:module Lens.Micro` — ? (has more features than Import)
* `:module <TAB>` — will give list of all available modules for imports
* `:load HelloWorld.hs` — ?
* `:load`, `:reload` — ?
* `:add`, `:unadd` — ?

Explore ghci session:
* `:show packages` — ?
* `:show modules` — ?
* `:show imports` — ?
* `:show linker` — ?
* `:show bindings` — ?
* `:show/showi language` — ?

<!-- __________________________________________________________________________/ }}}1 -->
<!-- ghci basics ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Ghci basic commands

* :type map
* :kind Functor
* :info Eq
* :browse Prelude

<!-- __________________________________________________________________________/ }}}1 -->

# Incubator

* :load only_for_files (not modules)
* :browse System.IO
* :module +System.IO -> :show imports
* import System.IO   -> :show imports
