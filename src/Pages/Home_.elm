module Pages.Home_ exposing (Model, Msg, page)

import Color
import Data.DesignExperience as DesignExperience exposing (DesignExperience)
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Page exposing (Page)
import Route exposing (Route)
import Route.Path as Path
import Shared
import TextStyle
import Typography exposing (preparedText)
import View exposing (View)
import Window exposing (ScreenClass(..))
import Element.Border as Border


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


bioText : String
bioText =
    """
I'm a graphic & web designer with experience working on projects for SANSIB, FIT SERVICE, Lukoil, Pamir, Rastsvetai Group & 2GIS. 
My main goal — to make the world easier to understand by using clean & clear visuals. 
I'm all about helping people communicate better & faster, making life a bit better along the way.
"""


skillText : String
skillText =
    """
Art Direction, Brand Identity, Motion Design, Type Design, UX & UI Design,Visual Identity, Web Design
"""


blueLink : { labelText : String, url : String } -> Element msg
blueLink props =
    newTabLink []
        { url = props.url
        , label = el (Font.color Color.blue1 :: TextStyle.subheader) <| text props.labelText
        }


view : Shared.Model -> View msg
view _ =
    { title = "Christopher Samoilov"
    , attributes = [ Font.color Color.white, Background.color Color.grey1 ] ++ TextStyle.body
    , element =
        column [ spacing 32 ]
            [ el TextStyle.headline <| text "Christopher Samoilov"
            , image
                [ width (px 340)
                , height (px 340)
                ]
                { src = "/images/avatar.jpg", description = "Christopher Samoilov" }
            , blueLink { labelText = "telegram", url = "https://t.me/christophersamoilov" }
            , blueLink { labelText = "email", url = "mailto:christophersamoilov@gmail.com" }
            , paragraph TextStyle.subheader <| [ preparedText bioText ]
            , paragraph TextStyle.subheader <| [ preparedText skillText ]
            , viewDesignExperiencesSection
            ]
    }


viewDesignExperiencesSection : Element msg
viewDesignExperiencesSection =
    column [ spacing 32 ]
        [ text ""
        , column [ spacing 14 ] <| List.map viewDesignExperienceItem DesignExperience.data
        ]


viewDesignExperienceItem : DesignExperience -> Element msg
viewDesignExperienceItem dx =
    let
        label =
            column []
                [ text dx.title
                , text <| DesignExperience.showDesignExperienceType dx.experienceType
                , image
                    [ Background.color dx.thumbnail.placeholderColor
                    , Border.rounded 16
                    , clip
                    , width (px 172)
                    , height (px 172)
                    ]
                    { src = dx.thumbnail.url, description = dx.title }
                ]
    in
    link [] { url = Path.toString <| Path.Design_DesignExperience_ { designExperience = dx.slug }, label = label }
