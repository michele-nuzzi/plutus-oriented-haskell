

class Person genericPersonTy where

    name :: genericPersonTy -> String
    age  :: genericPersonTy -> Int


isOfLegalAge :: Person person => person -> Bool
isOfLegalAge person = age person >= 18

type Name = String
type Age  = Int

type UniversityName = String

data Student =
    Student Name Age UniversityName


type RestaurantName = String

data Chef =
    Chef Name Age RestaurantName


instance Person Student where
    name (Student studentName _ _ ) = studentName
    age  (Student _ studentAge  _ ) = studentAge

instance Person Chef where
    name (Chef chefName _ _ ) = chefName
    age  (Chef _ chefAge  _ ) = chefAge

