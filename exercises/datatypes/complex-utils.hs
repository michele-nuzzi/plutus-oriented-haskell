data Complex = Re Double | Im Double | Complex Double Double 

-- extract the real part
real :: Complex -> Double
real complex = undefined

-- extract the imaginary part
imaginary :: Complex -> Double
imaginary complex = undefined


i :: Complex
i = Im 1

complexFromTuple :: (Double, Double) -> Complex
complexFromTuple ( r, i ) = Complex r i