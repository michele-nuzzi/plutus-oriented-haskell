
-------------------------- datatype definition --------------------------

data Logger logMessageTy valueTy = Logger [logMessageTy] valueTy

type StringLogger a = Logger String a

----- utilities for ghci -----

instance (Show a, Show b) => Show ( Logger a b ) where
    show ( Logger messages value ) =
        "{" ++
        show value ++ "; " ++
        show messages ++
        "}"

logMessage ::
        -- message to log
        logMessageTy
        -- resulting logger sideEffect
     -> Logger logMessageTy ()

logMessage someNewMessage = Logger [someNewMessage] ()

-------------------------------------------------------------------------


instance Functor ( Logger a ) where
    -- recall that Functors are not meant to have side effects
    -- just implementing the functions that makes a container a functor

    fmap func (Logger messages value) = Logger messages (func value)
