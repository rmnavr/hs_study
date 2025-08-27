
    import Lens.Micro
    import Lens.Micro.Extras (view, preview)

    -- FUNCTIONS LIST:

        &   :: a -> (a -> b) -> b   -- reverse applicator (for convenience)
        %~	over	                -- [ASetter] modify value
        .~  set                     -- [ASetter] set value
        ^. 	view	                -- [Getting] get value
        ^?	preview	                -- [Getting] maybe get value (x1)
        ^..	toListOf	            -- [Getting] get values (xN)
        <>~                         -- [ASetter] append monoidically

        each                        -- Traversal
        ix                          -- Traversal'
        filtered                    -- Traversal'

        _1                          -- Lens
        _2                          -- Lens
        _3                          -- Lens
        _4                          -- Lens
        _5                          -- Lens
        _Just                       -- ..
        _Nothing                    -- ..
        _Left       
        _Right

        _head
        _tail
        _init
        _last

        -- to be done:
        to
        at
        anyOf
        allOf
        noneOf
        has



    -- EXAMPLES:

        5 & (+1) & show

        -- those 2 are the same:
        (1, 2, 3) & (_1 .~ "riba") & (_3 %~ negate)
        (_1 .~ "riba") $ (_3 %~ negate) $ (1, 2, 3) 

        -- all 4 are the same:
        [[1, 2, 3], [4, 5, 6]] &   each .  each %~ (* 2)
        each .  each %~ (* 2) $ [[1, 2, 3], [4, 5, 6]]
        over (each . each) (* 2) [[1, 2, 3], [4, 5, 6]]
        [[1, 2, 3], [4, 5, 6]] & over (each . each) (* 2) 

        [[1, 2, 3], [4, 5, 6]] &   ix 1 .  ix 1 %~ (*10)
        [[1, 2, 3], [4, 5, 6]] &   ix 1 .  each %~ (*100)
        [[1, 2, 3], [4, 5, 6]] &   ix 0 .~ [10, 100, 1000]      -- [[10, 100, 1000], [4, 5, 6]]
        [[1, 2, 3], [4, 5, 6]] ^?  ix 0 . ix 0                  -- Just 1
        [[1, 2, 3], [4, 5, 6]] ^?  each . each . filtered (>1)  -- Maybe gives first found elem
        [[1, 2, 3], [4, 5, 6]] ^.. each . each . filtered (>1)  -- gives all found elems

        [(1,2), (3,4)] & each . _1 %~ (*2)    -- modifies 1st elem of tuple
        ((1,2), 3) & _1 . _2 .~ 10            -- ((1,10), 3), _1 is in 1-based index

        [Just 1, Nothing, Just 5] ^.. each . _Just
        [Just 1, Nothing, Just 5] & each . _Just %~ (*10)
        Just 8 & _Just %~ (*2)

        [1, 2, 3] ^? _head              -- Just 1
        [1, 2, 3] ^? _tail              -- Just [2, 3]
        [1, 2, 3] ^? _init              -- Just [1, 2]
        [1, 2, 3] & _last %~ (*10)      -- [1, 2, 30]

    -- DEFINING LENS FOR RECORDS (BY HAND):

        data Person  = Person { name :: String, address :: String } deriving Show

        nameL :: Lens' Person String 
        nameL f (Person n a) = (\_n -> Person _n a) <$> f n

        addressL :: Lens' Person String 
        addressL f (Person n a) = (\_a -> Person n _a) <$> f a

        (Person "Bubr" "Here") ^. nameL

        (Person "Bubr" "Here") & nameL .~ "Riba"
        (Person "Bubr" "Here") & nameL <>~ " (not Riba)" & addressL <>~ " (not There)"


