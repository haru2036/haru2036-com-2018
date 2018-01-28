{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}

module Main where

import Site
import Control.Arrow (second)
import Control.Concurrent.STM (TVar, atomically, modifyTVar, newTVar, readTVar, writeTVar)
import Control.Monad.IO.Class (liftIO)
import Data.Aeson
import Data.IntMap (IntMap)
import qualified Data.IntMap as IntMap
import Data.Proxy (Proxy (..))
import qualified Network.Wai.Handler.Warp  as Warp
import Servant.API ((:<|>) (..), (:>), Get, Raw)
import Servant.EDE (HTML, loadTemplates)
import Servant.Server (Server, serve)
import Servant.Utils.StaticFiles (serveDirectoryFileServer)


main :: IO ()
main = do
    putStrLn "Listening on port 8080"
    Warp.run 8080 $ serve api server

