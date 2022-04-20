{-# LANGUAGE BangPatterns #-}

{--

given a list of positive integers
write a function that returns the max element

--}

findMax :: [Int] -> Int
findMax [] = 0
findMax [n] = n
findMax ( fst : restOfList ) =
    if fst >= findMax restOfList
        then fst
    else
        findMax restOfList


findMaxWithPartialResult :: [Int] -> Int
findMaxWithPartialResult [] = 0
findMaxWithPartialResult [n] = n
findMaxWithPartialResult ( fst : restOfList ) =
    if fst >= restMax
        then fst
    else
        restMax
    where
        restMax = findMaxWithPartialResult restOfList 


findMaxOptimized :: [Int] -> Int
findMaxOptimized [] = 0
findMaxOptimized [n] = n
findMaxOptimized ( fst : restOfList ) =
    let
        !restMax = findMaxOptimized restOfList
    in
        if fst >= restMax
            then fst
        else
            restMax
            