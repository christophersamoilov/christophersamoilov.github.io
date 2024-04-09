module Data.DesignExperience exposing (DesignExperience, DesignExperienceType, data, showDesignExperienceType)

import Element exposing (Color, rgb255)


type DesignExperienceType
    = WorkExperience
    | PersonalProject


showDesignExperienceType : DesignExperienceType -> String
showDesignExperienceType x =
    case x of
        WorkExperience ->
            "Work experience"

        PersonalProject ->
            "Personal project"


type alias Image =
    { -- TODO: add size information (when not square)
      url : String
    , placeholderColor : Color
    }


type alias DesignExperience =
    { slug : String
    , title : String
    , skills : String
    , description : String
    , experienceType : DesignExperienceType
    , thumbnail : Image
    }


data : List DesignExperience
data =
    [ { slug = "sansib"
      , title = "SANSIB"
      , skills = "Art Direction"
      , description = "Art Direction"
      , experienceType = WorkExperience
      , thumbnail = { url = "", placeholderColor = rgb255 0x00 0x00 0x00 }
      }
    , { slug = "fitservice"
      , title = "FIT SERVICE"
      , skills = "UX/UI Design"
      , description = "UX/UI Design"
      , experienceType = WorkExperience
      , thumbnail = { url = "", placeholderColor = rgb255 0xFF 0xFF 0xFF }
      }
    , { slug = "lukoil"
      , title = "Lukoil"
      , skills = "UX/UI Design"
      , description = "UX/UI Design"
      , experienceType = WorkExperience
      , thumbnail = { url = "", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    , { slug = "pamir"
      , title = "Pamir"
      , skills = "UX/UI Design"
      , description = "UX/UI Design"
      , experienceType = WorkExperience
      , thumbnail = { url = "", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    , { slug = "rastsvetai"
      , title = "Rastsvetai Group"
      , skills = "Art Direction, Graphic Design, Motion Design"
      , description = "Art Direction, Graphic Design, Motion Design"
      , experienceType = WorkExperience
      , thumbnail = { url = "", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    , { slug = "2gis"
      , title = "2GIS"
      , skills = "Communication Design"
      , description = "Communication Design"
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/2gis/thumbnail.jpg", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    , { slug = "sclux"
      , title = "SCLUX"
      , skills = "Art Direction, Graphic Design, Motion Design"
      , description = "Art Direction, Graphic Design, Motion Design"
      , experienceType = WorkExperience
      , thumbnail = { url = "", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    , { slug = "incospt"
      , title = "Selected elements of inconsistent periodic table"
      , skills = "Art Direction, Graphic Design, Illustration"
      , description = "Art Direction, Graphic Design, Illustration"
      , experienceType = PersonalProject
      , thumbnail = { url = "", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    , { slug = "vegyrain"
      , title = "Vegetable rain falls through leguminous evaporation"
      , skills = "Art Direction, Illustration"
      , description = "Art Direction, Illustration"
      , experienceType = PersonalProject
      , thumbnail = { url = "", placeholderColor = rgb255 0x33 0x33 0x33 }
      }
    ]
