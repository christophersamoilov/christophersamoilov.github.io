module Components.SquareImage exposing (calculateImageSize2, calculateImageSize4, view___)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background
import GridLayout2 exposing (..)



-- TODO: not Square image, just Image
view___ : LayoutState -> { widthSteps : Int, heightSteps : Int } -> List (Attribute msg) -> SquareImage -> Element msg
view___ layout { widthSteps, heightSteps } attrs img =
    image
        (Background.color img.placeholderColor
            :: attrs
            ++ widthOfGridSteps layout widthSteps
            ++ heightOfGridSteps layout heightSteps
        )
        { src = img.url, description = img.description }


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
