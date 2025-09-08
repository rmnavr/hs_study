
-- Actual GHC Implementations ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    class Functor entity where
        fmap :: (a -> b) -> f a -> f b
        (<$) :: a -> f b -> f a
        {-# MINIMAL fmap #-}

    class Functor f => Applicative f where
        pure   :: a -> f a
        (<*>)  :: f (a -> b) -> f a -> f b
        liftA2 :: (a -> b -> c) -> f a -> f b -> f c
        (*>)   :: f a -> f b -> f b
        (<*)   :: f a -> f b -> f a
        {-# MINIMAL pure, ((<*>) | liftA2) #-}

    class Applicative m => Monad m where
        (>>=)  :: m a -> (a -> m b) -> m b
        (>>)   :: m a -> m b -> m b
        return :: a -> m a
        {-# MINIMAL (>>=) #-}

-- ____________________________________________________________________________/ }}}1
-- Synonims table ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- Functions that have almost the same signature:
    --
    --  Monad  | Applic | Functor
    --  -------|--------|-------------
    --  liftM  ≈ liftA  ≈ fmap = (<$>)
    --  liftM2 ≈ liftA2 |
    --  liftM3 ≈ liftA3 |
    --  ap              ≈ (<*>) 
    --  return ≈ pure   |
    --  >>     ≈ *>     |

-- ____________________________________________________________________________/ }}}1
-- Functions cheetsheet ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- Functor:

        fmap    :: Functor f => (a -> b) -> f a -> f b
        (<$)    :: Functor f => a -> f b -> f a

        -- import Control.Monad (void)
        <$>     :: Functor f => (a -> b) -> f a -> f b  -- this is just infix version of fmap
        void    :: Functor f => f a -> f ()

    -- Applicative:

        pure   :: Applicative f => a -> f a
        (<*>)  :: Applicative f => f (a -> b) -> f a -> f b
        liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
        (*>)   :: Applicative f => f a -> f b -> f b
        (<*)   :: Applicative f => f a -> f b -> f a

        -- import Control.Applicative (liftA, liftA2, liftA3)
        liftA  :: Applicative f => (a -> b) -> f a -> f b
        liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
        liftA3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d

    -- Monad:

        (>>=)  :: Monad m => m a -> (a -> m b) -> m b
        (>>)   :: Monad m => m a -> m b -> m b
        return :: Monad m => a -> m a

        -- import Control.Monad (liftM, liftM2, liftM3, liftM4, liftM5, ap, (<=<), (>=>), join)   
        liftM  :: Monad m => (a -> b) -> m a -> m b
        liftM2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
        liftA3 :: Monad m => (a -> b -> c -> d) -> m a -> m b -> m c -> m d
        ap     :: Monad m => m (a -> b) -> m a -> m b
        join   :: Monad m => m (m a) -> m a
        (<=<)  :: Monad m => (b -> m c) -> (a -> m b) -> (a -> m c)
        (>=>)  :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c) -- usage: (\x -> Just $ x + 1) >=> (\x -> Just $ show x) $ 10

-- ____________________________________________________________________________/ }}}1



