module Pages.Design.DesignExperience_ exposing (Model, Msg, page)

import Components.SquareImage exposing (viewDesignExperienceImage)
import Data.DesignExperience as DesignExperience exposing (DesignExperience, ImageRow(..), Images2)
import Dict exposing (Dict)
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import List.Extra
import Page exposing (Page)
import Route exposing (Route)
import Route.Path as Path
import Shared
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
            , attributes = [ Background.color x.backgroundColor, Font.color <| DesignExperience.useTextColor x.textColor, width fill, height fill ]
            , element = viewDesignExperience shared.screenClass x
            }

        Nothing ->
            { title = ""
            , attributes = []
            , element = none
            }


renderFirstImagesAndDescription : ScreenClass -> DesignExperience -> Element msg
renderFirstImagesAndDescription screenClass dx =
    case screenClass of
        SmallScreen ->
            column [ width fill, height fill, spacing 50 ]
                [ viewDesignExperienceImage [] { slug = dx.slug, img = dx.firstImages.img1, title = dx.title, size = fill }
                , text dx.description
                , viewDesignExperienceImage [] { slug = dx.slug, img = dx.firstImages.img2, title = dx.title, size = fill }
                ]

        BigScreen ->
            column [ width fill, height fill, spacing 50 ]
                [ row [ width fill, height fill, spacing 50 ]
                    [ viewDesignExperienceImage [] { slug = dx.slug, img = dx.firstImages.img1, title = dx.title, size = fill }
                    , viewDesignExperienceImage [] { slug = dx.slug, img = dx.firstImages.img2, title = dx.title, size = fill }
                    ]
                , text dx.description
                ]


viewRow : ScreenClass -> { slug : String } -> ImageRow -> Element msg
viewRow screenClass { slug } ir =
    case ir of
        ImageRow2 r ->
            case screenClass of
                SmallScreen ->
                    column [ width fill, height fill, spacing 50 ]
                        [ viewDesignExperienceImage [] { slug = slug, img = r.img1, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img2, title = "Слепым здесь не место", size = fill }
                        ]

                BigScreen ->
                    row [ width fill, height fill, spacing 50 ]
                        [ viewDesignExperienceImage [] { slug = slug, img = r.img1, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img2, title = "Слепым здесь не место", size = fill }
                        ]

        ImageRow4 r ->
            case screenClass of
                SmallScreen ->
                    column [ width fill, height fill, spacing 50 ]
                        [ viewDesignExperienceImage [] { slug = slug, img = r.img1, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img2, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img3, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img4, title = "Слепым здесь не место", size = fill }
                        ]

                BigScreen ->
                    row [ width fill, height fill, spacing 50 ]
                        [ viewDesignExperienceImage [] { slug = slug, img = r.img1, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img2, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img3, title = "Слепым здесь не место", size = fill }
                        , viewDesignExperienceImage [] { slug = slug, img = r.img4, title = "Слепым здесь не место", size = fill }
                        ]


viewDesignExperience : ScreenClass -> DesignExperience -> Element msg
viewDesignExperience screenClass dx =
    column [ width fill, height fill ]
        [ text dx.title
        , text dx.skills
        , renderFirstImagesAndDescription screenClass dx
        , column [ spacing 50 ] <| List.map (viewRow screenClass { slug = dx.slug }) dx.restImages
        ]
