module Pages.Design.DesignExperience_ exposing (Model, Msg, page)

import Dict exposing (Dict)
import Effect exposing (Effect)
import Element exposing (..)
import Page exposing (Page)
import Route exposing (Route)
import Route.Path as Path
import Shared
import View exposing (View)


type alias Model =
    Maybe DesignExperience


type alias Msg =
    ()


type alias DesignExperience =
    { title : String
    , description : String
    }


data : Dict String DesignExperience
data =
    Dict.fromList
        [ ( "2gis", { title = "Дубль Диск", description = "PC CD-ROM" } )
        , ( "fitservice", { title = "Feat Service", description = "Да похуй" } )
        ]


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
            Dict.get params.designExperience data
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
        , text x.description
        ]
