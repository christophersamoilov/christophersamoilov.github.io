module Components.SquareImage exposing (view, view_)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background



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
