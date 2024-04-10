module Components.SquareImage exposing (viewDesignExperienceImage)

import Data.DesignExperience exposing (SquareImage)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border


designExperienceImageSrc : { slug : String, path : String } -> String
designExperienceImageSrc { slug, path } =
    "/images/design-experience/" ++ slug ++ "/" ++ path


viewDesignExperienceImage : List (Attribute msg) -> { slug : String, img : SquareImage, title : String, size : Length } -> Element msg
viewDesignExperienceImage attrs { slug, img, title, size } =
    image
        ([ Background.color img.placeholderColor
         , Border.rounded 16
         , clip
         , width size
         , height size
         ]
            ++ attrs
        )
        { src = designExperienceImageSrc { slug = slug, path = img.url }, description = title }
