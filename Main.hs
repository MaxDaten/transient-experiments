module Main where

import Control.Monad.IO.Class (liftIO)
import Control.Applicative
import Transient.Base
import Transient.Move
import Transient.Move.Utils
import Transient.Indeterminism (choose, collect)
import Control.Concurrent (threadDelay)
import GHCJS.HPlay.View


main = keep . initNode $ webFib

webFib = onBrowser $ do
    local . render $  wlink () (h1 "hello fibonacci numbers")

    r <-  atRemote $ do
                r <- local . threads 1 . choose $ take 10 fibs
                localIO $ print r
                localIO $ threadDelay 1000000
                return r

    local . render . rawHtml $ (h2 r)
    where
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs) :: [Int]