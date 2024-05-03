module Pages.Home_ exposing (Model, Msg, page)

import Color
import Components.Link as Link
import Components.SquareImage as SquareImage
import Data.Contacts
import Data.DesignExperience as DesignExperience exposing (DesignExperience, SquareImage)
import Effect
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


avatarImage : SquareImage
avatarImage =
    { url = "/images/avatar.jpg"
    , description = Data.Contacts.myName
    , placeholderColor = rgb255 0x55 0x55 0x55
    }


view : Shared.Model -> View msg
view { layout } =
    { title = Data.Contacts.myName
    , attributes = [ Font.color Color.white, Background.color Color.grey1 ]
    , element =
        case layout.screenClass of
            MobileScreen ->
                viewMobile layout

            DesktopScreen ->
                viewDesktop layout
    }


viewMobile : LayoutState -> Element msg
viewMobile layout =
    column [ spacing 28 ]
        [ paragraph TextStyle.headlineSmallScreen [ preparedText Data.Contacts.myName ]
        , SquareImage.view__ layout [] { img = avatarImage, widthSteps = 12, heightSteps = 12 }
        , column [ spacing 8 ] <| List.map (Link.view [] layout) Data.Contacts.links
        , paragraph TextStyle.subheaderSmallScreen <| [ preparedText bioText ]
        , paragraph (alpha Style.dimmedTextOpacity :: TextStyle.subheaderSmallScreen) <| [ preparedText skillText ]
        , viewDesignExperienceListMobile layout
        ]


viewDesignExperienceListMobile : LayoutState -> Element msg
viewDesignExperienceListMobile layout =
    column [ spacing 32, width fill ] <| List.map (viewDesignExperienceMobile layout) DesignExperience.data


viewDesignExperienceMobile : LayoutState -> DesignExperience -> Element msg
viewDesignExperienceMobile layout dx =
    link [ width fill ]
        { url = Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }
        , label =
            column [ width fill ]
                [ paragraph TextStyle.subheaderSmallScreen [ preparedText dx.title ]
                , paragraph [ alpha Style.dimmedTextOpacity, paddingEach { top = 8, right = 0, bottom = 12, left = 0 } ]
                    [ preparedText <| DesignExperience.showDesignExperienceType dx.experienceType ]
                , SquareImage.view__ layout [ Border.rounded 16, clip ] { img = dx.thumbnail, widthSteps = 12, heightSteps = 12 }
                ]
        }


viewDesktop : LayoutState -> Element msg
viewDesktop layout =
    column [ spacing 42, width fill ]
        [ column [ spacing layout.grid.gutter, width fill ]
            [ paragraph TextStyle.headlineBigScreen [ text Data.Contacts.myName ]
            , row [ spacing layout.grid.gutter ]
                [ SquareImage.view__ layout [] { img = avatarImage, widthSteps = 3, heightSteps = 3 }
                , column [ spacing 12, alignTop ] <| List.map (Link.view [] layout) Data.Contacts.links
                ]
            , paragraph TextStyle.subheaderBigScreen [ preparedText bioText ]
            , paragraph (alpha Style.dimmedTextOpacity :: TextStyle.subheaderBigScreen)  [ preparedText skillText ]
            ]
        , viewDesignExperienceListDesktop layout
        ]


viewDesignExperienceListDesktop : LayoutState -> Element msg
viewDesignExperienceListDesktop layout =
    let
        groupedItems =
            List.Extra.greedyGroupsOf 2 DesignExperience.data

        viewRow r =
            case r of
                [ x ] ->
                    gridRow layout [ viewDesignExperienceDesktop layout x , gridColumn layout {widthSteps = 6} [] []]

                xs ->
                    gridRow layout <|
                        List.map (viewDesignExperienceDesktop layout) xs
    in
    column [ spacing 52, width fill ] <| List.map viewRow groupedItems


viewDesignExperienceDesktop : LayoutState ->  DesignExperience -> Element msg
viewDesignExperienceDesktop layout  dx =
    gridColumn layout {widthSteps = 6} [ height fill] 
        [ link
            [ width fill
            , height fill
            , Border.rounded 16
            , mouseOver
                [ Background.color (rgb255 0 0 0)
                , Border.shadow { offset = ( 0, 0 ), size = 16, blur = 0, color = rgb255 0 0 0 }
                ]
            ]
            { url = Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }
            , label =
                column [ height fill, width fill, spacing 14 ]
                    [ paragraph (alignTop :: TextStyle.subheaderBigScreen) [ preparedText dx.title ]
                    , paragraph [ alignTop, alpha Style.dimmedTextOpacity ]
                        [ preparedText <| DesignExperience.showDesignExperienceType dx.experienceType ]
                    , SquareImage.view__ layout [ Border.rounded 16, clip ] { img = dx.thumbnail, widthSteps = 6, heightSteps = 6 }
                    ]
            }
        ]
