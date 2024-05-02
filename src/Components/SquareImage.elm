module Components.SquareImage exposing (view, view_, calculateImageSize2, calculateImageSize4)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background
import GridLayout2 exposing  (..)


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


calculateImageSize2 : LayoutState -> Int -> { width : Length, height : Length }
calculateImageSize2 layout spacing =
    let

        imageWidthFloat =
            (toFloat <| layout.grid.contentWidth - spacing) / 2

    in
    { width = fill, height = px (floor imageWidthFloat) }


calculateImageSize4 : LayoutState -> Int -> { width : Length, height : Length }
calculateImageSize4 layout spacing =
    let


        imageWidthFloat =
            (toFloat <| layout.grid.contentWidth - spacing * 3) / 4
    in
    { width = fill, height = px (floor imageWidthFloat) }
