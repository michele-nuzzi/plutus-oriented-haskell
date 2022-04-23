
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


-- make the ```Complex``` datatype an instance of the ```Show``` typeclass
-- show (Complex 2 1 ) -> "2+1i"
-- a+bi

-- instance ... where
    -- show complex = ...