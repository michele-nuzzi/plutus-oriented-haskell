
--   pure   :: a -> f a
--   (*>) :: f a -> f b -> f b

{-
:i Applicative
type Applicative :: (* -> *) -> Constraint
class Functor f => Applicative f where
  pure :: a -> f a
  
  (<*>) :: f (a -> b) -> f a -> f b
  liftA2 :: (a -> b -> c) -> (f a -> f b -> f c)

  (*>) :: f a -> f b -> f b
  (<*) :: f a -> f b -> f a
  {-# MINIMAL pure, ((<*>) | liftA2) #-}
-}


{-

APPLICATIVES

are FUNCTORS (containers that can use functions)

considered as "computational contex"

therefore abstracting a computation (which may vary depending on the container)

-}

import Text.Read ( readMaybe )

addStrings :: (Num n, Read n) => String -> String -> Maybe n
addStrings str1 str2 = (+) <$> strToNum str1 <*> strToNum str2
  where
    strToNum :: (Num n, Read n) => String -> Maybe n
    strToNum = readMaybe