module Pages.Home_ exposing (Model, Msg, page)

import Color
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Page exposing (Page)
import Route exposing (Route)
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


bioText : String
bioText =
    """
I'm a graphic & web designer with experience working on projects for SANSIB, FIT SERVICE, Lukoil, Pamir, Rastsvetai Group & 2GIS. 
My main goal — to make the world easier to understand by using clean & clear visuals. 
I'm all about helping people communicate better & faster, making life a bit better along the way.
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
        column []
            [ el TextStyle.headline <| text "Christopher Samoilov"
            , image
                [ width (px 340)
                , height (px 340)
                ]
                { src = "/images/avatar.jpg", description = "Christopher Samoilov" }
            , blueLink { labelText = "telegram", url = "https://t.me/christophersamoilov" }
            , blueLink { labelText = "email", url = "mailto:christophersamoilov@gmail.com" }
            , paragraph TextStyle.subheader <| [ preparedText bioText ]
            ]
    }
