module Pages.Home_ exposing (Model, Msg, page)

import Effect
import Element exposing (..)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)
import Window exposing (ScreenClass(..))



type alias Model =
    ()


type alias Msg =
    ()


page : Shared.Model -> Route () -> Page Model Msg
page shared _ =
    Page.new
        { init = always ( (), Effect.none )
        , update = \_ _ -> ( (), Effect.none )
        , subscriptions = always Sub.none
        , view = always <| view shared
        }


view : Shared.Model -> View msg
view _ =
    { title = "Christopher Samoilov"
    , attributes = []
    , element = text "Christopher Samoilov"
    }
