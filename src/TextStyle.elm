module TextStyle exposing (..)

import Element exposing (..)
import Element.Font as Font
import InlineStyle


headlineSmallScreen : List (Attribute msg)
headlineSmallScreen =
    [ Font.size 55
    , Font.semiBold
    , InlineStyle.render [("line-height",  "1px"), ("letter-spacing",  "-1.8px")]
    , Font.family [ Font.typeface "Inter", Font.sansSerif ]
    ]


headlineBigScreen : List (Attribute msg)
headlineBigScreen =
    [ Font.size 89
    , Font.semiBold
    , InlineStyle.render [("line-height",  "1px"), ("letter-spacing",  "-3.2px")]
    , Font.family [ Font.typeface "Inter", Font.sansSerif ]
    ]


subheaderSmallScreen : List (Attribute msg)
subheaderSmallScreen =
    [ Font.size 34
    , Font.medium
    , InlineStyle.render [("line-height",  "1px"), ("letter-spacing",  "-1.6px")]
    , Font.family [ Font.typeface "Inter", Font.sansSerif ]
    ]


subheaderBigScreen : List (Attribute msg)
subheaderBigScreen =
    [ Font.size 34
    , Font.medium
    , InlineStyle.render [("line-height",  "1px"), ("letter-spacing",  "-1.4px")]
    , Font.family [ Font.typeface "Inter", Font.sansSerif ]
    ]


body : List (Attribute msg)
body =
    [ Font.size 34
    , Font.medium
    , InlineStyle.render [("line-height",  "1.2px"), ("letter-spacing",  "-1.4px")]
    , Font.family [ Font.typeface "Inter", Font.sansSerif ]
    ]
