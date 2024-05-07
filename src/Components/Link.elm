module Components.Link exposing (Link, view)

import Color
import Element exposing (..)
import Element.Font as Font
import Style
import TextStyle
import Typography exposing (preparedText)


type alias Link =
    { url : String
    , label : String
    }


view : List (Attribute msg) -> Link -> Element msg
view attrs props =
    newTabLink (mouseOver [ alpha Style.hoverOpacity ] :: attrs)
        { url = props.url
        , label = paragraph [ Font.color Color.blue1, TextStyle.body.paragraphSpacing ] [ preparedText props.label ]
        }
