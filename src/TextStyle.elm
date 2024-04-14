module TextStyle exposing (.. )

import Element exposing (..)
import Element.Font as Font

headlineSmallScreen : List (Attribute msg)
headlineSmallScreen =
    [ Font.size 40, Font.bold, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

headlineBigScreen : List (Attribute msg)
headlineBigScreen =
    [ Font.size 100, Font.bold, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

subheaderSmallScreen : List (Attribute msg)
subheaderSmallScreen =
    [ Font.size 24, Font.medium, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

subheaderBigScreen : List (Attribute msg)
subheaderBigScreen =
    [ Font.size 40, Font.medium, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

body : List (Attribute msg)
body =
    [ Font.size 20, Font.regular, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

