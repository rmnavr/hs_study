
> Some things are mostly Cabal and Windows specific.

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
<!-- ghci basics ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Basic ghci commands

Meta:
* `:h` — help
* `:! ls` — run shell commands without leaving ghci
* `:q` — exit ghci

Info on entities:
* `:type map`
* `:kind Functor`
* `:info Eq`
* `:browse Prelude`
* `:doc Monad`
* `:instances Word`
* `:browse Prelude`

Manipulating target set:
* `:add HelloWorld.hs`, `:unadd ...` — add/remove module(s) to the current target set
* `:load HelloWorld.hs`, `:reload` — load module(s) and it's dependencies into module set
* `:module +Lens.Micro` — smth similar to running `import Lens.Micro`
* `:module <TAB>` — will give list of all currently available modules for imports

Ghci package-related commands:
* `.ghci` file in proj dir can contain preloaded commands

Info on environment:
* `:show targets` — gives list of loaded files (which is target set?)
* `:show packages` — gives info like:
  ```
  active package flags:
    -package-id base-4.17.2.1
    -package-id microlens-0.4.13.1-6e1439427656e00f80775e91fd3a11fb0dea8923
  ```
* `:show modules` — ??? (*gives me empty list everytime*)
* `:show imports` — gives result like:
  ```haskell
  import Lens.Micro
  import Prelude -- implicit
  ```
  Modules loaded via `:module` are shown here too.
* `:show linker` — gives info like:
  ```
  ----- Loader state -----
  Pkgs: [rts, ghc-prim, ghc-bignum, base,
         microlens-0.4.13.1-6e1439427656e00f80775e91fd3a11fb0dea8923]
  Objs: []
  BCOs: []
  ```
* `:show bindings` — shows things currently in scope like `x = 13` and such
* `:show language` — shows language flags
* `:showi language` — shows language flags in ghci (may differ from `:show language`)
* `:show paths`

<!-- __________________________________________________________________________/ }}}1 -->
<!-- ghci exposure terminology ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Managing packages and modules

Explore packages lists:
* `ghc-pkg list` — shows list of globally available packages
* `cabal list --installed` — gives same list as `ghc-pkg list` but more verbose
* `ghc-pkg describe mtl` — gives list of modules exposed by package `mtl`

Steps for making new package available in ghci:
1. **Install** it globally (`cabal install microlens --lib` for example).
   This package is now **hidden** (meaning it is not yet loaded in ghci memory, but it can be).
2. **Expose** it (meaning now you will be able to call `import Lens.Micro`):
   * In current ghci session — via `:set -package microlens`
   * Start ghci with this package exposed (but not imported) — via `ghci -package microlens`
3. You can now load it's modules content into ghci scope via **imports**:
   `import Lens.Micro`

What packages will be exposed when you run `ghci` command?
1. See file `default` (yes, without extension) located somewhere in:
   > C:\Users\Username\AppData\Roaming\ghc\x86_64-mingw32-9.4.8\environments\default
   This address is prompted when ghci loaded.
2. This file has a list of packages istalled with `cabal install microlens --lib`
   and it looks like so:
   ```
   clear-package-db
   global-package-db
   package-db D:\Soft_categories\Engn_Programming\Haskell\cabal\store\ghc-9.4.8\package.db
   package-id base-4.17.2.1
   package-id microlens-0.4.13.1-6e1439427656e00f80775e91fd3a11fb0dea8923
   ```
   All listed here packages will be automatically exposed.
3. Yes, you call `ghci`, and it loads package config that is filled by cabal, yes.

<!-- __________________________________________________________________________/ }}}1 -->

