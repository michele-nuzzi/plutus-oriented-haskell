

data Complex n = Re n | Im n | Complex n n

real :: (Num n, Show n) => Complex n -> n
real (Re r)          = r
real (Im _i)         = 0
real (Complex r _i ) = r

imaginary :: (Num n, Show n) => Complex n -> n
imaginary (Re _r)        = 0
imaginary (Im i)         = i
imaginary (Complex _r i) = i

i :: (Num n, Show n) => Complex n
i = Im 1

complexFromTuple :: (Num n, Show n) => ( n, n ) -> Complex n
complexFromTuple ( r, i ) = Complex r i


instance (Num n, Show n) => Show (Complex n) where
    show c = show (real c) ++ "+" ++ show (imaginary c) ++ "i"
{-
alternative valid solution

instance Show Complex where
    show (Re r)         = show r    ++ "+0i"
    show (Im i)         = "0+"      ++ show i   ++ "i"
    show (Complex r i ) = show r    ++ "+"      ++ show i ++ "i"
-}

instance (Num n, Show n) => Num (Complex n) where
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
