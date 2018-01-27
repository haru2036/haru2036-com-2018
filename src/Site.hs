{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Site where

import Servant
import Servant.API
import Model
import Data.Proxy (Proxy (..))
import Elm (ElmType)
import GHC.Generics (Generic)
import Web.Internal.FormUrlEncoded (FromForm)


mainPage = Page "test" "`hogehogehogeho-"

server :: Server API
server = pure mainPage

type API = "api" :> Get '[JSON] Page

api :: Proxy API
api = Proxy
