module TextStyle exposing (..)

import Element exposing (..)
import Element.Font as Font
import Typography exposing (TextStyle)


headlineMobile : TextStyle msg
headlineMobile =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 55
        , fontWeight = Font.semiBold
        , lineHeightPx = 55
        , letterSpacingPercent = -3
        }


headlineDesktop : TextStyle msg
headlineDesktop =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 89
        , fontWeight = Font.semiBold
        , lineHeightPx = 89
        , letterSpacingPercent = -5
        }


body : TextStyle msg
body =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 34
        , fontWeight = Font.medium
        , lineHeightPx = 36
        , letterSpacingPercent = -4.3
        }
