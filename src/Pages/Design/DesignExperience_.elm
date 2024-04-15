module Pages.Design.DesignExperience_ exposing (Model, Msg, page)

import Components.Link as Link
import Components.SquareImage as SquareImage
import Data.Contacts
import Data.DesignExperience as DesignExperience exposing (DesignExperience, ImageRow(..))
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
import TextStyle
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
            , element = viewReady shared x
            }

        Nothing ->
            { title = ""
            , attributes = []
            , element = none
            }


calculateImageSize2 : Shared.Model -> Int -> { width : Length, height : Length }
calculateImageSize2 shared spacing =
    let
        cw =
            Window.contentWidth shared

        imageWidthFloat =
            (toFloat <| cw - spacing) / 2
    in
    { width = fill, height = px (floor imageWidthFloat) }


calculateImageSize4 : Shared.Model -> Int -> { width : Length, height : Length }
calculateImageSize4 shared spacing =
    let
        cw =
            Window.contentWidth shared

        imageWidthFloat =
            (toFloat <| cw - spacing) / 4
    in
    { width = fill, height = px (floor imageWidthFloat) }


viewRow : Shared.Model -> ImageRow -> Element msg
viewRow shared ir =
    case ir of
        ImageRow2 r ->
            case shared.screenClass of
                SmallScreen ->
                    column [ spacing 12 ]
                        [ SquareImage.view [] { img = r.img1, size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img2, size = px <| Window.contentWidth shared }
                        ]

                BigScreen ->
                    let
                        rowSpacing =
                            32
                    in
                    row [ spacing 32, width fill ]
                        [ SquareImage.view_ [] { img = r.img1, size = calculateImageSize2 shared rowSpacing }
                        , SquareImage.view_ [] { img = r.img2, size = calculateImageSize2 shared rowSpacing }
                        ]

        ImageRow4 r ->
            case shared.screenClass of
                SmallScreen ->
                    column [ spacing 12 ]
                        [ SquareImage.view [] { img = r.img1, size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img2, size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img3, size = px <| Window.contentWidth shared }
                        , SquareImage.view [] { img = r.img4, size = px <| Window.contentWidth shared }
                        ]

                BigScreen ->
                    let
                        rowSpacing =
                            32
                    in
                    row [ spacing 32, width fill ]
                        [ SquareImage.view_ [] { img = r.img1, size = calculateImageSize4 shared rowSpacing }
                        , SquareImage.view_ [] { img = r.img2, size = calculateImageSize4 shared rowSpacing }
                        , SquareImage.view_ [] { img = r.img3, size = calculateImageSize4 shared rowSpacing }
                        , SquareImage.view_ [] { img = r.img4, size = calculateImageSize4 shared rowSpacing }
                        ]


viewReady : Shared.Model -> DesignExperience -> Element msg
viewReady shared dx =
    case shared.screenClass of
        SmallScreen ->
            column [ spacing 28, width fill ]
                [ link []
                    { url = Path.toString <| Path.Home_
                    , label = paragraph TextStyle.headlineSmallScreen [ preparedText Data.Contacts.myName ]
                    }
                , paragraph [] [ el TextStyle.headlineSmallScreen <| text dx.title ]
                , paragraph [ alpha 0.6 ] [ preparedText dx.skills ]
                , SquareImage.view []
                    { img = dx.firstImages.img1
                    , size = px <| Window.contentWidth shared
                    }
                , paragraph [] [ el TextStyle.subheaderSmallScreen <| text dx.description ]
                , column [ spacing 12, width fill ] <|
                    (SquareImage.view []
                        { img = dx.firstImages.img2
                        , size = px <| Window.contentWidth shared
                        }
                        :: List.map (viewRow shared) dx.restImages
                    )
                , column [ spacing 12 ] <| List.map (Link.view [] shared.screenClass) dx.links

                -- footer
                , column [ spacing 8 ]
                    (link []
                        { url = Path.toString <| Path.Home_
                        , label = paragraph TextStyle.subheaderSmallScreen [ preparedText Data.Contacts.myName ]
                        }
                        :: List.map (Link.view [] shared.screenClass) Data.Contacts.links
                    )
                ]

        BigScreen ->
            let
                rowSpacing =
                    32
            in
            column [ spacing 32, width fill ]
                [ link []
                    { url = Path.toString <| Path.Home_
                    , label = paragraph TextStyle.headlineBigScreen [ preparedText Data.Contacts.myName ]
                    }
                , paragraph [] [ el TextStyle.headlineBigScreen <| text dx.title ]
                , paragraph [ alpha 0.6 ] [ preparedText dx.skills ]
                , row [ spacing rowSpacing, width fill ]
                    [ SquareImage.view_ [] { img = dx.firstImages.img1, size = calculateImageSize2 shared rowSpacing }
                    , SquareImage.view_ [] { img = dx.firstImages.img2, size = calculateImageSize2 shared rowSpacing }
                    ]
                , paragraph [] [ el TextStyle.subheaderBigScreen <| text dx.description ]
                , column [ spacing 32, width fill ] <| List.map (viewRow shared) dx.restImages
                , column [ spacing 32 ] <| List.map (Link.view [] shared.screenClass) dx.links

                -- footer
                , column [ spacing 12 ]
                    (link []
                        { url = Path.toString <| Path.Home_
                        , label = paragraph TextStyle.subheaderBigScreen [ preparedText Data.Contacts.myName ]
                        }
                        :: List.map (Link.view [] shared.screenClass) Data.Contacts.links
                    )
                ]
