
-- Usage example ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    import Control.Monad.Reader as R

    data Config = Config { cfgPrefix :: String
                         , cfgFactor :: Int
                         }

    type App a = Reader Config a

    greet :: String -> App String
    greet name = do
        prefix <- R.asks cfgPrefix
        return (prefix ++ ", " ++ name)

    scale :: Int -> App Int
    scale x = do
        f <- R.asks cfgFactor
        return (x * f)

    process :: String -> Int -> App String
    process name n = do
        greeting <- greet name
        scaled <- scale n
        return (greeting ++ " (scaled = " ++ show scaled ++ ")")

    main :: IO ()
    main = do
        let config = Config { cfgPrefix = "Hello", cfgFactor = 3 }
            result = runReader (process "Alice" 7) config
        putStrLn result

-- ____________________________________________________________________________/ }}}1
    
    -- list of predefined functions:

        type Reader r = ReaderT r Identity 
        newtype ReaderT r m a = ReaderT {runReaderT :: r -> m a}

        ask :: m r
        local :: (r -> r) -> m a -> m a
        reader :: (r -> a) -> m a
        asks :: MonadReader r m => (r -> a) -> m a
        runReader :: Reader r a -> r -> a
        mapReader :: (a -> b) -> Reader r a -> Reader r b
        withReader :: (r' -> r) -> Reader r a -> Reader r' a

    -- Reader monad does NOT store configuration!
    -- Instead it wraps FUNCTION that takes config and returns smth from it:
    -- newtype Reader r a = Reader { runReader :: r -> a }

        import Control.Monad.Reader as R

        data Config = Config { cfgName :: String, cfgValue :: Int } deriving Show

        cfg1 :: Config
        cfg1 = Config "Pups" 15

    -- defining Reader monad by providing function:

        r0 :: Reader Config String
        r0 = ReaderT $ \_cfg -> Identity (cfgName _cfg)

        r0a :: Reader Config String
        r0a = reader $ \_cfg -> (cfgName _cfg)

        runReader r0 cfg1
        runReader r0a cfg1

    -- ask is Reader monad that wraps function that returns config
    -- (no, args are not ommited here):
    -- ask :: Reader r r
    -- ask = Reader (\r -> r)

        rA = ask

        runReader rA cfg1

        -- btw "ask cfg1" also works in ghci (although it shouldn't?)
        -- but I guess this is due to some ghci magic

    -- asks returns Reader monad:
        
        r1 :: Reader Config String
        r1 = asks (\cfg -> cfgName cfg)

        -- or simply:
        r1 :: Reader Config String
        r1 = asks cfgName

    -- local returns Reader monad:

        runReader (local (\cfg -> cfg { cfgName = "ololo" }) r1) cfg1
                  

