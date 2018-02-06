module Generated.API exposing (..)
{-| 

# Definition
@docs Page

# getting API values
@docs decodePage, encodePage, getApi

-}

import Json.Encode
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Http
import String


{-| 
Todo:describe about this type
-}
type alias Page =
    { pageTitle : String
    , pageBody : String
    }

{-| 
Todo:describe about this function
-}
decodePage : Decoder Page
decodePage =
    decode Page
        |> required "Title" string
        |> required "Body" string

{-| 
Todo:describe about this function
-}
encodePage : Page -> Json.Encode.Value
encodePage x =
    Json.Encode.object
        [ ( "Title", Json.Encode.string x.pageTitle )
        , ( "Body", Json.Encode.string x.pageBody )
        ]

{-| 
Todo:describe about this function
-}
getApi : Http.Request (Page)
getApi =
    Http.request
        { method =
            "GET"
        , headers =
            []
        , url =
            String.join "/"
                [ "http://localhost:8080"
                , "api"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson decodePage
        , timeout =
            Nothing
        , withCredentials =
            False
        }
