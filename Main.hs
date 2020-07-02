module Main where

import Control.Monad.IO.Class (liftIO)
import Control.Applicative
import Transient.Base
import Transient.Move
import Transient.Move.Utils
import Transient.Indeterminism (choose, collect)


main = keep $ initNode $ inputNodes <|> distribStream

distribStream = do
    local $ option "fire" "fire"
    r <- clustered $ local $ choose $ repeat "hello world"
    localIO $ print r