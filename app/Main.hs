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
import qualified Network.Wai.Handler.Warp as Warp
import Network.Wai.Middleware.Cors (cors, simpleCorsResourcePolicy, corsRequestHeaders)
import Network.Wai.Middleware.Servant.Options (provideOptions)

main :: IO ()
main = do
    putStrLn "Listening on port 8080"
    Warp.run 8080
         $ cors (const $ Just policy)
         $ provideOptions jsonAPI
         $ serve api server
       where
         policy = simpleCorsResourcePolicy
                    { corsRequestHeaders = [ "content-type" ] }

