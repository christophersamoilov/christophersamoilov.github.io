module Pages.Design.DesignExperience_ exposing (page)

import Dict exposing (Dict)
import Element exposing (..)
import Element.Region exposing (description)
import Html exposing (Html)
import View exposing (View)


type alias DesignExperience =
    { title : String
    , description : String
    }


data : Dict String DesignExperience
data =
    Dict.fromList
        [ ( "2gis", { title = "Дубль Диск", description = "PC CD-ROM" } )
        , ( "fitservice", { title = "Feat Service", description = "Да похуй" } )
        ]


page : { designExperience : String } -> View msg
page params =
    let
        lookupResults =
            Dict.get params.designExperience data
    in
    case lookupResults of
        Just x ->
            { title = x.title
            , attributes = []
            , element = viewDesignExperience x
            }

        Nothing ->
            { title = "None"
            , attributes = []
            , element = text "net nihuya"
            }


viewDesignExperience : DesignExperience -> Element msg
viewDesignExperience x =
    column []
        [ text x.title
        , text x.description
        ]
