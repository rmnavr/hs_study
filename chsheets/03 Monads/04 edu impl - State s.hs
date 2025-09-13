    
    newtype State s a = State { runState :: s -> (a, s) } 

    --  fmap   :: (a -> b) -> State s a -> State s b
    --  pure   :: a -> State s a
    --  (<*>)  :: State s (a -> b) -> State s a -> State s b
    --  (>>=)  :: State s a -> (a -> State s b) -> State s b

    -- fmap modifies only result, not state:
    instance Functor (State s) where
        fmap f (State stateFn) = State (\_s0 -> let (a1_, s1_) = stateFn _s0
                                                in  (f a1_, s1_))

    -- order of s1_/s2_ is important — swaping them will not satisfy monadic laws,
    -- so sequencing should be from left to right (as it is in implementation given here)
    instance Applicative (State s) where
        pure x = State (\s -> (x, s))
        --
        (<*>) (State stateFx) (State stateX) =
            State (\_s0 -> let (fx , s1_) = stateFx _s0
                               (x2_, s2_) = stateX s1_
                           in  (fx x2_, s2_))

    instance Monad (State s) where
        (>>=) (State stateFn) f = State (\_s0 -> let (a1_, s1_) = stateFn _s0
                                                 in  runState (f a1_) s1_)

    -- accompanying utility functions:

    get :: State s s
    get = State $ \s -> (s, s)

    put :: s -> State s ()
    put s = State $ \_ -> ((), s)

    modify :: (s -> s) -> State s ()
    modify f = State $ \s -> ((), f s)

    evalState :: State s a -> s -> a
    evalState (State stateFn) s = fst (stateFn s)

    execState :: State s a -> s -> s
    execState (State stateFn) s = snd (stateFn s)

    state :: (s -> (a, s)) -> State s a
    state = State

    -- example usage:

    tick :: State Int Int
    tick = get >>= (\n -> put $ n + 1) >>= (\_ -> return n)

    -- same but with sugar:
    tick :: State Int Int
    tick = do
        n <- get        -- State Int Int // remember that monad is (State Int), not (State), this is why n here has signature :: Int
        put (n + 1)     -- State Int ()
        return n        

    runState tick 5  
    evalState tick 5 
    execState tick 5 

