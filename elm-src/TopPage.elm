module FrontPage exposing (..)

import Generated.API exposing (Page)
import Css exposing(..)
--import Css.Transitions exposing(height3, width3)
import Time exposing(millisecond)
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

update : msg -> Model -> Model
update _ _ = initialModel

type Model = MainPage Page 

initialModel : Model
initialModel = MainPage <| Page "Hello, World!" "hello"

pageWrapper : Html msg -> Html msg
pageWrapper body = div [ class "main-wrapper"
                 , css [ position relative 
                       , width (pct 100)
                       , height (pct 100)
                       , backgroundImage (url "")
                       , display block
                       , backgroundSize cover
                       , backgroundRepeat noRepeat
                       , backgroundPosition center 
                       ]
                 ]
                 [ body ]
                                 

loadingPage : Html msg
loadingPage = pageWrapper <| div [ class "main-card" 
                       , css 
                         [ display inlineBlock
                         , backgroundColor (rgb 250 250 250)
                         , height (pct 95)
                         , width (pct 95)
                         , top (pct 0)
                         , bottom (px 0)
                         , right (pct 50)
                         , left (pct 0)
                         , margin4 auto auto auto auto
                         , position absolute
                         , boxShadow5 (px 0) (px 3) (px 5) (px 0) (rgba 0 0 0 0.5)
                         , borderRadius (px 3) 
                         , overflow hidden
                         ]
                       ]
                       [
                       ]

mainPage : Page -> Html msg
mainPage page =  pageWrapper <| div [ class "main-card" 
                       , css 
                         [ display inlineBlock
                         , backgroundColor (rgb 250 250 250)
                         , width (vw 70)
                         , height (pct 40)
                         , top (pct 0)
                         , bottom (px 0)
                         , right (pct 50)
                         , left (pct 0)
                         , margin4 auto auto auto auto
                         , position absolute
                         , boxShadow5 (px 0) (px 3) (px 5) (px 0) (rgba 0 0 0 0.5)
                         , borderRadius (px 3) 
                         , overflow hidden
                         ]
                       ]

                       [ div 
                         [ css 
                           [
                             transform <| skewX <| deg -45
                           , overflow hidden
                           , height (pct 50)
                           , width(vh 40)
                           ]
                         ]
                         [ 
                           img [ src ""
                         , css [ 
                                 margin4 (px 0) (pct 50) (px 0) (px 0)
                               , transform <| skewX <| deg 45
                               , height (pct 100)
                               ] 
                             ] []
                         ]
                       , div [
                         css [position relative 
                             , width (pct 100)
                             , height (pct 100)
                             ]
                         ] [
                           h1 [] [ text page.pageTitle ]
                         , section
                           [ class "" ]
                           [ text page.pageBody ]
                       ]
                     ]
         

view : Model -> Html msg
view model = case model of
  MainPage page -> mainPage page
