    
    :set -XGeneralizedNewtypeDeriving
    :set -package mtl -package transformers

-- imports ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- here ask/get/... has concrete type (like: ReaderT Config m0 Conifg)

    import Control.Monad.Trans.Reader (ReaderT, runReaderT, ask)
    import Control.Monad.Trans.State  (StateT , runStateT , get, modify)
    import Control.Monad.Trans.Writer (WriterT, runWriterT, tell)
    import Control.Monad.IO.Class     (MonadIO, liftIO)
    import Control.Monad.Trans.Class  (lift)

-- ____________________________________________________________________________/ }}}1
-- types and intial values ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    data Action  = Increase Int | Decrease Int | DoNothing deriving Show
    data Config  = Config { badWord :: String }
    type Log     = [String]
    type Counter = Int

    actions :: [Action]
    actions =
        [ Increase 10
        , Decrease  3
        , Increase 15
        , Decrease  1
        , DoNothing
        , Increase  1
        ]

    cfg0 :: Config
    cfg0 = Config ", you punk"

    log0 :: Log
    log0 = []

    counter0 :: Counter
    counter0 = 0

-- ____________________________________________________________________________/ }}}1
-- monad stack and helpers ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    newtype App a =
        App { runApp :: ReaderT Config (StateT Counter (WriterT Log IO)) a }
        deriving (Functor, Applicative, Monad, MonadIO)


    askConfig :: App Config
    askConfig = App ask

    getCounter :: App Counter
    getCounter = App $ lift get

    modifyCounter :: (Counter -> Counter) -> App ()
    modifyCounter f = App $ lift (modify f)

    tellLog :: String -> App ()
    tellLog msg = App $ lift $ lift $ tell [msg]

-- ____________________________________________________________________________/ }}}1
-- main ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    processAction :: Action -> App ()
    processAction action = do
        cfg <- askConfig
        case action of
            Increase n -> do
                cur_ <- getCounter
                modifyCounter (+ n)
                tellLog $ "• Counter: " ++ show cur_ ++ " -> " ++ show (cur_ + n)
            Decrease n -> do
                cur_ <- getCounter
                modifyCounter (subtract n)
                tellLog $ "• Counter: " ++ show cur_ ++ " -> " ++ show (cur_ - n)
            DoNothing -> do
                cur_ <- getCounter
                tellLog $ "• No modifications to counter (" ++ show cur_ ++ ")" ++ badWord cfg

    processList :: [Action] -> App ()
    processList = mapM_ processAction

    runAppIO :: App a -> Config -> Counter -> IO (a, Counter, Log)
    runAppIO (App m) cfg initCnt = do
        ((a, finalCnt), logs) <- runWriterT $ runStateT (runReaderT m cfg) initCnt
        return (a, finalCnt, logs)

    main :: IO ()
    main = do
      (_, finalCnt, logs) <- runAppIO (processList actions) cfg0 counter0
      putStrLn $ "Final counter:"
      putStrLn $ "= " ++ show finalCnt
      putStrLn "Log:"
      mapM_ putStrLn logs

-- ____________________________________________________________________________/ }}}1

