
    -- newtype Writer w a = Writer { runWriter :: (a, w) }
    -- here w is monoid

    w1 :: Writer [String] ()
    w1 = W.writer ((), [])

    w1 >> (W.tell ["bubr"]) >> (W.tell ["riba"]) >> (return 3) 

    runWriter $ do
        w1
        W.tell ["bubr"]
        W.tell ["riba"]
        W.listen $ do
            W.tell ["inner 1"]
            return 3

    sumWithLog :: Int -> Int -> Writer [String] Int
    sumWithLog x y = do
        W.tell ["adding " ++ show x ++ " and " ++ show y]
        W.tell ["result: " ++ show (x + y)]
        return (x + y)

    sumWithLog 3 4

