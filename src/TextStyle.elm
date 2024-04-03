module TextStyle exposing
    ( body
    , lead
    , subheader
    , headline
    )

import Element exposing (..)
import Element.Font as Font


headline : List (Attribute msg)
headline =
    [ Font.size 100, Font.bold, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]


subheader : List (Attribute msg)
subheader =
    [ Font.size 40, Font.medium, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]


lead : List (Attribute msg)
lead =
    [ Font.size 24, Font.regular, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]


body : List (Attribute msg)
body =
    [ Font.size 20, Font.regular, Font.family [ Font.typeface "Inter", Font.sansSerif ] ]

