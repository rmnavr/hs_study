
    -- Definitions of Monad-related typeclasses in GHC
    -- (as given via :browse in ghci, when nothing except Prelude is loaded)


-- Functor/Applicative/Monad ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- Main methods and their rough correspondence to each other: 
    -- 
    -- Functor:         <$     | fmap (<$>)    |     |     |        |
    -- Applicative:     pure   | liftA, liftA* | <*> |     | *>, <* |
    -- Monad:           return | liftM, liftM* | ap  | >>= | >>     | <=<, >=>

    class Functor entity where
        fmap :: (a -> b) -> entity a -> entity b
        (<$) :: a -> entity b -> entity a
        {-# MINIMAL fmap #-}
    --  • (<$>) is infix version of fmap

    class Functor f => Applicative f where
        pure :: smth -> f smth
        (<*>) :: f (a -> b) -> f a -> f b
        liftA2 :: (a -> b -> c) -> f a -> f b -> f c
        (*>) :: f a -> f b -> f b
        (<*) :: f a -> f b -> f a
        {-# MINIMAL pure, ((<*>) | liftA2) #-}
    --  • import Control.Applicative (liftA, liftA3)

    class Applicative m => Monad m where
        (>>=) :: m a -> (a -> m b) -> m b
        (>>) :: m a -> m b -> m b
        return :: a -> m a
    --  • import Control.Monad (liftM, liftM2, liftM3, liftM4, liftM5)   
    --  • import Control.Monad (ap)   
    --  • import Control.Monad (<=<, >=>)   

-- ____________________________________________________________________________/ }}}1
-- Alternative/MonadPlus ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- present in Control.Monad and Control.Alternative:
    class Applicative f => GHC.Base.Alternative f where
        GHC.Base.empty :: f a
        (GHC.Base.<|>) :: f a -> f a -> f a
        GHC.Base.some  :: f a -> f [a]
        GHC.Base.many  :: f a -> f [a]
        {-# MINIMAL empty, (<|>) #-}

    -- defined in Control.Monad:
    class (GHC.Base.Alternative m, Monad m) => GHC.Base.MonadPlus m where
        GHC.Base.mzero :: m a
        GHC.Base.mplus :: m a -> m a -> m a

-- ____________________________________________________________________________/ }}}1

-- Laws: Functor ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- law of composition:
    fmap ((^2) . (*2)) (Just 7) == ((fmap (^2)) . (fmap (*2)) $ (Just 7))

    -- identity law:
    fmap id (Just 1) == id (Just 1)

-- ____________________________________________________________________________/ }}}1



