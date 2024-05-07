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
        , lineHeightPx = 56
        , letterSpacingPercent = -2
        }


headlineDesktop : TextStyle msg
headlineDesktop =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 89
        , fontWeight = Font.semiBold
        , lineHeightPx = 90
        , letterSpacingPercent = -2
        }


body : TextStyle msg
body =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 34
        , fontWeight = Font.medium
        , lineHeightPx = 35
        , letterSpacingPercent = -4.7
        }
