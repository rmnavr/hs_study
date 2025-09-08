
-- Info ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

	-- https://www.haskell.org/onlinereport/basic.html
	-- Predefined Types and (type)-Classes (in Prelude module):


-- ____________________________________________________________________________/ }}}1
-- Vim syntax check ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

	-- Syntax Coloring:

        Int			-- type
        Integral	-- type class
        Nothing		-- (value-)constructor

    -- user names:

        func :: a -> b

        data Pups a = MakePups { name :: String a } 
        newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)  
        type Assoc k v = [(k, v)]

        data Container a where
            Smth :: a -> Container a

        class MV a where
            method1 :: a -> Int
            method2 :: a -> String

        class Num a => MV a where
            method1 :: a -> Int

        instance MV Int where
            method1 x = x * 2
            method2 x = show x

    -- known keywords:

        chunksOf :: Int -> Text -> [Text]

        data Maybe a = Nothing | Just a
        newtype IO a = GHC.Types.IO (GHC.Prim.State# GHC.Prim.RealWorld ... )
        type Maybe :: * -> *

        type (~) :: forall k. k -> k -> Constraint
        class (a ~ b) => (~) a b where ...

        class (Real a, Enum a) => Integral a where ...
        class Fractional a => Floating a where ...
        instance Eq (Maybe m) where ...
        instance (Eq m) => Eq (Maybe m) where


-- ____________________________________________________________________________/ }}}1

    -- :browse GHC.Base gives very big output with stuff like:
    -- «ghc-prim-0.9.1:GHC.Prim.compareByteArrays# ::»

-- Prelude Types — short Summary ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

	-- Types:

		[1, 2]      -- list
		(1, 2, 'c') -- tuple
		()          -- unit data-type, used as null-constructor
		a -> b      -- functions

		Int		    -- bounded
		Word	    -- same as Int, but unsigned; same size as Int
		Integer     -- unbounded
		Float
		Double
        Rational

		Bool        = False | True
		Char
		String
        FilePath

		Maybe a		= Nothing | Just a
		Either a b	= Left a | Right b
		Ordering	= LT | EQ | GT

		IO
		IOError

        ReadS
        ShowS

	-- Typeclasses:

		Num			-- Int, Integer, Word, Float, Double
		Real		-- Int, Integer, Word, Float, Double
		Integral	-- Int, Integer, Word
		Fractional	--					   Float, Double
		Floating	--					   Float, Double
		RealFrac	--					   Float, Double
		RealFloat	--					   Float, Double
		--
		Eq
		Ord         -- activates comparisons: <, >, ==
		Show                                           
		Read                                           
		Enum        -- activates succ/pred
		Bounded     -- activates minBound, maxBound
		--
        Monoid
        Semigroup
        Foldable
        Traversable
        --
        Functor
        Applicative
        Monad
        MonadFail

-- ____________________________________________________________________________/ }}}1

