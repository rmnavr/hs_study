    
    data DayOfWeek
        = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday
        deriving (Eq, Enum, Bounded)

    data Month
        = January | February | March     | April   | May      | June
        | July    | August   | September | October | November | December
        deriving (Enum, Bounded, Show)

    nextDayOfWeek :: (Eq a, Enum a, Bounded a) => a -> a
    nextDayOfWeek x | x == maxBound = minBound
                    | otherwise     = succ x

    pad :: Int -> String
    -- makes '1' to be ' 1', and keeps '12' to be '12'
    pad dayN = case show dayN of
        [char] -> [' ', char]
        chars  -> chars

    month :: Month -> DayOfWeek -> Int -> String
    month month dayNameOf01 dayNumberOfLast =
        show month ++ " 2015\n" ++ header ++ (spaces Sunday)
        where
        header = "--------------------\nSu Mo Tu We Th Fr Sa\n"
        --
        spaces:: DayOfWeek -> String
        spaces currDay | dayNameOf01 == currDay = (days dayNameOf01 1)
                       | otherwise = "   " ++ spaces (nextDayOfWeek currDay)
        --
        days:: DayOfWeek -> Int -> String
        days Sunday    n | n > dayNumberOfLast = "\n"
        days _         n | n > dayNumberOfLast = "\n\n"
        days Saturday  n = pad n ++ "\n" ++ days Sunday (succ n)
        days day       n = pad n ++ " "  ++ days (nextDayOfWeek day) (succ n)

    year :: String
    year = (month January   Thursday  31)
        ++ (month February  Sunday    28)
        ++ (month March     Sunday    31)
        ++ (month April     Wednesday 30)
        ++ (month May       Friday    31)
        ++ (month June      Monday    30)
        ++ (month July      Wednesday 31)
        ++ (month August    Saturday  31)
        ++ (month September Tuesday   30)
        ++ (month October   Thursday  31)
        ++ (month November  Sunday    30)
        ++ (month December  Tuesday   31)

    main :: IO ()
    main = putStr year
