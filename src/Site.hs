module Site where

import Servant.API
import Data.Aeson (FromJSON, ToJSON)
import Data.Proxy (Proxy (..))
import Elm (ElmType)
import GHC.Generics (Generic)
import Servant.API
import Web.Internal.FormUrlEncoded (FromForm)

data Site = Site 
            { ownerName :: Text
            , ownerScreenName :: Text
            , ownerSNSAccounts :: [SNSAccount]
            }

data SNSAccount = SNSAccount
           { screenName :: Text
           , accountURL  :: URL
           , serviceIcon :: URL
           , accountIcon :: URL
           }

data MainPage = MainPage
           { mainPageTItle :: Text
           , mainPageBody :: Markdown
           }

type Markdown = Text
type URL = Text

instance FromJSON Site
instance FromJSON MainPage
instance ToJSON Site
instance ToJSON MainPage
instance FromForm Site 
instance FromForm MainPage
instance ElmType Site 
instance ElmType MainPage