-- result of :browse Prelude
-- Functions ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    (!!) :: GHC.Stack.Types.HasCallStack => [a] -> Int -> a
    ($) :: (a -> b) -> a -> b
    ($!) :: (a -> b) -> a -> b
    (&&) :: Bool -> Bool -> Bool
    (++) :: [a] -> [a] -> [a]
    (.) :: (b -> c) -> (a -> b) -> a -> c
    (<$>) :: Functor f => (a -> b) -> f a -> f b
    (=<<) :: Monad m => (a -> m b) -> m a -> m b
    (||) :: Bool -> Bool -> Bool
    (^) :: (Num a, Integral b) => a -> b -> a
    (^^) :: (Fractional a, Integral b) => a -> b -> a

    all :: Foldable t => (a -> Bool) -> t a -> Bool
    and :: Foldable t => t Bool -> Bool
    any :: Foldable t => (a -> Bool) -> t a -> Bool
    appendFile :: FilePath -> String -> IO ()
    asTypeOf :: a -> a -> a
    break :: (a -> Bool) -> [a] -> ([a], [a])
    concat :: Foldable t => t [a] -> [a]
    concatMap :: Foldable t => (a -> [b]) -> t a -> [b]
    const :: a -> b -> a
    curry :: ((a, b) -> c) -> a -> b -> c
    cycle :: GHC.Stack.Types.HasCallStack => [a] -> [a]
    drop :: Int -> [a] -> [a]
    dropWhile :: (a -> Bool) -> [a] -> [a]
    either :: (a -> c) -> (b -> c) -> Either a b -> c
    error :: GHC.Stack.Types.HasCallStack => [Char] -> a
    errorWithoutStackTrace :: [Char] -> a
    even :: Integral a => a -> Bool
    filter :: (a -> Bool) -> [a] -> [a]
    flip :: (a -> b -> c) -> b -> a -> c
    fromIntegral :: (Integral a, Num b) => a -> b
    fst :: (a, b) -> a
    gcd :: Integral a => a -> a -> a
    getChar :: IO Char
    getContents :: IO String
    getLine :: IO String
    head :: GHC.Stack.Types.HasCallStack => [a] -> a
    id :: a -> a
    init :: GHC.Stack.Types.HasCallStack => [a] -> [a]
    interact :: (String -> String) -> IO ()
    ioError :: IOError -> IO a
    iterate :: (a -> a) -> a -> [a]
    last :: GHC.Stack.Types.HasCallStack => [a] -> a
    lcm :: Integral a => a -> a -> a
    lex :: ReadS String
    lines :: String -> [String]
    lookup :: Eq a => a -> [(a, b)] -> Maybe b
    map :: (a -> b) -> [a] -> [b]
    mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
    maybe :: b -> (a -> b) -> Maybe a -> b
    not :: Bool -> Bool
    notElem :: (Foldable t, Eq a) => a -> t a -> Bool
    odd :: Integral a => a -> Bool
    or :: Foldable t => t Bool -> Bool
    otherwise :: Bool
    print :: Show a => a -> IO ()
    putChar :: Char -> IO ()
    putStr :: String -> IO ()
    putStrLn :: String -> IO ()
    read :: Read a => String -> a
    readFile :: FilePath -> IO String
    readIO :: Read a => String -> IO a
    readLn :: Read a => IO a
    readParen :: Bool -> ReadS a -> ReadS a
    reads :: Read a => ReadS a
    realToFrac :: (Real a, Fractional b) => a -> b
    repeat :: a -> [a]
    replicate :: Int -> a -> [a]
    reverse :: [a] -> [a]
    scanl :: (b -> a -> b) -> b -> [a] -> [b]
    scanl1 :: (a -> a -> a) -> [a] -> [a]
    scanr :: (a -> b -> b) -> b -> [a] -> [b]
    scanr1 :: (a -> a -> a) -> [a] -> [a]
    seq :: a -> b -> b
    sequence_ :: (Foldable t, Monad m) => t (m a) -> m ()
    showChar :: Char -> ShowS
    showParen :: Bool -> ShowS -> ShowS
    showString :: String -> ShowS
    shows :: Show a => a -> ShowS
    snd :: (a, b) -> b
    span :: (a -> Bool) -> [a] -> ([a], [a])
    splitAt :: Int -> [a] -> ([a], [a])
    subtract :: Num a => a -> a -> a
    tail :: GHC.Stack.Types.HasCallStack => [a] -> [a]
    take :: Int -> [a] -> [a]
    takeWhile :: (a -> Bool) -> [a] -> [a]
    uncurry :: (a -> b -> c) -> (a, b) -> c
    undefined :: GHC.Stack.Types.HasCallStack => a
    unlines :: [String] -> String
    until :: (a -> Bool) -> (a -> a) -> a -> a
    unwords :: [String] -> String
    unzip :: [(a, b)] -> ([a], [b])
    unzip3 :: [(a, b, c)] -> ([a], [b], [c])
    userError :: String -> IOError
    words :: String -> [String]
    writeFile :: FilePath -> String -> IO ()
    zip :: [a] -> [b] -> [(a, b)]
    zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
    zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
    zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]

