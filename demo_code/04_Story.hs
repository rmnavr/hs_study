
    stories :: [String]
    stories = do
        let str0 = "There once was "
        str1 <- ["a princess ", "a cat ", "a little boy "]
        let str2 = "who lived in "
        str3 <- ["a shoe.", "a castle.", "an enchanted forest."]
        --
        let str4 = "\nThey found a "
        str5 <- ["giant ", "frog ", "treasure chest " ]
        let str6 = "while "
        str7 <- ["when they got lost ", "while strolling along "]
        let str8 = "and immediately regretted it.\nThen a "
        --
        str9 <- ["lumberjack ", "wolf ", "magical pony "]
        let str10 = "named "
        str11 <- ["Pinkie Pie ", "Little John ", "Boris "]
        let str12 = "found them and "
        str13 <- ["saved the day.", "granted them three wishes."]
        let str14 = "\nThe end."
        --
        return (  str0
               ++ str1
               ++ str2
               ++ str3
               ++ str4
               ++ str5
               ++ str6
               ++ str7
               ++ str8
               ++ str9
               ++ str10
               ++ str11
               ++ str12
               ++ str13
               ++ str14
               )

    main :: IO ()
    main = do
        let len :: Int
            len = length stories
        -- or single-line: let len = length stories
        putStrLn ("Enter a number from 0 to " ++ show (len - 1))
        n <- readLn
        putStrLn ""
        putStrLn (stories !! n)
