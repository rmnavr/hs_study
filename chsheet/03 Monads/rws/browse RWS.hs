
-- :browse Control.Monad.Reader ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    :set -package mtl
    :set -package transformers
    import Control.Monad.Reader
    import Control.Monad.Trans.Reader
    :browse Control.Monad.Reader

    -- below parent module names (like Control.Monad.Reader.ask) are all removed 

    -- [1] MonadReader (typeclass)

        class Monad m => MonadReader r m | m -> r where
            ask :: m r
            local :: (r -> r) -> m a -> m a
            reader :: (r -> a) -> m a
            {-# MINIMAL (ask | reader), local #-}

        asks :: MonadReader r m => (r -> a) -> m a

    -- [2] Reader

        type Reader r = ReaderT r Identity 

        runReader :: Reader r a -> r -> a
        mapReader :: (a -> b) -> Reader r a -> Reader r b
        withReader :: (r' -> r) -> Reader r a -> Reader r' a

    -- [3] ReaderT

        type role ReaderT representational representational nominal
        newtype ReaderT r m a = ReaderT {runReaderT :: r -> m a}

        mapReaderT :: (m a -> n b) -> ReaderT r m a -> ReaderT r n b
        withReaderT :: (r' -> r) -> ReaderT r m a -> ReaderT r' m a

    --

-- ____________________________________________________________________________/ }}}1
-- :browse Control.Monad.Writer ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    :set -package mtl
    :set -package transformers
    import Control.Monad.Writer as W
    import Control.Monad.Trans.Writer
    :browse Control.Monad.Writer

    -- [1] MonadWriter (typeclass)

        class (Monoid w, Monad m) => MonadWriter w m | m -> w where
            writer :: (a, w) -> m a
            tell :: w -> m ()
            listen :: m a -> m (a, w)
            pass :: m (a, w -> w) -> m a
            {-# MINIMAL (writer | tell), listen, pass #-}

        censor :: MonadWriter w m => (w -> w) -> m a -> m a
        listens :: MonadWriter w m => (w -> b) -> m a -> m (a, b)

    -- [2] Reader

        type Writer w = WriterT w Data.Functor.Identity.Identity :: * -> *

        execWriter :: Writer w a -> w
        mapWriter :: ((a, w) -> (b, w')) -> Writer w a -> Writer w' b
        runWriter :: Writer w a -> (a, w)

    -- [3] ReaderT

        type role WriterT nominal representational nominal
        newtype WriterT w m a = WriterT {runWriterT :: m (a, w)}

        execWriterT :: Monad m => WriterT w m a -> m w
        mapWriterT :: (m (a, w) -> n (b, w')) -> WriterT w m a -> WriterT w' n b

-- ____________________________________________________________________________/ }}}1
-- :browse Control.Monad.State ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- below is result of [ghci> :browse] called after import:

        import  Control.Monad.State
        :browse Control.Monad.State

    -- [1] StateT s m a — combines State monad with other monad m

        type role StateT nominal representational nominal
        newtype StateT s m a = StateT {runStateT :: s -> m (a, s)}

        evalStateT :: Monad m => StateT s m a -> s -> m a
        execStateT :: Monad m => StateT s m a -> s -> m s
        mapStateT  :: (m (a, s) -> n (b, s)) -> StateT s m a -> StateT s n b
        withStateT :: (s -> s) -> StateT s m a -> StateT s m a

    -- [2] State s a — simple state monad (actually implemented as Transformer)

        type State s = StateT s Data.Functor.Identity.Identity :: * -> *

        -- traditional definition:
        -- newtype State s a = State { runState :: s -> (a, s) }

        runState  :: State s a -> s -> (a, s)
        evalState :: State s a -> s -> a
        execState :: State s a -> s -> s
        mapState  :: ((a, s) -> (b, s)) -> State s a -> State s b
        withState :: (s -> s) -> State s a -> State s a

    -- [3] MonadState — interface for monads that support statefull computations

        -- here "|" denotes functional dependency
        class Monad m => MonadState s m | m -> s where
            get :: m s
            put :: s -> m ()
            state :: (s -> (a, s)) -> m a
            {-# MINIMAL state | get, put #-}

            -- this is roughly equivalent to:
            -- class Monad m => MonadState s m where ...

        gets :: MonadState s m => (s -> a) -> m a
        modify :: MonadState s m => (s -> s) -> m ()
        modify' :: MonadState s m => (s -> s) -> m ()


-- ____________________________________________________________________________/ }}}1

-- :browse RWS ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

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
