module Pages.Design.DesignExperience_ exposing (Model, Msg, page)

import Components.Link as Link
import Components.Image as Image exposing (ImageRow(..))
import Data.Contacts
import Data.DesignExperience as DesignExperience exposing (DesignExperience)
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import GridLayout2 exposing (..)
import Layouts
import List.Extra
import Page exposing (Page)
import Route exposing (Route)
import Route.Path as Path
import Shared
import Style
import TextStyle
import Typography exposing (preparedText)
import View exposing (View)


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
            , element =
                case shared.layout.screenClass of
                    MobileScreen ->
                        viewMobile shared.layout x

                    DesktopScreen ->
                        viewDesktop shared.layout x
            }

        Nothing ->
            { title = ""
            , attributes = []
            , element = none
            }


viewMobile : LayoutState -> DesignExperience -> Element msg
viewMobile layout dx =
    column [ spacing 28, width fill ]
        [ column [ spacing layout.grid.gutter, width fill ]
            [ column
                [ Border.widthEach { bottom = 5, top = 0, left = 0, right = 0 }
                , paddingEach { bottom = layout.grid.gutter, top = 0, left = 0, right = 0 }
                , Border.color <| DesignExperience.useTextColor dx.textColor
                , width fill
                ]
                [ link [ mouseOver [ alpha Style.hoverOpacity ] ]
                    { url = Path.toString <| Path.Home_
                    , label = paragraph TextStyle.headlineSmallScreen [ preparedText Data.Contacts.myName ]
                    }
                ]
            , paragraph TextStyle.headlineSmallScreen [ text dx.title ]
            ]
        , paragraph [ alpha Style.dimmedTextOpacity ] [ preparedText dx.skills ]
        , Image.view layout { widthSteps = 12, heightSteps = 12 } [] dx.firstImages.img1
        , paragraph TextStyle.subheaderSmallScreen [ text dx.description ]
        , case dx.restImages of
            -- Note: We avoid empty space (caused by spacing) if the project contains no restImages
            _ :: _ ->
                column [ spacing layout.grid.gutter, width fill ] <|
                    (
                        Image.view layout { widthSteps = 12, heightSteps = 12 } [] dx.firstImages.img2
                        :: List.map (viewImageRowMobile layout) dx.restImages
                    )

            [] -> Image.view layout { widthSteps = 12, heightSteps = 12 } [] dx.firstImages.img2
            

        -- Note: We avoid empty space (caused by spacing) if the project contains no links
        , case dx.links of
            _ :: _ ->
                column [ spacing layout.grid.gutter ] <| List.map (Link.view [] layout) dx.links

            [] ->
                none
        , viewFooterMobile layout dx
        ]


viewImageRowMobile : LayoutState -> ImageRow -> Element msg
viewImageRowMobile layout ir =
    let
        viewAsColumn =
            List.map (Image.view layout { widthSteps = 12, heightSteps = 12 } [])
                >> column [ spacing layout.grid.gutter ]
    in
    case ir of
        ImageRow2 r ->
            viewAsColumn [ r.img1, r.img2 ]

        ImageRow4 r ->
            viewAsColumn [ r.img1, r.img2, r.img3, r.img4 ]


viewFooterMobile : LayoutState -> DesignExperience -> Element msg
viewFooterMobile layout dx =
    column
        [ spacing 8
        , width fill
        , Border.widthEach { bottom = 0, top = 4, left = 0, right = 0 }
        , paddingEach { bottom = 0, top = 8, left = 0, right = 0 }
        , Border.color <| DesignExperience.useTextColor dx.textColor
        ]
        (link [ mouseOver [ alpha Style.hoverOpacity ] ]
            { url = Path.toString <| Path.Home_
            , label = paragraph TextStyle.subheaderSmallScreen [ preparedText Data.Contacts.myName ]
            }
            :: List.map (Link.view [] layout) Data.Contacts.links
        )


viewDesktop : LayoutState -> DesignExperience -> Element msg
viewDesktop layout dx =
    column [ spacing layout.grid.gutter, width fill ]
        [ column [ spacing 14, width fill ]
            [ column
                [ width fill
                , Border.widthEach { bottom = 7, top = 0, left = 0, right = 0 }
                , paddingEach { bottom = 14, top = 0, left = 0, right = 0 }
                , Border.color <| DesignExperience.useTextColor dx.textColor
                ]
                [ link
                    [ mouseOver [ alpha Style.hoverOpacity ]
                    ]
                    { url = Path.toString <| Path.Home_
                    , label = paragraph TextStyle.headlineBigScreen [ preparedText Data.Contacts.myName ]
                    }
                ]
            , paragraph TextStyle.headlineBigScreen [ text dx.title ]
            ]
        , paragraph [ alpha Style.dimmedTextOpacity ] [ preparedText dx.skills ]
        , [dx.firstImages.img1, dx.firstImages.img2]
                |> List.map (Image.view layout { widthSteps = 6, heightSteps = 6 } [])
                |> gridRow layout
                
        , paragraph TextStyle.subheaderBigScreen  [ text dx.description ]

        -- Note: We avoid empty space (caused by spacing) if the project contains no restImages
        , case dx.restImages of
            _ :: _ ->
                column [ spacing layout.grid.gutter, width fill ] <| List.map (viewImageRowDesktop layout) dx.restImages

            [] ->
                none

        -- Note: We avoid empty space (caused by spacing) if the project contains no links
        , case dx.links of
            _ :: _ ->
                column [ spacing 12 ] <| List.map (Link.view [] layout) dx.links

            [] ->
                none
        , viewFooterDesktop layout dx
        ]


viewImageRowDesktop : LayoutState -> ImageRow -> Element msg
viewImageRowDesktop layout ir =
    case ir of
        ImageRow2 r ->
            [ r.img1, r.img2 ]
                |> List.map (Image.view layout { widthSteps = 6, heightSteps = 6 } [])
                |> gridRow layout

        ImageRow4 r ->
            [ r.img1, r.img2, r.img3, r.img4 ]
                |> List.map (Image.view layout { widthSteps = 3, heightSteps = 3 } [])
                |> gridRow layout


viewFooterDesktop : LayoutState -> DesignExperience -> Element msg
viewFooterDesktop layout dx =
    column
        [ spacing 12
        , width fill
        , Border.widthEach { bottom = 0, top = 4, left = 0, right = 0 }
        , paddingEach { bottom = 0, top = 12, left = 0, right = 0 }
        , Border.color <| DesignExperience.useTextColor dx.textColor
        ]
        (link [ mouseOver [ alpha Style.hoverOpacity ] ]
            { url = Path.toString <| Path.Home_
            , label = paragraph TextStyle.subheaderBigScreen [ preparedText Data.Contacts.myName ]
            }
            :: List.map (Link.view [] layout) Data.Contacts.links
        )
