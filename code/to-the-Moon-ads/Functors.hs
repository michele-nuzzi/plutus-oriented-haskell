

{-
:i Functor
type Functor :: (* -> *) -> Constraint
class Functor f where
  fmap :: (a -> b) -> f a -> f b
  (<$) :: a -> f b -> f a
  {-# MINIMAL fmap #-}
-}

{-
UTILS

import Data.Functor

:t ($>) :: f b -> a -> f a

:t (<$>) :: (a -> b) -> f a -> f b

-}

{-

FUNCTORS

are containers, as we can assume from the kind (* -> *),
that are able to apply functions to the values they contain

-}













------------------- examples -------------------
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}


map_is_fmap_spefic_for_lists =

    fmap (+2) [1,2,3] -- -> [2,3,4]

but_fmap_is_more_generic =

    fmap (+2) (Just 2) -- -> Just 4

fmap_has_an_equivalent_operator =

    (+2) <$> [1,2,3] -- -> [2,3,4]

we_can_copy_exsisting_functors_on_top_of_values =

    2 <$ Just "string" -- -> Just 2
