    
    -- code below is roughly taken from Haskell Design Patterns Chapter 1

    data Expr = Literal Float | Div Expr Expr

    data Try a = Error String | Return a deriving (Show)

    divTry :: Float -> Float -> Try Float
    divTry a b =  if   b == 0.0
                  then Error "I refuse to devide by 0, get lost"
                  else Return (a / b)

    instance Functor Try where
        fmap f (Error a)  = Error a
        fmap f (Return a) = Return (f a)


    instance Applicative Try where
        pure a                    = Return a
        (Error f) <*> _           = Error f
        _ <*> (Error f)           = Error f
        (Return f) <*> (Return a) = Return (f a)

    instance Monad Try where
        return = pure
        (Error  e) >>= _  = Error e
        (Return a) >>= f  = f a



    evalTryM :: Expr -> Try Float
    evalTryM (Literal a)  = Return a
    evalTryM (Div a b)    = do
                              a' <- (evalTryM a)
                              b' <- (evalTryM b)
                              divTry a' b'

    -- without sugar:
    -- evalTryM :: Expr -> Try Float
    -- evalTryM (Literal a)  = Return a
    -- evalTryM (Div a b)    = evalTryM a >>= 
    --                         (\a' -> (evalTryM b >>= (\b' -> divTry a' b')))

    -- check that Functor works (in ghci):
    fmap (*2) (Return 3)

    -- check that Applicative works (in ghci):
    (Return (*)) <*> (Return 3) <*> (Return 2)

    -- check that Monad works (in ghci):
    evalTryM (Div (Literal 3) (Literal 4))
    evalTryM (Div (Div (Literal 3) (Literal 0)) (Literal 0))

