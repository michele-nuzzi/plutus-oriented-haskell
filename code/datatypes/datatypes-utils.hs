

data MyOwnList anyT =
    EmptyList |
    Cons anyT (MyOwnList anyT)

isEmpty :: MyOwnList any -> Bool 
isEmpty myOwnList =
    case myOwnList of
        EmptyList -> True
        Cons _ _ -> False


{-
data Person = Person String Int

name :: Person -> String
name (Person theName _ ) = theName

age :: Person -> Int
age (Person _ theAge) = theAge

-}
{--
data Person =
    Person {
        name :: String, 
        age :: Int
    }
--}
