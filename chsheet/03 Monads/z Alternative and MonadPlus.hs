
    -- present in Control.Monad and Control.Alternative:
    class Applicative f => Alternative f where
        empty :: f a
        <|>   :: f a -> f a -> f a
        some  :: f a -> f [a]
        many  :: f a -> f [a]
        {-# MINIMAL empty, (<|>) #-}

    -- defined in Control.Monad:
    class (Alternative m, Monad m) => MonadPlus m where
        mzero :: m a
        mplus :: m a -> m a -> m a

