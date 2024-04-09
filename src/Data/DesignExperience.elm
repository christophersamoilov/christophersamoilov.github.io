module Data.DesignExperience exposing (DesignExperience, DesignExperienceType, showDesignExperienceType, data)

type DesignExperienceType = WorkExperience | PersonalProject

showDesignExperienceType : DesignExperienceType -> String
showDesignExperienceType x =
   case x of
     WorkExperience -> "Work experience"
     PersonalProject -> "Personal project"

type alias DesignExperience =
    { slug : String
    , title : String
    , description : String
    , experienceType: DesignExperienceType
    }


data : List DesignExperience
data =
    [ { slug = "sansib", title = "SANSIB", description = "Art Direction", experienceType = WorkExperience }
    , { slug = "fitservice", title = "FIT SERVICE", description = "UX/UI Design", experienceType = WorkExperience }
    , { slug = "lukoil", title = "Lukoil", description = "UX/UI Design", experienceType = WorkExperience }
    , { slug = "pamir", title = "Pamir", description = "UX/UI Design", experienceType = WorkExperience }
    , { slug = "rastsvetai", title = "Rastsvetai Group", description = "Art Direction, Graphic Design, Motion Design", experienceType = WorkExperience }
    , { slug = "2gis", title = "2GIS", description = "Communication Design", experienceType = WorkExperience }
    , { slug = "sclux", title = "SCLUX", description = "Art Direction, Graphic Design, Motion Design", experienceType = WorkExperience }
    , { slug = "incospt", title = "Selected elements of inconsistent periodic table", description = "Art Direction, Graphic Design, Illustration", experienceType = PersonalProject }
    , { slug = "vegyrain", title = "Vegetable rain falls through leguminous evaporation", description = "Art Direction, Illustration", experienceType = PersonalProject }
    ]
