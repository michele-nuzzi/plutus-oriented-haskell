{-# LANGUAGE StandaloneKindSignatures #-}

type List :: * -> *
type List anyType = [anyType]

type MyOwnList :: * -> *
data MyOwnList anyT =
    EmptyList |
    Cons anyT (MyOwnList anyT)

myOwnListToStr :: MyOwnList any -> String 
myOwnListToStr  EmptyList = "EmptyList"
myOwnListToStr (Cons _someVal someList) = "someValue : " ++ myOwnListToStr someList

newtype WrappedList a = WrappedList [a]
