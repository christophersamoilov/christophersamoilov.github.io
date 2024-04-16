module Pages.Home_ exposing (Model, Msg, page)

import Color
import Components.Link as Link
import Components.SquareImage as SquareImage exposing (calculateImageSize2)
import Data.Contacts
import Data.DesignExperience as DesignExperience exposing (DesignExperience)
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
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
import Style

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
        |> Page.withLayout toLayout


toLayout : Model -> Layouts.Layout Msg
toLayout _ =
    Layouts.WebappLayout {}


bioText : String
bioText =
    """
I'm a graphic & web designer with experience working on projects for different companies. 
My main goal — to make the world easier to understand by using clean & clear visuals. 
I'm all about helping people communicate better & faster, making life a bit better along the way.
"""


skillText : String
skillText =
    """
Art Direction, Brand Identity, Graphic Design, Illustration, Motion Design, Type Design, UX & UI Design, Visual Identity, Web Design
"""


view : Shared.Model -> View msg
view shared =
    { title = Data.Contacts.myName
    , attributes = [ Font.color Color.white, Background.color Color.grey1 ]
    , element =
        case shared.screenClass of
            SmallScreen ->
                column [ spacing 28 ]
                    [ paragraph TextStyle.headlineSmallScreen [ preparedText Data.Contacts.myName ]
                    , SquareImage.view []
                        { img =
                            { url = "/images/avatar.jpg"
                            , description = Data.Contacts.myName
                            , placeholderColor = rgb255 0x55 0x55 0x55
                            }
                        , size = px <| Window.contentWidth shared
                        }
                    , column [ spacing 8 ] <| List.map (Link.view [] shared.screenClass) Data.Contacts.links
                    , paragraph TextStyle.subheaderSmallScreen <| [ preparedText bioText ]
                    , paragraph (alpha Style.dimmedTextOpacity :: TextStyle.subheaderSmallScreen) <| [ preparedText skillText ]
                    , viewDesignExperiencesSection shared
                    ]

            BigScreen ->
                column [ spacing 42, width fill ]
                    [ column [ spacing 32, width fill ]
                        [ paragraph [] [ el TextStyle.headlineBigScreen <| text Data.Contacts.myName ]
                        , row [ spacing 32 ]
                            [ SquareImage.view []
                                { img =
                                    { url = "/images/avatar.jpg"
                                    , description = Data.Contacts.myName
                                    , placeholderColor = rgb255 0x55 0x55 0x55
                                    }
                                , size = px 340
                                }
                            , column [ spacing 12, alignTop ] <|
                                List.map (Link.view [] shared.screenClass) Data.Contacts.links
                            ]
                        , paragraph TextStyle.subheaderBigScreen <| [ preparedText bioText ]
                        , paragraph (alpha Style.dimmedTextOpacity :: TextStyle.subheaderBigScreen) <| [ preparedText skillText ]
                        ]
                    , viewDesignExperiencesSection shared
                    ]
    }


viewDesignExperiencesSection : Shared.Model -> Element msg
viewDesignExperiencesSection shared =
    case shared.screenClass of
        SmallScreen ->
            column [ spacing 32, width fill ] <| List.map (viewDesignExperienceSmallScreen shared) DesignExperience.data

        BigScreen ->
            let
                groupedItems =
                    List.Extra.greedyGroupsOf 2 DesignExperience.data

                rowSpacing =
                    32

                viewRow r =
                    case r of
                        [ x ] ->
                            row [ spacing rowSpacing, width fill ]
                                [ viewDesignExperienceBigScreen shared rowSpacing x
                                , column [ width (fillPortion 1) ] []
                                ]

                        xs ->
                            row [ spacing rowSpacing, width fill ] <|
                                List.map (viewDesignExperienceBigScreen shared rowSpacing) xs
            in
            column [ spacing 42, width fill ] <| List.map viewRow groupedItems


viewDesignExperienceSmallScreen : Shared.Model -> DesignExperience -> Element msg
viewDesignExperienceSmallScreen shared dx =
    let
        url =
            Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }
    in
    link [ width fill ]
        { url = url
        , label =
            column [ width fill ]
                [ paragraph TextStyle.subheaderSmallScreen [ preparedText dx.title ]
                , paragraph [ alpha Style.dimmedTextOpacity, paddingEach { top = 8, right = 0, bottom = 12, left = 0 } ]
                    [ preparedText <| DesignExperience.showDesignExperienceType dx.experienceType ]
                , SquareImage.view [ Border.rounded 16, clip ]
                    { img = dx.thumbnail, size = px <| Window.contentWidth shared }
                ]
        }


viewDesignExperienceBigScreen : Shared.Model -> Int -> DesignExperience -> Element msg
viewDesignExperienceBigScreen shared rowSpacing dx =
    let
        url =
            Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }
    in
    column [ width (fillPortion 1), height fill ]
        [ link
            [ width fill
            , height fill
            , Border.rounded 16
            , mouseOver
                [ Background.color (rgb255 0 0 0)
                , Border.shadow { offset = ( 0, 0 ), size = 16, blur = 0, color = rgb255 0 0 0 }
                ]
            ]
            { url = url
            , label =
                column [ height fill, width fill, spacing 14 ]
                    [ paragraph (alignTop :: TextStyle.subheaderBigScreen) [ preparedText dx.title ]
                    , paragraph [ alignTop, alpha Style.dimmedTextOpacity ]
                        [ preparedText <| DesignExperience.showDesignExperienceType dx.experienceType ]
                    , SquareImage.view_ [ Border.rounded 16, clip ]
                        { img = dx.thumbnail, size = calculateImageSize2 shared rowSpacing }
                    ]
            }
        ]
