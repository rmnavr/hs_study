
    :set -package free
    import Control.Monad.Free
    import Control.Monad.Trans.Free

    -------------------------------

    :browse Control.Monad.Free

    data Free f a = Pure a | Free (f (Free f a))

    class Monad m => MonadFree f m | m -> f where
        wrap :: f (m a) -> m a
        default wrap :: (m ~ t n, MonadTrans t, MonadFree f n, Functor f) => f (m a) -> m a

    _Free     :: (Choice p, Applicative m) => p (f (Free f a)) (m (g (Free g a))) -> p (Free f a) (m (Free g a))
    _Pure     :: (Choice p, Applicative m) => p a (m a) -> p (Free f a) (m (Free f a))
    cutoff    :: Functor f => Integer -> Free f a -> Free f (Maybe a)
    foldFree  :: Monad m => (forall x. f x -> m x) -> Free f a -> m a
    hoistFree :: Functor g => (forall a. f a -> g a) -> Free f b -> Free g b
    iter      :: Functor f => (f a -> a) -> Free f a -> a
    iterA     :: (Applicative p, Functor f) => (f (p a) -> p a) -> Free f a -> p a
    iterM     :: (Monad m, Functor f) => (f (m a) -> m a) -> Free f a -> m a
    liftF     :: (Functor f, MonadFree f m) => f a -> m a
    retract   :: Monad f => Free f a -> f a
    toFreeT   :: (Functor f, Monad m) => Free f a -> Control.Monad.Trans.Free.FreeT f m a
    unfold    :: Functor f => (b -> Either a (f b)) -> b -> Free f a
    unfoldM   :: (Traversable f, Monad m) => (b -> m (Either a (f b))) -> b -> m (Free f a)

    -------------------------------

    :browse Control.Monad.Trans.Free

    type Free f = FreeT f Identity

    -- FreeF is for internal usage, and usually need not to be used by user
    data FreeF f a b = Pure a | Free (f b)

    newtype FreeT f m a = FreeT {runFreeT :: m (FreeF f a (FreeT f m a))}

    cutoff :: (Functor f, Monad m) => Integer -> FreeT f m a -> FreeT f m (Maybe a)
    foldFreeT :: (MonadTrans t, Monad (t m), Monad m) =>
      (forall (n :: * -> *) x. Monad n => f x -> t n x) -> FreeT f m a -> t m a

    free :: FreeF f a (Free f a) -> Free f a
    hoistFreeT :: (Functor m, Functor f) => (forall a. m a -> n a) -> FreeT f m b -> FreeT f n b
    intercalateT ::
      (Monad m, MonadTrans t, Monad (t m)) => t m a -> FreeT (t m) m b -> t m b
    intersperseT :: (Monad m, Functor f) => f a -> FreeT f m b -> FreeT f m b
    iterT :: (Functor f, Monad m) => (f (m a) -> m a) -> FreeT f m a -> m a
    iterTM :: (Functor f, Monad m, MonadTrans t, Monad (t m)) =>
      (f (t m a) -> t m a) -> FreeT f m a -> t m a
    joinFreeT :: (Monad m, Traversable f) => FreeT f m a -> m (Free f a)
    partialIterT :: Monad m =>
      Integer -> (forall a. f a -> m a) -> FreeT f m b -> FreeT f m b
    retractT :: (MonadTrans t, Monad (t m), Monad m) => FreeT (t m) m a -> t m a
    runFree :: Free f a -> FreeF f a (Control.Monad.Trans.Free.Free f a)
    transFreeT :: (Monad m, Functor g) => (forall a. f a -> g a) -> FreeT f m b -> FreeT g m b

