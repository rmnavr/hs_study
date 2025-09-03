    
    :set -XGeneralizedNewtypeDeriving
    :set -package mtl -package transformers

-- imports ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- here ask/get/... is polymorphic

    import Control.Monad.IO.Class     (MonadIO, liftIO)
    import Control.Monad.Reader       (ReaderT, runReaderT, MonadReader, ask)
    import Control.Monad.State        (StateT , runStateT , MonadState , get, put, modify)
    import Control.Monad.Writer       (WriterT, runWriterT, MonadWriter, tell)
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
        deriving ( Functor
                 , Applicative
                 , Monad
                 , MonadIO
                 , MonadReader Config
                 , MonadWriter Log
                 , MonadState  Counter
                 )

    askConfig :: MonadReader Config m => m Config
    askConfig = ask

    getCounter :: MonadState Counter m => m Counter
    getCounter = get

    modifyCounter :: MonadState Counter m => (Counter -> Counter) -> m ()
    modifyCounter = modify

    tellLog :: MonadWriter Log m => String -> m ()
    tellLog msg = tell [msg]

-- ____________________________________________________________________________/ }}}1
-- main ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    processAction :: (MonadReader Config m, MonadState Counter m, MonadWriter Log m) => Action -> m ()
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

    processList :: (MonadReader Config m, MonadState Counter m, MonadWriter Log m) => [Action] -> m ()
    processList = mapM_ processAction

    runAppIO :: App a -> Config -> Counter -> IO (a, Counter, Log)
    runAppIO (App m) cfg initCnt = do
        ((a, finalCnt), logs) <- runWriterT $ runStateT (runReaderT m cfg) initCnt
        return (a, finalCnt, logs)

    processListApp :: [Action] -> App ()
    processListApp = processList

    main :: IO ()
    main = do
        (_, finalCnt, logs) <- runAppIO (processListApp actions) cfg0 counter0
        putStrLn $ "Final counter:"
        putStrLn $ "= " ++ show finalCnt
        putStrLn "Log:"
        mapM_ putStrLn logs

-- ____________________________________________________________________________/ }}}1


