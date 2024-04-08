module Pages.NotFound_ exposing (Model, Msg, page)

import Effect
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View
import Route.Path



page : Shared.Model -> Route () -> Page Model Msg
page _ _ =
    Page.new
        { init = \_ -> ( (), Effect.replaceRoutePath Route.Path.Home_ )
        , update = \_ model -> ( model, Effect.none )
        , subscriptions = always Sub.none
        , view = \_ -> View.none
        }


type alias Model =
    ()


type alias Msg =
    ()
