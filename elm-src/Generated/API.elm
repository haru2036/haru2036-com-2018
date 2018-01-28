module Generated.API exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


type alias Page =
    { pageTitle : String
    , pageBody : String
    }

decodePage : Decoder Page
decodePage =
    decode Page
        |> required "pageTitle" string
        |> required "pageBody" string

encodePage : Page -> Json.Encode.Value
encodePage x =
    Json.Encode.object
        [ ( "pageTitle", Json.Encode.string x.pageTitle )
        , ( "pageBody", Json.Encode.string x.pageBody )
        ]

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