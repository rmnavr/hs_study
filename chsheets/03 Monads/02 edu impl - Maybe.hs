
    data Maybe a = Just a | Nothing deriving Show

    --  fmap   :: (a -> b) -> f a -> f b
    --  pure   :: a -> f a
    --  (<*>)  :: f (a -> b) -> f a -> f b
    --  (>>=)  :: m a -> (a -> m b) -> m b

    instance Functor Maybe where
        fmap f (Just a) = Just (f a)
        fmap f Nothing  = Nothing
        ---- additional:
        a <$ Just b  = Just a
        a <$ Nothing = Nothing

	import Control.Applicative (liftA2)

    instance Applicative Maybe where
        pure a = Just a
        (Just f) <*> (Just a) = Just (f a)
        _        <*> _        = Nothing
        ---- additional:
        Just a *> Just b = Just b
        _      *> _      = Nothing
        Just a <* Just b = Just a
        _      <* _      = Nothing
        liftA2 fxy (Just x) (Just y) = Just (fxy x y)
        liftA2 _ _ _ = Nothing

    instance Monad Maybe where
        Just x  >>= f  = f x
        Nothing >>= _  = Nothing
        ---- additional:
        (>>) = (*>)     -- compiler kindly asks for this default implementation
        return = pure   -- compiler kindly asks for this default implementation



