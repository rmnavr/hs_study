
-- Usage ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- extensions can be given in the code:
    {-# LANGUAGE LambdaCase #-}

    -- or as command for ghci:
    :set -XLambdaCase

-- ____________________________________________________________________________/ }}}1

-- DeriveFunctor ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE DeriveFunctor #-}

-- ____________________________________________________________________________/ }}}1
-- FlexibleContexts ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE FlexibleContexts  #-}

    -- without FlexibleContexts you can only write:
    f :: (C a) => a -> b -> ...

    -- but with FlexibleContexts you can also write:
    f :: (C a, C b) => a -> b -> ...

-- ____________________________________________________________________________/ }}}1
-- GADTs ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE GADTs #-}

-- ____________________________________________________________________________/ }}}1
-- Lambda Case ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    {-# LANGUAGE LambdaCase #-}

    -- adds \case and \cases sugar for lambdas:
    (\case { 1 -> True ; 0 -> False})
    (\cases {0 0 -> False ; 0 1 -> True ; ...})

    -- \case example is desugared to:
    (\x -> case x of {1 -> True ; 0 -> False})

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

    -- TODO:
    {-# LANGUAGE MultiWayIf #-}

    {-# LANGUAGE MultiParamTypeClasses #-}
    {-# LANGUAGE OverlappingInstances #-}
    {-# LANGUAGE UndecidableInstances #-}

    {-# LANGUAGE TypeFamilies #-}

