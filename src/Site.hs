{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Site where

import Servant
import Servant.EDE (HTML, loadTemplates)
import Servant.API
import Data.Aeson
import Model
import Data.Proxy (Proxy (..))
import Elm (ElmType)
import GHC.Generics (Generic)
import Web.Internal.FormUrlEncoded (FromForm)


mainPage = Page "test" "`hogehogehogeho-"

server :: Server API
server = pure mainPage
         :<|> serveDirectoryFileServer "static"
         :<|> pure mempty

type API = JSONAPI
        :<|> "static" :> Raw
        :<|> Get '[HTML "index.html"] Object
type JSONAPI = "api" :> Get '[JSON] Page

api :: Proxy API
api = Proxy

jsonAPI :: Proxy JSONAPI
jsonAPI = Proxy
