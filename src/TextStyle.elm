module TextStyle exposing (body, headlineDesktop, headlineMobile)

import Element.Font as Font
import Element.Region as Region
import Typography exposing (TextStyle)


headlineMobile : TextStyle msg
headlineMobile =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 55
        , fontWeight = Font.semiBold
        , lineHeightPx = 55
        , letterSpacingPercent = -3
        , region = Just <| Region.heading 1
        }


headlineDesktop : TextStyle msg
headlineDesktop =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 89
        , fontWeight = Font.semiBold
        , lineHeightPx = 89
        , letterSpacingPercent = -5
        , region = Just <| Region.heading 1
        }


body : TextStyle msg
body =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Inter", Font.sansSerif ]
        , fontSizePx = 34
        , fontWeight = Font.regular
        , lineHeightPx = 36
        , letterSpacingPercent = -4.3
        , region = Nothing
        }
