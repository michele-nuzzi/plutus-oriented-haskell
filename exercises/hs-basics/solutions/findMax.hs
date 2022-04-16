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


findMaxGuarded :: [Int] -> Int
findMaxGuarded [] = 0
findMaxGuarded [n] = n
findMaxGuarded ( fst : restOfList )
    | fst >= findMaxGuarded restOfList  = fst
    -- otherwise always evaluates to True
    |  otherwise                        = findMaxGuarded restOfList


findMaxOptimized :: [Int] -> Int
findMaxOptimized [] = 0
findMaxOptimized ( fst : restOfList ) =
    if fst >= restMax
        then fst
    else
        restMax
    where
        !restMax = findMaxOptimized restOfList