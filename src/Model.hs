{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE DeriveGeneric #-}
module Model where

import Data.Text(Text)
import Data.Char(toLower)
import Servant
import Data.Aeson (FromJSON, ToJSON)
import Data.Aeson.TH
import GHC.Generics(Generic)
import Elm (ElmType)
import Web.Internal.FormUrlEncoded (FromForm)


type Markdown = Text
data Site = Site 
            { owner :: Owner
            }

data Owner = Owner 
            { ownerName :: Text
            , ownerScreenName :: Text
            , snsAccounts :: [SNSAccount]
            }

data SNSAccount = SNSAccount
           { screenName :: Text
           , accountURL  :: URI
           , serviceIcon :: URI
           , accountIcon :: URI
           }

data Page = Page
           { pageTitle :: Text
           , pageBody :: Markdown
           } deriving (Generic, Show)
$(deriveJSON defaultOptions{fieldLabelModifier = drop 4, constructorTagModifier = map toLower} ''Page)
instance FromForm Page
instance ElmType Page
type MainPage = Page
