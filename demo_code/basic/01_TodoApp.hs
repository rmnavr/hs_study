
    -- Add new entry with command like
    -- ghci> + DoSmth
    -- 
    -- To remove entry #0, type
    -- ghci> - 0
    -- 
    -- To exit type:
    -- ghci> q


    promptTodosList :: [String] -> IO ()
    promptTodosList todos = do
        putStrLn ""
        putStrLn "Current TODO list:"
        mapM_ printTodoEntry (zip [0..] todos)
        putStrLn ">> Enter command:"
        command <- getLine
        interpretUserInput command todos

    interpretUserInput :: String -> [String] -> IO ()
    interpretUserInput ('+':' ':todo) todos = promptTodosList (todo:todos)
    interpretUserInput ('-':' ':num ) todos =
        case deleteEntry (read num) todos of
            Nothing -> do
                putStrLn "No TODO entry matches the given number"
                promptTodosList todos
            Just todos' -> promptTodosList todos'
    interpretUserInput  "q"           todos = return ()
    interpretUserInput  command       todos = do
        putStrLn ("Invalid command: `" ++ command ++ "`")
        promptTodosList todos

    printTodoEntry :: (Int, String) -> IO ()
    printTodoEntry (n, todo) = putStrLn (show n ++ ": " ++ todo)

    deleteEntry :: Int -> [a] -> Maybe [a]
    deleteEntry 0 (_:as) = Just as
    deleteEntry n (a:as) = do
        as' <- deleteEntry (n - 1) as
        return (a:as')
    deleteEntry _  []    = Nothing

    main = do
        putStrLn "========================================="
        putStrLn "Commands:"
        putStrLn "+ <String> - Add a TODO entry"
        putStrLn "- <Int>    - Delete the numbered entry"
        putStrLn "q          - Quit"
        putStrLn "========================================="
        promptTodosList []
