
{-
define a fuction "trueForAll" such that
given a list of any type and
given a function that takes an element of a list returns a boolean

returns True only if all the elements returns true once passed into the function
    False otherwise
-}
trueForAll :: ( a -> Bool ) -> [a] -> Bool
trueForAll _unusedPredicate [] = True
trueForAll predicate ( listElem : list ) = predicate listElem && trueForAll predicate list