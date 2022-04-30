
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


instance Applicative (Logger a) where

    pure value = Logger [] value

    -- we assume, even if not necessarelly true in Applicatives,
    -- that if the function in the Logger context has log messages
    -- then those happened before,
    --
    -- since we are adding new messages at the beginning (top) of the log
    -- any message from the context of the function goes on the end (bottom)
    (<*>) (Logger funcMessages func) (Logger messages value) =
        
        Logger (messages ++ funcMessages) $ func value

    -- notice how the side effects are handled by this fuction (by adding the messages),
    -- therefore hidden to the end user

    -- const <$> pure 2 <*> (logMessage "hello")
    --
    -- remember that
    --
    -- const 2 <any value> -- -> 2