-- ____________________________________________________________________________/ }}}1
-- Basic Types ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    -- type equality or smth
    type (~) :: forall k. k -> k -> Constraint
    class (a ~ b) => (~) a b where ...

    type IO :: * -> *
    newtype IO a
      = GHC.Types.IO (GHC.Prim.State# GHC.Prim.RealWorld
                      -> (# GHC.Prim.State# GHC.Prim.RealWorld, a #))

    type IOError :: *
    type IOError = GHC.IO.Exception.IOException

    type Bool :: *
    data Bool = False | True

    type Char :: *
    data Char = GHC.Types.C# GHC.Prim.Char#

    type Double :: *
    data Double = GHC.Types.D# GHC.Prim.Double#

    type String :: *
    type String = [Char]

    type Word :: *
    data Word = GHC.Types.W# GHC.Prim.Word#


    type FilePath :: *
    type FilePath = String

    type Int :: *
    data Int = GHC.Types.I# GHC.Prim.Int#

    type Integer :: *
    data Integer
        = GHC.Num.Integer.IS GHC.Prim.Int#
        | GHC.Num.Integer.IP GHC.Prim.ByteArray#
        | GHC.Num.Integer.IN GHC.Prim.ByteArray#

    type Integral :: * -> Constraint
    class (Real a, Enum a) => Integral a where
        quot :: a -> a -> a
        rem :: a -> a -> a
        div :: a -> a -> a
        mod :: a -> a -> a
        quotRem :: a -> a -> (a, a)
        divMod :: a -> a -> (a, a)
        toInteger :: a -> Integer
        {-# MINIMAL quotRem, toInteger #-}

    class Num a => Fractional a where
        (/) :: a -> a -> a
        recip :: a -> a
        fromRational :: Rational -> a
        {-# MINIMAL fromRational, (recip | (/)) #-}

    type Floating :: * -> Constraint
    type Float :: *
    data Float = GHC.Types.F# GHC.Prim.Float#

    type Fractional :: * -> Constraint
    class Fractional a => Floating a where
        pi :: a
        exp :: a -> a
        log :: a -> a
        sqrt :: a -> a
        (**) :: a -> a -> a
        logBase :: a -> a -> a
        sin :: a -> a
        cos :: a -> a
        tan :: a -> a
        asin :: a -> a
        acos :: a -> a
        atan :: a -> a
        sinh :: a -> a
        cosh :: a -> a
        tanh :: a -> a
        asinh :: a -> a
        acosh :: a -> a
        atanh :: a -> a
        GHC.Float.log1p :: a -> a
        GHC.Float.expm1 :: a -> a
        GHC.Float.log1pexp :: a -> a
        GHC.Float.log1mexp :: a -> a
        {-# MINIMAL pi, exp, log, sin, cos, asin, acos, atan, sinh, cosh, asinh, acosh, atanh #-}



    type Num :: * -> Constraint
    class Num a where
        (+) :: a -> a -> a
        (-) :: a -> a -> a
        (*) :: a -> a -> a
        negate :: a -> a
        abs :: a -> a
        signum :: a -> a
        fromInteger :: Integer -> a
        {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}



    type Rational :: *
    type Rational = GHC.Real.Ratio Integer

    type Real :: * -> Constraint
    class (Num a, Ord a) => Real a where
        toRational :: a -> Rational
        {-# MINIMAL toRational #-}


    type RealFloat :: * -> Constraint
    class (RealFrac a, Floating a) => RealFloat a where
        floatRadix :: a -> Integer
        floatDigits :: a -> Int
        floatRange :: a -> (Int, Int)
        decodeFloat :: a -> (Integer, Int)
        encodeFloat :: Integer -> Int -> a
        exponent :: a -> Int
        significand :: a -> a
        scaleFloat :: Int -> a -> a
        isNaN :: a -> Bool
        isInfinite :: a -> Bool
        isDenormalized :: a -> Bool
        isNegativeZero :: a -> Bool
        isIEEE :: a -> Bool
        atan2 :: a -> a -> a
        {-# MINIMAL floatRadix, floatDigits, floatRange, decodeFloat,
                    encodeFloat, isNaN, isInfinite, isDenormalized, isNegativeZero,
                    isIEEE #-}


    type RealFrac :: * -> Constraint
    class (Real a, Fractional a) => RealFrac a where
        properFraction :: Integral b => a -> (b, a)
        truncate :: Integral b => a -> b
        round :: Integral b => a -> b
        ceiling :: Integral b => a -> b
        floor :: Integral b => a -> b
        {-# MINIMAL properFraction #-}

    type Ord :: * -> Constraint
    class Eq a => Ord a where
        compare :: a -> a -> Ordering
        (<) :: a -> a -> Bool
        (<=) :: a -> a -> Bool
        (>) :: a -> a -> Bool
        (>=) :: a -> a -> Bool
        max :: a -> a -> a
        min :: a -> a -> a
        {-# MINIMAL compare | (<=) #-}

    type Ordering :: *
    data Ordering = LT | EQ | GT

    type Bounded :: * -> Constraint
    class Bounded a where
        minBound :: a
        maxBound :: a
        {-# MINIMAL minBound, maxBound #-}

    type Enum :: * -> Constraint
    class Enum a where
        succ :: a -> a
        pred :: a -> a
        toEnum :: Int -> a
        fromEnum :: a -> Int
        enumFrom :: a -> [a]
        enumFromThen :: a -> a -> [a]
        enumFromTo :: a -> a -> [a]
        enumFromThenTo :: a -> a -> a -> [a]
        {-# MINIMAL toEnum, fromEnum #-}

    type Eq :: * -> Constraint
    class Eq a where
        (==) :: a -> a -> Bool
        (/=) :: a -> a -> Bool
        {-# MINIMAL (==) | (/=) #-}


-- ____________________________________________________________________________/ }}}1
-- Functor types (Foldable, Functor, Monad, ...) ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    type Either :: * -> * -> *
    data Either a b = Left a | Right b

    type Maybe :: * -> *
    data Maybe a = Nothing | Just a

    type Foldable :: (* -> *) -> Constraint
    class Foldable t where
        Data.Foldable.fold :: Monoid m => t m -> m
        foldMap :: Monoid m => (a -> m) -> t a -> m
        Data.Foldable.foldMap' :: Monoid m => (a -> m) -> t a -> m
        foldr :: (a -> b -> b) -> b -> t a -> b
        Data.Foldable.foldr' :: (a -> b -> b) -> b -> t a -> b
        foldl :: (b -> a -> b) -> b -> t a -> b
        Data.Foldable.foldl' :: (b -> a -> b) -> b -> t a -> b
        foldr1 :: (a -> a -> a) -> t a -> a
        foldl1 :: (a -> a -> a) -> t a -> a
        Data.Foldable.toList :: t a -> [a]
        null :: t a -> Bool
        length :: t a -> Int
        elem :: Eq a => a -> t a -> Bool
        maximum :: Ord a => t a -> a
        minimum :: Ord a => t a -> a
        sum :: Num a => t a -> a
        product :: Num a => t a -> a
        {-# MINIMAL foldMap | foldr #-}

    type Traversable :: (* -> *) -> Constraint
    class (Functor t, Foldable t) => Traversable t where
        traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
        sequenceA :: Applicative f => t (f a) -> f (t a)
        mapM :: Monad m => (a -> m b) -> t a -> m (t b)
        sequence :: Monad m => t (m a) -> m (t a)
        {-# MINIMAL traverse | sequenceA #-}

    type Semigroup :: * -> Constraint
    class Semigroup a where
      (<>) :: a -> a -> a
        GHC.Base.sconcat :: GHC.Base.NonEmpty a -> a
        GHC.Base.stimes :: Integral b => b -> a -> a
        {-# MINIMAL (<>) | sconcat #-}

    type Monoid :: * -> Constraint
    class Semigroup a => Monoid a where
        mempty :: a
        mappend :: a -> a -> a
        mconcat :: [a] -> a
        {-# MINIMAL mempty | mconcat #-}

    type Functor :: (* -> *) -> Constraint
    class Functor f where
        fmap :: (a -> b) -> f a -> f b
        (<$) :: a -> f b -> f a
        {-# MINIMAL fmap #-}

    type Applicative :: (* -> *) -> Constraint
    class Functor f => Applicative f where
        pure :: a -> f a
        (<*>) :: f (a -> b) -> f a -> f b
        liftA2 :: (a -> b -> c) -> f a -> f b -> f c
        (*>) :: f a -> f b -> f b
        (<*) :: f a -> f b -> f a
        {-# MINIMAL pure, ((<*>) | liftA2) #-}

    type Monad :: (* -> *) -> Constraint
    class Applicative m => Monad m where
        (>>=) :: m a -> (a -> m b) -> m b
        (>>) :: m a -> m b -> m b
        return :: a -> m a
        {-# MINIMAL (>>=) #-}

    type MonadFail :: (* -> *) -> Constraint
    class Monad m => MonadFail m where
        fail :: String -> m a
        {-# MINIMAL fail #-}

-- ____________________________________________________________________________/ }}}1
-- Read/Show types ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1

    type Read :: * -> Constraint
    class Read a where
        readsPrec :: Int -> ReadS a
        readList :: ReadS [a]
        GHC.Read.readPrec :: Text.ParserCombinators.ReadPrec.ReadPrec a
        GHC.Read.readListPrec :: Text.ParserCombinators.ReadPrec.ReadPrec [a]
        {-# MINIMAL readsPrec | readPrec #-}

    type ReadS :: * -> *
    type ReadS a = String -> [(a, String)]

    type Show :: * -> Constraint
    class Show a where
        showsPrec :: Int -> a -> ShowS
        show :: a -> String
        showList :: [a] -> ShowS
        {-# MINIMAL showsPrec | show #-}

    type ShowS :: *
    type ShowS = String -> String

-- ____________________________________________________________________________/ }}}1

