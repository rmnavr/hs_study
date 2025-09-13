    
    data Either e a = Left e | Right a deriving Show

    --  fmap   :: (a -> b) -> f a -> f b
    --  pure   :: a -> f a
    --  (<*>)  :: f (a -> b) -> f a -> f b
    --  (>>=)  :: m a -> (a -> m b) -> m b

    instance Functor (Either e) where
        fmap f (Left e)  = Left e
        fmap f (Right x) = Right (f x)

    instance Applicative (Either e) where
        pure x = Right x
        (Right f) <*> (Right x) = Right (f x)
        (Left e)  <*> _         = Left e
        _         <*> (Left e)  = Left e

    instance Monad (Either e) where
        Left e  >>= _  = Left e
        Right x >>= f  = f x



