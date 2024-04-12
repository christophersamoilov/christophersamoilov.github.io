module Pages.Design.DesignExperience_ exposing (Model, Msg, page)

import Color
import Components.SquareImage as SquareImage
import Constants
import Data.DesignExperience as DesignExperience exposing (DesignExperience, ImageRow(..), Images2, Link)
import Dict exposing (Dict)
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Layouts
import List.Extra
import Page exposing (Page)
import Route exposing (Route)
import Route.Path as Path
import Shared
import Typography exposing (preparedText)
import View exposing (View)
import Window exposing (ScreenClass(..))


type alias Model =
    Maybe DesignExperience


type alias Msg =
    ()


page : Shared.Model -> Route { designExperience : String } -> Page Model Msg
page shared route =
    Page.new
        { init = init route.params
        , update = update
        , view = view shared
        , subscriptions = always Sub.none
        }
        |> Page.withLayout toLayout


toLayout : Model -> Layouts.Layout Msg
toLayout _ =
    Layouts.WebappLayout {}


init : { designExperience : String } -> () -> ( Model, Effect Msg )
init params _ =
    let
        lookupResults =
            List.Extra.find (\x -> x.slug == params.designExperience) DesignExperience.data
    in
    case lookupResults of
        Just x ->
            ( Just x, Effect.none )

        Nothing ->
            ( Nothing, Effect.replaceRoutePath Path.Home_ )


update : Msg -> Model -> ( Model, Effect Msg )
update _ model =
    ( model, Effect.none )


view : Shared.Model -> Model -> View msg
view shared model =
    case model of
        Just x ->
            { title = x.title
            , attributes =
                [ Background.color x.backgroundColor
                , Font.color <| DesignExperience.useTextColor x.textColor
                ]
            , element = viewDesignExperience shared x
            }

        Nothing ->
            { title = ""
            , attributes = []
            , element = none
            }




renderFirstImagesAndDescription : Shared.Model -> DesignExperience -> Element msg
renderFirstImagesAndDescription shared dx =
    case shared.screenClass of
        SmallScreen ->
            column [ spacing 50 ]
                [ SquareImage.view []
                    { img = dx.firstImages.img1
                    , title = dx.title
                    , size = px <| Window.contentWidth shared
                    }
                , paragraph [] [ preparedText dx.description ]
                , SquareImage.view []
                    { img = dx.firstImages.img2
                    , title = dx.title
                    , size = px <| Window.contentWidth shared
                    }
                ]

        BigScreen ->
            column [ spacing 50 ]
                [ row [ spacing 50 ]
                    [ SquareImage.view [] { img = dx.firstImages.img1, title = dx.title, size = fill }
                    , SquareImage.view [] { img = dx.firstImages.img2, title = dx.title, size = fill }
                    ]
                , paragraph [] [ preparedText dx.description ]
                ]


viewRow : Shared.Model -> ImageRow -> Element msg
viewRow shared ir =
    case ir of
        ImageRow2 r ->
            case shared.screenClass of
                SmallScreen ->
                    column [ spacing 50 ]
                        [ SquareImage.view [] { img = r.img1, title = "Слепым здесь не место", size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img2, title = "Слепым здесь не место", size = px <| Window.contentWidth shared }
                        ]

                BigScreen ->
                    row [ spacing 50 ]
                        [ SquareImage.view [] { img = r.img1, title = "Слепым здесь не место", size = fill }
                        , SquareImage.view [] { img = r.img2, title = "Слепым здесь не место", size = fill }
                        ]

        ImageRow4 r ->
            case shared.screenClass of
                SmallScreen ->
                    column [ spacing 50 ]
                        [ SquareImage.view [] { img = r.img1, title = "Слепым здесь не место", size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img2, title = "Слепым здесь не место", size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img3, title = "Слепым здесь не место", size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img4, title = "Слепым здесь не место", size = px <| Window.contentWidth shared }
                        ]

                BigScreen ->
                    row [ spacing 50 ]
                        [ SquareImage.view [] { img = r.img1, title = "Слепым здесь не место", size = fill }
                        , SquareImage.view [] { img = r.img2, title = "Слепым здесь не место", size = fill }
                        , SquareImage.view [] { img = r.img3, title = "Слепым здесь не место", size = fill }
                        , SquareImage.view [] { img = r.img4, title = "Слепым здесь не место", size = fill }
                        ]


viewLink : Link -> Element msg
viewLink x =
    newTabLink [ height (px 80), Background.color Color.blue1 ]
        { url = x.url
        , label = paragraph [] [ preparedText x.label ]
        }


viewDesignExperience : Shared.Model -> DesignExperience -> Element msg
viewDesignExperience shared dx =
    column []
        [ text dx.title
        , paragraph [] [ preparedText dx.skills ]
        , renderFirstImagesAndDescription shared dx
        , column [ spacing 50 ] <| List.map (viewRow shared) dx.restImages
        , column [ spacing 50 ] <| List.map viewLink dx.links
        ]
