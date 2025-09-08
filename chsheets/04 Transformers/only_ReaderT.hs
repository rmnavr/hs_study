
    
    {-# LANGUAGE RecordWildCards #-}
    :set -package transformers -package mtl

    import Control.Monad.Trans.Reader (ReaderT, ask, runReaderT)
    import Control.Monad.Trans (liftIO)
    import Control.Monad (replicateM_)

    data Config = Config
        { cfgGreeting :: String
        , cfgRepeat   :: Int
        } deriving Show

    type AppM = ReaderT Config IO

    greet :: String -> AppM ()
    greet name = do
        Config{..} <- ask
        let line = cfgGreeting ++ " " ++ name
        replicateM_ cfgRepeat (liftIO $ putStrLn line)

    greetEveryone :: [String] -> AppM ()
    greetEveryone = mapM_ greet

    runApp :: Config -> AppM a -> IO a
    runApp cfg app = runReaderT app cfg

    main :: IO ()
    main = do
        let cfg = Config { cfgGreeting = "Hello,", cfgRepeat = 2 }
        runApp cfg $ do
            liftIO $ putStrLn "Starting app..."
            greetEveryone ["Bubr", "Riba"]
            liftIO $ putStrLn "Done."

