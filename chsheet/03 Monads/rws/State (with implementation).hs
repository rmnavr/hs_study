
-- Implementing State Monad from scratch ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- State monad does NOT store any values!
    -- Instead it wraps FUNCTION that takes initial_state and returns (result, new_state).
    -- That's all.

        newtype State_ s a = State_ { runState_ :: s -> (a, s) }
        -- runState :: State_ s a -> s -> (a, s)

    -- Since State_ does NOT store any value, you can't meaningfully make it instance of Show:

        instance (Show s, Show a) => Show (State_ s a) where
            show (State_ s) = "[State_ monad]"

    -- Making State_ an instance of the Monad typeclass:

        import Control.Monad (liftM, ap)

        instance Functor (State_ s) where
            fmap = liftM

        instance Applicative (State_ s) where
            pure x = State_ ( \s -> (x, s) )
            (<*>) = ap

        instance Monad (State_ s) where
            return     = pure
            sm >>= mf  = State_ $ \s0 ->
                         let (x, s1) = runState_ sm s0
                         in  runState_ (mf x) s1

        -- Utility functions:

        get_ :: State_ s s
        get_ = State_ (\s -> (s, s))

        put_ :: s -> State_ s ()
        put_ s = State_ (\_ -> ((), s))

        modify_ :: (s -> s) -> State_ s ()
        modify_ f = do
            s <- get_
            put_ (f s)

    -- Using it:

        -- this definition can be used even when State_ is not yet instance of Monad:
        st1 :: State_ Int Float
        st1 = State_ $ \s -> (fromIntegral s * 100 / 3 , s + 1)

        runState_ st1 3

        -- this definition can be used only once State_ is an instance of Monad:
        st2 :: State_ Int Float
        st2 = do
            s <- get_
            let result = fromIntegral s * 100 / 3
            put_ (s + 1)
            return result

        runState_ st2 3

        -- usage example:
        main :: IO ()
        main = do
            let a0 = 30
            let (outp, a1) = runState_ st2 a0
            putStrLn $ "[Old state -> New state | Result] : ["
                       ++ (show a0) ++ " -> " ++ (show a1) ++ " | " ++ (show outp) ++ "]"

-- ____________________________________________________________________________/ }}}1
-- Using Control.Monad.State implementation ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    :set -package mtl
    import Control.Monad.State
    import Data.Functor.Identity (Identity(..))

    -- list of predefined functions:

        type State s = StateT s Identity :: * -> *
        newtype StateT s m a = StateT {runStateT :: s -> m (a, s)}

        get       :: m s
        put       :: s -> m ()
        state     :: (s -> (a, s)) -> m a

        runState  :: State s a -> s -> (a, s)
        evalState :: State s a -> s -> a
        execState :: State s a -> s -> s
        mapState  :: ((a, s) -> (b, s)) -> State s a -> State s b
        withState :: (s -> s) -> State s a -> State s a

        gets      :: MonadState s m => (s -> a) -> m a
        modify    :: MonadState s m => (s -> s) -> m ()
        modify'   :: MonadState s m => (s -> s) -> m ()

    -- usage:

        -- defining monad by providing function:
        st1 :: StateT Int Identity Float    -- or: State Int Float
        st1 = StateT $ \s -> Identity (fromIntegral s * 10, s + 1)

        -- defining monad monadicly:
        st2 :: State Int Float
        st2 = do
            s <- get
            let result = fromIntegral s * 10
            put (s + 1)
            return result

        main :: IO ()
        main = do
            let a0 = 30
            let (outp, a1) = runState st2 a0
            putStrLn $ "[Old state -> New state | Result] : ["
                       ++ (show a0) ++ " -> " ++ (show a1) ++ " | " ++ (show outp) ++ "]"

-- ____________________________________________________________________________/ }}}1
-- Banking Example ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    import Control.Monad.State (State, get, put)

    type BankAccount = State Double

    deposit :: Double -> BankAccount ()
    deposit amount = modify (+ amount)

    withdraw :: Double -> BankAccount ()
    withdraw amount = do
        currentBalance <- get
        if currentBalance >= amount
            then do
                    let newBalance = currentBalance - amount
                    put newBalance
            else error "Insufficient funds"

    getBalance :: BankAccount Double
    getBalance = get

    performTransactions :: BankAccount Double
    performTransactions = do
        deposit     100.0
        withdraw     30.0
        deposit      50.0
        withdraw     21.0
        getBalance

    main :: IO ()
    main = do
        let initialBalance = 0.0
        let (finalBalance, _) = runState performTransactions initialBalance
        putStrLn $ "Final balance: $" ++ show finalBalance

-- ____________________________________________________________________________/ }}}1


