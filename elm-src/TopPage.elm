module FrontPage exposing (..)

import Generated.API exposing (Page)
import Html 
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class,id, css, href, src)
import Html.Styled.Events exposing (onClick)

main : Program Never Model Msg
main = 
     Html.beginnerProgram
         { view = view >> toUnstyled
         , update = update
         , model = initialModel
         }

type Msg = NoOp

update : msg -> Page -> Page 
update _ _ = initialModel

type alias Model = Page

initialModel : Page
initialModel = Page "Hello, World!" "hello"

view : Model -> Html msg
view model = div [ class "main-wrapper"] 
        [ h1 [] [ text model.pageTitle ]
        , section
          [ class "" ]
          [ text model.pageBody ]
        ]
        
