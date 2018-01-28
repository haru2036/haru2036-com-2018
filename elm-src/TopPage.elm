module FrontPage exposing (..)

import Html exposing(text, div)
import Css exposing (..)

main = 
    div [ class "main-wrapper"] 
        [ text "Hello, World!"
        , section
          [ class "" ]
        ]
        
