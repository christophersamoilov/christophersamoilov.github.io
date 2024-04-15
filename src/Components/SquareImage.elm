module Components.SquareImage exposing (view, view_, calculateImageSize2, calculateImageSize4)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background
import Window
import Shared



view : List (Attribute msg) -> { img : SquareImage, size : Length } -> Element msg
view attrs { img, size } =
    image
        ([ Background.color img.placeholderColor
         , width size
         , height size
         ]
            ++ attrs
        )
        { src =  img.url , description = img.description }

view_ : List (Attribute msg) -> { img : SquareImage, size : {width: Length, height: Length} } -> Element msg
view_ attrs { img, size } =
    image
        ([ Background.color img.placeholderColor
         , width size.width
         , height size.height
         ]
            ++ attrs
        )
        { src =  img.url , description = img.description }


calculateImageSize2 : Shared.Model -> Int -> { width : Length, height : Length }
calculateImageSize2 shared spacing =
    let
        cw =
            Window.contentWidth shared

        imageWidthFloat =
            (toFloat <| cw - spacing) / 2
    in
    { width = fill, height = px (floor imageWidthFloat) }


calculateImageSize4 : Shared.Model -> Int -> { width : Length, height : Length }
calculateImageSize4 shared spacing =
    let
        cw =
            Window.contentWidth shared

        imageWidthFloat =
            (toFloat <| cw - spacing) / 4
    in
    { width = fill, height = px (floor imageWidthFloat) }
