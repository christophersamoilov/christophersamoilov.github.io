module TextStyle exposing (.. )

import Element exposing (..)
import Element.Font as Font

headlineSmallScreen : List (Attribute msg)
headlineSmallScreen =
    [ Font.size 55, Font.semiBold, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

headlineBigScreen : List (Attribute msg)
headlineBigScreen =
    [ Font.size 89, Font.semiBold, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

subheaderSmallScreen : List (Attribute msg)
subheaderSmallScreen =
    [ Font.size 34, Font.medium, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

subheaderBigScreen : List (Attribute msg)
subheaderBigScreen =
    [ Font.size 34, Font.medium, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

body : List (Attribute msg)
body =
    [ Font.size 34, Font.medium, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

