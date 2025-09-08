
    -- Prelude definition:
    class Num a where
        (+)         :: a -> a -> a
        (-)         :: a -> a -> a
        (*)         :: a -> a -> a
        negate      :: a -> a
        abs         :: a -> a
        signum      :: a -> a
        fromInteger :: Integer -> a
        {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}

    -- Defining type:
    data Vector2D = Vector2D Float Float
        deriving (Show)

    -- Implementing Num for Vector2D:
    instance Num Vector2D where
        (Vector2D x1 y1) + (Vector2D x2 y2) = Vector2D (x1 + x2) (y1 + y2)
        (Vector2D x1 y1) * (Vector2D x2 y2) = Vector2D (x1 * x2) (y1 * y2)
        (Vector2D x1 y1) - (Vector2D x2 y2) = Vector2D (x1 - x2) (y1 - y2)
        abs    (Vector2D x y) = Vector2D (abs x) (abs y)
        signum (Vector2D x y) = Vector2D (signum x) (signum y)
        fromInteger n = Vector2D (fromInteger n) (fromInteger n)

    -- test if it works (in ghci):
    Vector2D 3 4 + Vector2D 0 1



