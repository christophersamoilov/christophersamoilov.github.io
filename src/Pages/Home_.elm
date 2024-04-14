module Pages.Home_ exposing (Model, Msg, page)

import Color
import Components.SquareImage as SquareImage
import Data.DesignExperience as DesignExperience exposing (DesignExperience)
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Layouts
import Page exposing (Page)
import Route exposing (Route)
import Components.Link as Link
import Route.Path as Path
import Shared
import TextStyle
import Typography exposing (preparedText)
import View exposing (View)
import Window exposing (ScreenClass(..))
import Data.DesignExperience exposing (Link)


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





links : List Link
links =
    [ { label = "telegram", url = "https://t.me/christophersamoilov" }
    , { label = "email", url = "mailto:christophersamoilov@gmail.com" }
    ]

myName : String
myName = "Christopher Samoilov"

view : Shared.Model -> View msg
view shared =
    { title = "Christopher Samoilov"
    , attributes = [ Font.color Color.white, Background.color Color.grey1 ]
    , element =
        case shared.screenClass of
            SmallScreen ->
                column [ spacing 32 ]
                    [ paragraph [] [ el TextStyle.headlineSmallScreen <| text myName ]
                    , SquareImage.view []
                        { img =
                            { url = "/images/avatar.jpg"
                            , description = myName
                            , placeholderColor = rgb255 0xFF 0xFF 0xFF
                            }
                        , size = px <| Window.contentWidth shared
                        }
                    , column [ spacing 8 ] <| List.map (Link.view [] shared.screenClass) links
                    , paragraph TextStyle.subheaderSmallScreen <| [ preparedText bioText ]
                    , paragraph TextStyle.subheaderSmallScreen <| [ preparedText skillText ]
                    , viewDesignExperiencesSection shared
                    ]

            BigScreen ->
                column [ spacing 20 ]
                    [ paragraph [] [ el TextStyle.headlineBigScreen <| text myName ]
                    , row [ spacing 32 ]
                        [ SquareImage.view []
                            { img =
                                { url = "/images/avatar.jpg"
                                , description = myName
                                , placeholderColor = rgb255 0xFF 0xFF 0xFF
                                }
                            , size = px 340
                            }
                        , column [ spacing 12, alignTop ] <| List.map (Link.view [] shared.screenClass) links
                        ]
                    , paragraph TextStyle.subheaderBigScreen <| [ preparedText bioText ]
                    , paragraph TextStyle.subheaderBigScreen <| [ preparedText skillText ]
                    , viewDesignExperiencesSection shared
                    ]
    }
    

viewDesignExperiencesSection : Shared.Model -> Element msg
viewDesignExperiencesSection shared =
    case shared.screenClass of
                SmallScreen ->
                    column [ spacing 32 ] <| List.map (viewDesignExperienceItem shared) DesignExperience.data

                BigScreen ->
                    column [ spacing 32 , width fill] <| List.map (viewDesignExperienceItem shared) DesignExperience.data

        


viewDesignExperienceItem : Shared.Model -> DesignExperience -> Element msg
viewDesignExperienceItem shared dx =
    let
        label =
            case shared.screenClass of
                SmallScreen ->
                    column []
                        [ paragraph TextStyle.subheaderSmallScreen [ preparedText dx.title ]
                        , el [ alpha 0.7, paddingEach { top = 20, right = 0, bottom = 12, left = 0 } ] <| text <| DesignExperience.showDesignExperienceType dx.experienceType
                        , SquareImage.view [ Border.rounded 16, clip ] { img = dx.thumbnail, size = px <| Window.contentWidth shared }
                        ]

                BigScreen ->
                    row [ width fill ]
                        [ column [ width fill, height fill, alignTop ]
                            [ paragraph TextStyle.subheaderBigScreen [ preparedText dx.title ]
                            , el [ alpha 0.7, alignBottom ] <| text <| DesignExperience.showDesignExperienceType dx.experienceType
                            ]
                        , SquareImage.view [ Border.rounded 16, clip, alignRight ] { img = dx.thumbnail, size = px 172 } 
                        ]
    in
    link [width fill] { url = Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }, label = label }
