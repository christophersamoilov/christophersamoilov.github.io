module Pages.Design.DesignExperience_ exposing (Model, Msg, page)

import Data.DesignExperience exposing (DesignExperience)
import Dict exposing (Dict)
import Effect exposing (Effect)
import Element exposing (..)
import List.Extra
import Page exposing (Page)
import Route exposing (Route)
import Route.Path as Path
import Shared
import View exposing (View)


type alias Model =
    Maybe DesignExperience


type alias Msg =
    ()


page : Shared.Model -> Route { designExperience : String } -> Page Model Msg
page _ route =
    Page.new
        { init = init route.params
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }


init : { designExperience : String } -> () -> ( Model, Effect Msg )
init params _ =
    let
        lookupResults =
            List.Extra.find (\x -> x.slug == params.designExperience) Data.DesignExperience.data
    in
    case lookupResults of
        Just x ->
            ( Just x, Effect.none )

        Nothing ->
            ( Nothing, Effect.replaceRoutePath Path.Home_ )


update : Msg -> Model -> ( Model, Effect Msg )
update _ model =
    ( model, Effect.none )


view : Model -> View msg
view model =
    case model of
        Just x ->
            { title = x.title
            , attributes = []
            , element = viewDesignExperience x
            }

        Nothing ->
            { title = ""
            , attributes = []
            , element = none
            }


viewDesignExperience : DesignExperience -> Element msg
viewDesignExperience x =
    column []
        [ text x.title
        , text x.skills
        , text x.description
        ]
