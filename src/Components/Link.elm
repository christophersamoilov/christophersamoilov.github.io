module Components.Link exposing ( Link, view)

import Color
import Element exposing (..)
import Element.Font as Font
import Style
import TextStyle
import Typography exposing (preparedText)
import GridLayout2 exposing  (..)



type alias Link =
    { url : String
    , label : String
    }



view : List (Attribute msg) -> LayoutState -> Link -> Element msg
view attrs layout props =
    let
        textStyle =
            case layout.screenClass of
                MobileScreen ->
                    TextStyle.subheaderSmallScreen

                DesktopScreen ->
                    TextStyle.subheaderBigScreen
    in
    newTabLink (mouseOver [ alpha Style.hoverOpacity ] :: attrs)
        { url = props.url
        , label = paragraph (Font.color Color.blue1 :: textStyle) [ preparedText props.label ]
        }
