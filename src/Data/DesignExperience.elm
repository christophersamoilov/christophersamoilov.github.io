module Data.DesignExperience exposing (DesignExperience, data)

type alias DesignExperience =
    { slug : String
        , title : String
    , description : String
    }


data : List DesignExperience
data =
     [{slug =  "2gis",  title = "2GIS", description = "Communication Design" } 
        ,  {slug =  "fitservice",  title = "FIT SERVICE", description = "UX/UI Design" } ]
        
