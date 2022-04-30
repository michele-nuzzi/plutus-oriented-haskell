{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Avoid lambda using `infix`" #-}


-- someLambda x y = x * y -- is equivalent

someLambda :: Integer -> Integer -> Integer
someLambda = \ x y -> x * y

addTwos :: [Int] -> [Int]
addTwos = map (\ n -> n + 2)


{-
:t const
const :: a -> b -> a

-- always returns the first argument, no matter what
-- ideal implementation

const chooseMe _ignored = chooseMe

-}
whateverTrue :: a -> Bool
whateverTrue = const True

-- whateverTrue someIgnoredValue = const True someIgnoredValue

{-
-- NOTE
-- 
-- just doing
   
   whateverTrue = True
   
-- doesn't work since the type signature becomes:
   
   whateverTrue :: Bool
   
-- which is of course different than the function:
   
   whateverTrue :: a -> Bool
   
-}

{-
:t id
id :: a -> a

-- just returns whatever it receives

id something = something

-}


{-
:t const id
const id :: b -> a -> a

-- always returns the SECOND argument, no matter what
-- ideal implementation

-- constId = const id
constId _ignored chooseMe = chooseMe

-- WHY?

const takes 2 arguments and returns the first
id takes 1 argument and returns it

in the ```const id``` expression
we always return ```id``` which is a function that takes one argument

therefore

const id someValue :: a -> a -- the id function indeed

ence

const id someValue someOtherValue 

is evaluated like

(const id someValue) someOtherValue
 id someOtherValue
 someOtherValue

-}


{-
:t flip
flip :: (a -> b -> c) -> b -> a -> c

-- should be read as

flip :: (a -> b -> c) -> ( b -> a -> c )

-- so is just an higher order function that given a function returns a new one that takes the argument flipped

-- ideal implementation

flip someBinaryFunc = (\ second first -> someBinaryFunc first second )

-}