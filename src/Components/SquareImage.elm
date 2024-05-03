module Components.SquareImage exposing (calculateImageSize2, calculateImageSize4, view, view_, view__, view___)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background
import GridLayout2 exposing (..)


{-| TODO: remove
-}
view : List (Attribute msg) -> { img : SquareImage, size : Length } -> Element msg
view attrs { img, size } =
    image
        ([ Background.color img.placeholderColor
         , width size
         , height size
         ]
            ++ attrs
        )
        { src = img.url, description = img.description }


{-| TODO: remove
-}
view_ : List (Attribute msg) -> { img : SquareImage, size : { width : Length, height : Length } } -> Element msg
view_ attrs { img, size } =
    image
        ([ Background.color img.placeholderColor
         , width size.width
         , height size.height
         ]
            ++ attrs
        )
        { src = img.url, description = img.description }


-- TODO: remove
view__ : LayoutState -> List (Attribute msg) -> { img : SquareImage, widthSteps : Int, heightSteps : Int } -> Element msg
view__ layout attrs { img, widthSteps, heightSteps } =
    image
        (Background.color img.placeholderColor
            :: attrs
            ++ widthOfGridSteps layout widthSteps
            ++ heightOfGridSteps layout heightSteps
        )
        { src = img.url, description = img.description }

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
