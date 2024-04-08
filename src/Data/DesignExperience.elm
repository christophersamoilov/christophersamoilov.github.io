module Data.DesignExperience exposing (DesignExperience, data)

type alias DesignExperience =
    { slug : String
        , title : String
    , description : String
    }


data : List DesignExperience
data =
     [{slug =  "2gis",  title = "Дубль Диск", description = "PC CD-ROM" } 
        ,  {slug =  "fitservice",  title = "Feat Service", description = "Да похуй" } ]
        
