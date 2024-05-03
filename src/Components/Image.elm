module Components.Image exposing (Image,view, ImageRow(..), Images2, Images4)

import Element exposing (..)
import Element.Background as Background
import GridLayout2 exposing (..)

{-| Note: This type doesn't conntain any source size information because all images will be square.
However, when we need to use non-square images which should never be cropped,
we need to add sourceSize (height px, width px), probably as a different type.
-}
type alias Image =
    { url : String
    , description : String
    , placeholderColor : Color
    }


view : LayoutState -> { widthSteps : Int, heightSteps : Int } -> List (Attribute msg) -> Image -> Element msg
view layout { widthSteps, heightSteps } attrs img =
    image
        (Background.color img.placeholderColor
            :: attrs
            ++ widthOfGridSteps layout widthSteps
            ++ heightOfGridSteps layout heightSteps
        )
        { src = img.url, description = img.description }


type ImageRow
    = ImageRow2 Images2
    | ImageRow4 Images4


type alias Images2 =
    { img1 : Image, img2 : Image }


type alias Images4 =
    { img1 : Image, img2 : Image, img3 : Image, img4 : Image }
