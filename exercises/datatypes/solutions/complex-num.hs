


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


instance Num Complex where
    (+) c1 c2 = Complex (real c1 + real c2) (imaginary c1 + imaginary c2)

    (*) (Im i1) (Im i2) = Re $ - (i1 * i2)
    (*) c1 c2 =
            Re (real c1 * real c2)                  +
            Im (real c1 * imaginary c2)            +
            Im (real c2 * imaginary c1)            +
            Im (imaginary c1) * Im (imaginary c2)

    negate c = Complex (- real c) (- imaginary c)

    fromInteger int = Re $ fromIntegral int

    -- this would be the correct implementation of ```abs```
    -- however it requies ```n``` to be also a ```Floating``` instance
    -- since it is required form the return type of ```sqrt```
    -- abs complex = Re $ sqrt ( ( real complex ** 2 ) + ( imaginary complex  ** 2 ) )

    abs complex = Complex (abs $ real complex) ( abs $ imaginary complex )

    -- it returns -1 for negative numbers, 0 for zero, and 1 for positive numbers
    -- we assume it for reals
    signum compelx = Re $ signum $ real compelx
