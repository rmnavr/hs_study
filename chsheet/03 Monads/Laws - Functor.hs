
    -- Functor:

        -- law of composition:
        fmap ((^2) . (*2)) (Just 7) == ((fmap (^2)) . (fmap (*2)) $ (Just 7))

        -- identity law:
        fmap id (Just 1) == id (Just 1)

