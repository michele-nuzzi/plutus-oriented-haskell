
--   return :: a -> m a
--   (>>) :: m a -> m b -> m b

{-
:i Monad
type Monad :: (* -> *) -> Constraint
class Applicative m => Monad m where
  (>>=) :: m a -> (a -> m b) -> m b

  (>>) :: m a -> m b -> m b
  (>>) monadA monadB = monadA >>= (\ _ -> monadB )
  -- (>>) monadA monadB = monadA >>= const monadB

  return :: a -> m a
  {-# MINIMAL (>>=) #-}
-}
