{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use null" #-}

addTwos :: [Int] -> [Int]
addTwos list = 
    if list == [] then
        []
    else
        head list + 2 : addTwos (tail list)

addTwosPatternMatching :: [Int] -> [Int]
addTwosPatternMatching [] = []
addTwosPatternMatching ( listElem : restOfTheList ) = listElem + 2 : addTwosPatternMatching restOfTheList