
-- :browse Control.Monad.RWS ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    import Control.Monad.RWS
    :browse Control.Monad.RWS

    class (Monoid w, MonadReader r m, MonadWriter w m, MonadState s m) =>
        MonadRWS r w s m | m -> r, m -> w, m -> s

    type RWS r w s = RWST r w s Identity

    newtype RWST r w s m a = RWST {runRWST :: r -> s -> m (a, s, w)}

    rws :: (r -> s -> (a, s, w)) -> RWS r w s a
    mapRWS :: ((a, s, w) -> (b, s, w')) -> RWS r w s a -> RWS r w' s b
    runRWS :: RWS r w s a -> r -> s -> (a, s, w)
    withRWS :: (r' -> s -> (r, s)) -> RWS r w s a -> RWS r' w s a
    evalRWS :: RWS r w s a -> r -> s -> (a, w)
    execRWS :: RWS r w s a -> r -> s -> (s, w)

    evalRWST :: Monad m => RWST r w s m a -> r -> s -> m (a, w)
    execRWST :: Monad m => RWST r w s m a -> r -> s -> m (s, w)
    mapRWST :: (m (a, s, w) -> n (b, s, w')) -> RWST r w s m a -> RWST r w' s n b
    withRWST :: (r' -> s -> (r, s)) -> RWST r w s m a -> RWST r' w s m a

-- ____________________________________________________________________________/ }}}1

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

