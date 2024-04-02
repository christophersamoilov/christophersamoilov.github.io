module Window exposing
    ( ScreenClass(..)
    , WindowSize
    , classifyScreen
    , initWindowSize
    , perScreen
    , windowSizeDecoder
    )

import Constants
import Json.Decode


type alias WindowSize =
    { width : Int
    , height : Int
    }


type ScreenClass
    = SmallScreen
    | BigScreen


classifyScreen : WindowSize -> ScreenClass
classifyScreen { width } =
    if width < Constants.bigScreenStartsFrom then
        SmallScreen

    else
        BigScreen


perScreen : ScreenClass -> { small : a, big : a } -> a
perScreen screenClass { small, big } =
    case screenClass of
        SmallScreen ->
            small

        BigScreen ->
            big


windowSizeDecoder : Json.Decode.Decoder WindowSize
windowSizeDecoder =
    Json.Decode.map2 WindowSize
        (Json.Decode.field "width" Json.Decode.int)
        (Json.Decode.field "height" Json.Decode.int)


{-| Stub for init
-}
initWindowSize : WindowSize
initWindowSize =
    { width = 1024, height = 768 }
