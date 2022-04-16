{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use section" #-}
{-# HLINT ignore "Redundant bracket" #-}

-- "show" does the same 
nToString :: Int -> String
nToString n
    | n == 0 = "0"
    | n == 1 = "1"
    | n == 2 = "2"
    | n == 3 = "3"
    | n == 4 = "4"
    | n == 5 = "5"
    | n == 6 = "6"
    | n == 7 = "7"
    | n == 8 = "8"
    | n == 9 = "9"
    | otherwise = nToString (div n 10) ++  nToString (mod n 10) 


{--

λ> :t map
map :: (a -> b) -> [a] -> [b]

λ> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c

λ> :t ($)
($) :: (a -> b) -> a -> b
 
--}
addTwosAndThenStringIt :: [Int] -> [String]
addTwosAndThenStringIt = map $ nToString . (+ 2)