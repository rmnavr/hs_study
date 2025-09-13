    
    newtype Reader r a = Reader { runReader :: r -> a } 

    --  fmap   :: (a -> b) -> Reader r a -> Reader r b
    --  pure   :: a -> Reader r a
    --  (<*>)  :: Reader r (a -> b) -> Reader r a -> Reader r b
    --  (>>=)  :: Reader r a -> (a -> Reader r b) -> Reader r b

    instance Functor (Reader r) where
        fmap f (Reader g) = Reader (f . g)

    instance Applicative (Reader r) where
        pure x = Reader (const x)
        Reader rf <*> Reader rx = Reader $ \_r -> (rf _r) (rx _r)

    -- TODO: inspect all below

    instance Monad (Reader r) where
        return = pure
        Reader ra >>= k = Reader $ \r ->
                            let a = ra r
                                Reader rb = k a
                            in  rb r

    reader :: (r -> a) -> Reader r a
    reader = Reader

    ask :: Reader r r
    ask = Reader id

    asks :: (r -> a) -> Reader r a
    asks f = Reader f

    local :: (r -> r) -> Reader r a -> Reader r a
    local f (Reader ra) = Reader (ra . f)

