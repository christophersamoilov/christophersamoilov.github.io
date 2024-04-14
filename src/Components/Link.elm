module Components.Link exposing (view)

import Data.DesignExperience exposing (Link)
import Element exposing (..)
import Element.Font as Font
import TextStyle
import Color
import Window exposing (ScreenClass(..))
import Typography exposing (preparedText)



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
    newTabLink attrs
        { url = props.url
        , label = paragraph (Font.color Color.blue1 :: textStyle) [ preparedText props.label]
        }