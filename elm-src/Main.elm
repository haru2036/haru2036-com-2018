{-|hoge
@docs Msg, Model, init, initialModel, loadingPage, main, mainPage, pageWrapper, subscriptions, update, view
-}
import Generated.API exposing (Page)
import Css exposing(..)
import Time exposing(millisecond)
import Http
import Html 
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class,id, css, href, src)
import Html.Styled.Events exposing (onClick)

{-|
this is main function of this page
-}
main : Program Never Model Msg
main = 
     Html.program
          { init = init 
          , view = view >> toUnstyled
          , update = update
          , subscriptions = subscriptions
          }

{-|
msg
-}
type Msg = NoOp | LoadMainPage (Result Http.Error Page) | DummyPage

{-|
this is the model. toplevel of model as state of each pages.
-}
type Model = MainPage Page | LoadingPage 

{-|
-}
init : (Model, Cmd Msg)
init =
      ( LoadingPage
      , Http.send LoadMainPage Generated.API.getApi
      )

{-|
-}
subscriptions : Model -> Sub Msg
subscriptions model =
      Sub.none

{-|
-}
update : Msg -> Model -> (Model, Cmd Msg)
update message model = case message of 
    LoadMainPage (Ok result) -> (MainPage result, Cmd.none)
    DummyPage -> (MainPage <| Page "dummy" "hogehoge", Http.send LoadMainPage Generated.API.getApi)
    _ -> (initialModel, Cmd.none)


{-|
-}
initialModel : Model
initialModel = LoadingPage

{-|
-}
pageWrapper : Html Msg -> Html Msg
pageWrapper body = div [ class "main-wrapper"
                 , css [ position relative 
                       , width (pct 100)
                       , height (pct 100)
                       , backgroundImage (url "https://storage.googleapis.com/mstdn-haru2036/backgrounds/20790506558_33e38aecc3_k.jpg")
                       , display block
                       , backgroundSize cover
                       , backgroundRepeat noRepeat
                       , backgroundPosition center 
                       ]
                 ]
                 [ body ]
                                 

{-|
-}
loadingPage : Html Msg
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
                           text "loading..."
                           , button [ onClick DummyPage] [ text "dummy page" ]
                       ]

{-|
-}
--, backgroundImage (linearGradient (stop <| rgb 255 255 255) (stop <| rgb 220 220 220) [] )
mainPage : Page -> Html Msg
mainPage page = pageWrapper <| div [ class "main-card" 
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
         

{-|
-}
view : Model -> Html Msg
view model = case model of
  MainPage page -> mainPage page
  LoadingPage -> loadingPage
