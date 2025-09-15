
    -- https://gotchamana.github.io/wiwinwlh/#language-extensions

-- How to enable extensions ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- extensions can be given in the code:
    {-# LANGUAGE LambdaCase #-}

    -- or as command for ghci:
    :set -XLambdaCase

-- ____________________________________________________________________________/ }}}1

    -- default in GHCI:
-- ExtendedDefaultRules [default in GHCI] ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE ExtendedDefaultRules #-}

    -- allows auto-resolution of Float/Int/Num/etc.

-- ____________________________________________________________________________/ }}}1
-- NoMonomorphismRestriction [default in GHCI] ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE NoMonomorphismRestriction #-}

    -- With MR, GHC might choose concrete numeric type, making f monomorphic
    f = show . read

    -- With NMR active, f can retain polymorphic type:
    -- f :: (Read a, Show b) => a -> b
    f = show . read

-- ____________________________________________________________________________/ }}}1

    -- smth like syntax sugering:
-- Lambda Case ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE LambdaCase #-}

    -- adds \case and \cases sugar for lambdas:
    (\case { 1 -> True ; 0 -> False})
    (\cases {0 0 -> False ; 0 1 -> True ; ...})

    -- \case example is desugared to:
    (\x -> case x of {1 -> True ; 0 -> False})

-- ____________________________________________________________________________/ }}}1
-- MultiWayIf ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE MultiWayIf #-}

    -- makes following syntax possible:
    sign :: (Ord a, Num a) => a -> String
    sign x =
      if | x < 0     -> "negative"
         | x == 0    -> "zero"
         | x > 0     -> "positive"

-- ____________________________________________________________________________/ }}}1
-- OverloadedStrings ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE OverloadedStrings #-}

    ...

-- ____________________________________________________________________________/ }}}1
-- RecordWildCards ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE RecordWildCards #-}

    data R = R { a :: Int, b :: Int }

    -- [1] instead of repeating field = field ...
    f $ R { a = a, b = b } = undefined

    -- ... you can now write:
    f $ R{..} = undefined
    f $ R { a, .. } = undefined

    -- [2] instead of ...
    R { a = a, b = b }

    -- ... you can now write:
    let a = 1; b = 2 in R{..}

-- ____________________________________________________________________________/ }}}1

    -- derivers:
-- DeriveFunctor ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE DeriveFunctor #-}

-- ____________________________________________________________________________/ }}}1
-- GeneralizedNewtypeDeriving ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE GeneralizedNewtypeDeriving #-}

    -- without it: you can derive only basic typeclasses like Show, etc.
    -- with it: Functor, Applicative, Monad, MonadIO, etc.

-- ____________________________________________________________________________/ }}}1

    -- Typing:
-- MultiParamTypeClasses ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE MultiParamTypeClasses #-}

    -- makes this possible:
    class Convertible a b where
        convert :: a -> b

-- ____________________________________________________________________________/ }}}1
-- FunctionalDependencies ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

    class Convertible a b | a -> b where
        convert :: a -> b

    -- "| a -> b" means "a uniquely determines b"

-- ____________________________________________________________________________/ }}}1
    --
-- TypeSynonymInstances ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE TypeSynonymInstances #-}
    {-# LANGUAGE FlexibleInstances #-}

    type IntList = [Int]

    -- class MyClass a

    -- Without type synonym instances, we're forced to manually expand out type
    -- synonyms in the typeclass head
    -- instance MyClass [Int]

    -- With it GHC will do this for us automatically.
    -- Type synonyms still need to be fully applied
    -- instance MyClass IntList

-- ____________________________________________________________________________/ }}}1
-- FlexibleInstances ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE FlexibleInstances #-}

    -- [1] usage instead of OverlappingInstances

        class C a where
            c :: a -> String

        instance {-# OVERLAPPABLE #-} C [a] where
            c _ = "generic list"

        instance {-# OVERLAPPING  #-} C [Char] where
            c _ = "string"

    -- [2]

        -- following now becomes possible:
        instance MyClass (Maybe a) where ...


-- ____________________________________________________________________________/ }}}1
-- FlexibleContexts ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE FlexibleContexts  #-}
    -- relaxes GHC’s restriction that all constraints in a type signature
    -- must have the form (Class var) where var is a plain type variable

    -- [1] without FlexibleContexts you can only write:
        f :: (C a) => a -> b -> ...

        -- but with FlexibleContexts you can also write:
        f :: (C a, C b) => a -> b -> ...

    -- [2] there are other cases also...

        -- class MyClass a

        -- Without flexible contexts, all contexts must be type variable. The
        -- following would be legal.
        -- instance (MyClass a) => MyClass (Either a b)

        -- With flexible contexts, typeclass contexts can be arbitrary nested types. The
        -- following would be forbidden without it.
        -- instance (MyClass (Maybe a)) => MyClass (Either a b)

-- ____________________________________________________________________________/ }}}1
-- OverlappingInstances (not recommended, use FlexibleInstances instead) ‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE OverlappingInstances #-}

    -- allowes coexistence of general and specific instances

    C [a] => C [a]          -- general instance
    C [Char] => C [Char]    -- specific instance


-- ____________________________________________________________________________/ }}}1
-- UndecidableInstances ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE UndecidableInstances #-}

    ...

-- ____________________________________________________________________________/ }}}1
    --
-- GADTs ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE GADTs #-}

-- ____________________________________________________________________________/ }}}1
-- TypeFamilies ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE TypeFamilies #-}

    class Collection c where
        type Elem c       -- associated type
        empty  :: c
        insert :: Elem c -> c -> c

    instance Collection [a] where
      type Elem [a] = a
      empty = []
      insert = (:)

-- ____________________________________________________________________________/ }}}1




    -- TODO:
	-- {-# LANGUAGE RoleAnnotations #-}
