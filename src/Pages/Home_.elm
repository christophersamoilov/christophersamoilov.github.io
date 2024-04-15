module Pages.Home_ exposing (Model, Msg, page)

import Color
import Components.SquareImage as SquareImage
import Data.DesignExperience as DesignExperience exposing (DesignExperience)
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Data.Contacts
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
                    [ paragraph [] [ el TextStyle.headlineSmallScreen <| text Data.Contacts.myName ]
                    , SquareImage.view []
                        { img =
                            { url = "/images/avatar.jpg"
                            , description = Data.Contacts.myName
                            , placeholderColor = rgb255 0xFF 0xFF 0xFF
                            }
                        , size = px <| Window.contentWidth shared
                        }
                    , column [ spacing 8 ] <| List.map (Link.view [] shared.screenClass) Data.Contacts.links
                    , paragraph TextStyle.subheaderSmallScreen <| [ preparedText bioText ]
                    , paragraph TextStyle.subheaderSmallScreen <| [ preparedText skillText ]
                    , viewDesignExperiencesSection shared
                    ]

            BigScreen ->
                column [ spacing 32 ]
                    [ paragraph [] [ el TextStyle.headlineBigScreen <| text Data.Contacts.myName ]
                    , row [ spacing 32 ]
                        [ SquareImage.view []
                            { img =
                                { url = "/images/avatar.jpg"
                                , description = Data.Contacts.myName
                                , placeholderColor = rgb255 0xFF 0xFF 0xFF
                                }
                            , size = px 340
                            }
                        , column [ spacing 12, alignTop ] <| List.map (Link.view [] shared.screenClass) Data.Contacts.links
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
                        , el [ alpha 0.6, paddingEach { top = 20, right = 0, bottom = 12, left = 0 } ] <| text <| DesignExperience.showDesignExperienceType dx.experienceType
                        , SquareImage.view [ Border.rounded 16, clip ] { img = dx.thumbnail, size = px <| Window.contentWidth shared }
                        ]

                BigScreen ->
                    row [ width fill ]
                        [ column [ width fill, height fill, alignTop ]
                            [ paragraph TextStyle.subheaderBigScreen [ preparedText dx.title ]
                            , el [ alpha 0.6, alignBottom ] <| text <| DesignExperience.showDesignExperienceType dx.experienceType
                            ]
                        , SquareImage.view [ Border.rounded 16, clip, alignRight ] { img = dx.thumbnail, size = px 172 } 
                        ]
    in
    link [width fill] { url = Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }, label = label }
