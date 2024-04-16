module Components.Link exposing (view)

import Color
import Data.DesignExperience exposing (Link)
import Element exposing (..)
import Element.Font as Font
import Style
import TextStyle
import Typography exposing (preparedText)
import Window exposing (ScreenClass(..))


view : List (Attribute msg) -> ScreenClass -> Link -> Element msg
view attrs screenClass props =
    let
        textStyle =
            case screenClass of
                SmallScreen ->
                    TextStyle.subheaderSmallScreen

                BigScreen ->
                    TextStyle.subheaderBigScreen
    in
    newTabLink (mouseOver [ alpha Style.hoverOpacity ] :: attrs)
        { url = props.url
        , label = paragraph (Font.color Color.blue1 :: textStyle) [ preparedText props.label ]
        }
