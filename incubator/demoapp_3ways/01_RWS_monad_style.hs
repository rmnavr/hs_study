
    import Control.Monad.RWS

    data Action  = Increase Int | Decrease Int | DoNothing deriving Show
    data Config  = Config { badWord :: String }
    type Log     = [String]
    type Counter = Int

    counter0 :: Counter
    counter0 = 0

    cfg0 :: Config
    cfg0 = Config ", you punk"

    actions :: [Action]
    actions = [ Increase 10
              , Decrease  3
              , Increase 15
              , Decrease  1
              , DoNothing
              , Increase  1
              ]

    processAction :: Action -> RWS Config Log Counter ()
    processAction action = do
        naming_ <- asks badWord
        case action of
            Increase n -> do
                cur_ <- get
                modify (+ n)
                tell [ "Counter: " ++ show cur_ ++ " -> " ++ show (cur_ + n)]
            Decrease n -> do
                cur_ <- get
                modify (subtract n)
                tell [ "Counter: " ++ show cur_ ++ " -> " ++ show (cur_ - n)]
            DoNothing -> do
                cur_ <- get
                tell [ "No modifications to counter (" ++ show cur_ ++ ")" ++ naming_]

    processList :: [Action] -> RWS Config Log Counter ()
    processList actions = mapM_ processAction actions

    main :: IO ()
    main = do
        putStrLn $ show $ runRWS (processList actions) cfg0 counter0

