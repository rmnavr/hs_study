
    -- extensions can be given in the code:
    -- or as command for ghci:

        {-# LANGUAGE LambdaCase #-}
        :set -XLambdaCase

    ----------------------------------------------------------------------------------------------------

    {-# LANGUAGE LambdaCase #-}

        -- adds \case and \cases sugar for lambdas:
        (\case { 1 -> True ; 0 -> False})
        (\cases {0 0 -> False ; 0 1 -> True ; ...})

        -- \case example is desugared to:
        (\x -> case x of {1 -> True ; 0 -> False})


