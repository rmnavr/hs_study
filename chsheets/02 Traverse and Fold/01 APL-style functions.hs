
    map       :: (a -> b) -> [a] -> [b]
    sequenceA :: (Traversable t, Applicative f) => t (f a) -> f (t a)
    traverse  :: (Traversable t, Applicative f) => (a -> f b) -> t a -> f (t b)
    forM_     :: (Foldable t, Monad m) => t a -> (a -> m b) -> m ()
