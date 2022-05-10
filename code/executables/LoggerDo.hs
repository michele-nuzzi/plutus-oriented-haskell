
{-
JUMP TO LINE 78
-}


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


instance Monad (Logger a) where
    return =  pure

    -- same idea of the apply, the messages from loggerA should go to the end of the logs
    (>>=) ( Logger messagesA fstValue ) funcToLoggerB =
        let
            -- here happens the magic
            ( Logger messagesB returnValue ) = funcToLoggerB fstValue
        in
            Logger (messagesB ++ messagesA) returnValue

    (>>) loggerA loggerB = loggerA >>= const loggerB


addLoggerTwo :: Num n => StringLogger n -> StringLogger n
addLoggerTwo loggerNum =
    loggerNum >>= (\ n ->
        logMessage "adding two to the input" >>
        return (n + 2)
    )

noisyAddAndSquare :: (Num n, Show n) => StringLogger n -> StringLogger n -> StringLogger n
noisyAddAndSquare logA logB =
    logA >>= (\ n ->
        logMessage ("got input: " ++ show n) >>

        logB >>= (\ m ->
            logMessage ("got input: " ++ show m) >>

            logMessage ( "addition result : " ++ show (n + m) ) >>
            logMessage ( "square result : " ++ show ( square $ n + m ) ) >>

            return ( square (n + m) )
        )
    )
    where
        square :: Num n => n -> n
        square num = num * num


noisyAddAndSquareDo :: (Num n, Show n) => StringLogger n -> StringLogger n -> StringLogger n
noisyAddAndSquareDo logA logB = do
    a <- logA
    logMessage ("got input: " ++ show a)

    b <- logB
    logMessage ("got input: " ++ show b)

    let addedValue = a + b

    logMessage ( "addition result : " ++ show addedValue)
    logMessage ( "square result : " ++ show ( square addedValue ) )

    return $ square addedValue
    where
        square :: Num n => n -> n
        square num = num * num

