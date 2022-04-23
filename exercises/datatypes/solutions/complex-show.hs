

data Complex = Re Double | Im Double | Complex Double Double 

real :: Complex -> Double
real (Re r)          = r
real (Im _i)         = 0
real (Complex r _i ) = r

imaginary :: Complex -> Double
imaginary (Re _r)        = 0
imaginary (Im i)         = i
imaginary (Complex _r i) = i

i :: Complex
i = Im 1

complexFromTuple :: (Double, Double) -> Complex
complexFromTuple ( r, i ) = Complex r i


instance Show Complex where
    show c = show (real c) ++ "+" ++ show (imaginary c) ++ "i"

{-
alternative valid solution

instance Show Complex where
    show (Re r)         = show r    ++ "+0i"
    show (Im i)         = "0+"      ++ show i   ++ "i"
    show (Complex r i ) = show r    ++ "+"      ++ show i ++ "i"
-}