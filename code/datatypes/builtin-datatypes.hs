

-- data Optional valueT = NoValue | SomeValue valueT
{-
:i Maybe
type Maybe :: * -> *
data Maybe a = Nothing | Just a
        -- Defined in ‘GHC.Maybe’
-}

unwrapMaybe :: Maybe any -> any -> any 
unwrapMaybe  Nothing defaultValue = defaultValue
unwrapMaybe (Just someValue) _default = someValue

{-
:i Either
type Either :: * -> * -> *
data Either a b = Left a | Right b
        -- Defined in ‘Data.Either’
-}

eitherIntOrStrList :: [Either Int String]
eitherIntOrStrList = [ Left 1, Right "hello", Left 3 , Left 4 ]

{-
:i (,)
type (,) :: * -> * -> *
data (,) a b = (,) a b
        -- Defined in ‘GHC.Tuple’
-}

getFirst :: ( a, b ) -> a
getFirst ( something, _useless )  = something

getSecond :: ( a, b ) -> b
getSecond ( _useless, somethingElse )  = somethingElse
