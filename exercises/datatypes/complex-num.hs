
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

-- instance ... where
    -- show complex = ...


-- make the ```Complex``` datatype an instance of the ```Num``` typeclass

instance Num Complex where

    -- (a+bi) + (c+di) = ( (a+c) + (b+d)i )
    (+) c1 c2 = undefined

    -- (a+bi) * (c+di) = a*c + a*di + bi*c + bi*di
    -- i * i = i^2 = -1
    (*) c1 c2 = undefined

    -- -(a+bi) = (-a-bi)
    negate c  = undefined 

    fromInteger int = Re $ fromIntegral int

    -- this would be the correct implementation of ```abs```
    -- however it requies ```n``` to be also a ```Floating``` instance
    -- since it is required form the return type of ```sqrt```
    -- abs complex = Re $ sqrt ( ( real complex ** 2 ) + ( imaginary complex  ** 2 ) )

    abs complex = Complex (abs $ real complex) ( abs $ imaginary complex )

    -- it returns -1 for negative numbers, 0 for zero, and 1 for positive numbers
    -- we assume it for reals
    signum compelx = Re $ signum $ real compelx
