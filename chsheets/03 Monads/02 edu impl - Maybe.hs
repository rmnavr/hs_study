
    data Maybe a = Just a | Nothing deriving Show

    instance Functor Maybe where
        fmap f (Just a) = Just (f a)
        fmap f Nothing  = Nothing
        ----
        a <$ Just b  = Just a
        a <$ Nothing = Nothing

	import Control.Applicative (liftA2)

    instance Applicative Maybe where
        pure a = Just a
        (Just f) <*> (Just a) = Just (f a)
        _        <*> _        = Nothing
        ----
        Just a *> Just b = Just b
        _      *> _      = Nothing
        Just a <* Just b = Just a
        _      <* _      = Nothing
        liftA2 fxy (Just x) (Just y) = Just (fxy x y)
        liftA2 _ _ _ = Nothing

    instance Monad Maybe where
        Just x  >>= f  = f x
        Nothing >>= _  = Nothing
        ----
        (>>) = (*>)     -- compiler kindly asks for this default implementation
        return = pure   -- compiler kindly asks for this default implementation



