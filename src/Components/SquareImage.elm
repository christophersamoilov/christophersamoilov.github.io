module Components.SquareImage exposing (view)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background



view : List (Attribute msg) -> { img : SquareImage, title : String, size : Length } -> Element msg
view attrs { img, title, size } =
    image
        ([ Background.color img.placeholderColor
         , width size
         , height size
         ]
            ++ attrs
        )
        { src =  img.url , description = title }
