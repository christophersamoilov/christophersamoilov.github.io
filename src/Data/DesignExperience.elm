module Data.DesignExperience exposing (DesignExperience, data)


type alias DesignExperience =
    { slug : String
    , title : String
    , description : String
    }


data : List DesignExperience
data =
    [ { slug = "sansib", title = "SANSIB", description = "Art Direction" }
    , { slug = "fitservice", title = "FIT SERVICE", description = "UX/UI Design" }
    , { slug = "lukoil", title = "Lukoil", description = "UX/UI Design" }
    , { slug = "pamir", title = "Pamir", description = "UX/UI Design" }
    , { slug = "rastsvetai", title = "Rastsvetai Group", description = "Art Direction, Graphic Design, Motion Design" }
    , { slug = "2gis", title = "2GIS", description = "Communication Design" }
    , { slug = "sclux", title = "SCLUX", description = "Art Direction, Graphic Design, Motion Design" }
    , { slug = "incospt", title = "Selected elements of inconsistent periodic table", description = "Art Direction, Graphic Design, Illustration" }
    , { slug = "vegyrain", title = "Vegetable rain falls through leguminous evaporation", description = "Art Direction, Illustration" }
    ]
