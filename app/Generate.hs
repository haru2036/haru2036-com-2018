{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Proxy
import Elm
import Servant.Elm
import Shelly (mkdir_p, shelly)
import Model 
import Site (JSONAPI)


elmOpts :: ElmOptions
elmOpts =
  defElmOptions
    { urlPrefix = Static "http://localhost:8080" }

spec :: Spec
spec = Spec ["Generated", "API"]
            (defElmImports
             : toElmTypeSource    (Proxy :: Proxy Page)
             : toElmDecoderSource (Proxy :: Proxy Page)
             : toElmEncoderSource (Proxy :: Proxy Page)
             : generateElmForAPIWith elmOpts  (Proxy :: Proxy JSONAPI))

main :: IO ()
main = do
  shelly $ mkdir_p "elm-src/Generated"
  specsToDir [spec] "elm-src" 
