
-- Usage ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- extensions can be given in the code:
    {-# LANGUAGE LambdaCase #-}

    -- or as command for ghci:
    :set -XLambdaCase

-- ____________________________________________________________________________/ }}}1

    {-# LANGUAGE LambdaCase #-}

        -- adds \case and \cases sugar for lambdas:
        (\case { 1 -> True ; 0 -> False})
        (\cases {0 0 -> False ; 0 1 -> True ; ...})

        -- \case example is desugared to:
        (\x -> case x of {1 -> True ; 0 -> False})

    {-# LANGUAGE OverloadedStrings #-}

        ...

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
