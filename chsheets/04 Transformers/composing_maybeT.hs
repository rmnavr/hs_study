
    -- code is borrowed from:
    -- https://stackoverflow.com/questions/32579133/simplest-non-trivial-monad-transformer-example-for-dummies-iomaybe

    :set -package mtl -package transformers

    import Control.Monad.Trans.Maybe (MaybeT, runMaybeT)
    import Control.Monad.IO.Class (liftIO)

-- 01 Simply combining IO and Maybe (with MaybeT) ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- Every expression in a do block must be from the same monad:

        greet :: IO ()
        greet = do -- here we enter IO monad
            putStr "What is your name? "    -- IO ()
            n <- getLine                    -- IO String
            putStrLn $ "Hello, " ++ n       -- IO ()

    -- To transform an IO expression into a "MaybeT IO" expression use liftIO:

        -- liftIO definition in Coltrol.Monad.IO.Class:
        class Monad m => MonadIO m where
            liftIO :: IO a -> m a

        -- MaybeT definition in Control.Monad.Trans.Maybe:
        newtype MaybeT m a = MaybeT {runMaybeT :: m (Maybe a)}
        -- FIY:
        MaybeT :: m (Maybe a) -> MaybeT m a
        runMaybeT :: MaybeT IO a -> IO (Maybe a)

        mgreet :: MaybeT IO ()
        mgreet = do -- here we enter "MaybeT IO" monad
            liftIO $ putStr "What is your name? "   -- MaybeT IO ()
            n <- liftIO getLine                     -- MaybeT IO String
            liftIO $ putStrLn $ "Hello, " ++ n      -- MaybeT IO ()

            -- see in details type of 1st string in do-block:
            -- • liftIO :: IO a  -> m           a
            -- • liftIO :: IO () -> (MaybeT IO) ()

        -- this is required because MaybeT is not instance of Show:
        mgreetRun :: IO (Maybe ())
        mgreetRun = do -- here we enter IO monad
            result <- runMaybeT mgreet
            return result

            -- see in details type of 1st string in do-block:
            -- • runMaybeT :: MaybeT IO a  -> IO (Maybe a)
            -- • runMaybeT :: MaybeT IO () -> IO (Maybe ())

-- ____________________________________________________________________________/ }}}1
-- 02 Chaining IOs ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    askfor2 :: String -> MaybeT IO String
    askfor2 prompt = do -- here we enter "MaybeT IO" monad
                                                    -- ↓ MaybeT IO ()
        liftIO $ putStr ("What is your " ++ prompt ++ " (type END to quit)? ")                           -- MaybeT IO ()
        r <- liftIO getLine                         -- MaybeT IO String
        if   r == "END"
        then MaybeT (return Nothing)                -- MaybeT IO String
        else MaybeT (return (Just r))               -- MaybeT IO String

        -- in monadic context of askfor2:

            -- • return here is creating IO action that yields Maybe value
            -- • the fact that here return is used in IO is derived by ghc
            -- • MaybeT constructor is lifting IO action into "MaybeT IO" monad

                              Nothing    :: Maybe String
                     return $ Nothing    :: IO (Maybe String)
            MaybeT $ return $ Nothing    :: MaybeT IO String

                            $ Just "foo" :: Maybe String
                     return $ Just "foo" :: IO (Maybe String)
            MaybeT $ return $ Just "foo" :: MaybeT IO String

    -- same function, same types, but using short-cuts syntax:
    askfor2 :: String -> MaybeT IO String
    askfor2 prompt = do
        r <- liftIO $ do
                putStr ("What is your " ++ prompt ++ " (type END to quit)?")
                getLine
        if   r == "END"
        then mzero      
        else return r   

    survey2 :: IO (Maybe (String, String))
    survey2 =
        runMaybeT result
        where
        result = do
            a <- askfor2 "name"            -- MaybeT IO String (inside do-block)
            b <- askfor2 "favorite color"
            return (a, b)

    -- here:
    -- runMaybeT :: MaybeT IO a                -> IO (Maybe a)
    -- runMaybeT :: MaybeT IO (String, String) -> IO (Maybe (String, String))

-- ____________________________________________________________________________/ }}}1
