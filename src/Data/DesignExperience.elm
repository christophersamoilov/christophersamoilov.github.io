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
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Created the SANSIB brand & developed the visual identity for the group of companies. Also designed interfaces of the online store for the sale of sanitary ware."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/sansib/thumbnail.jpg", placeholderColor = rgb255 0x42 0xAF 0xF0 }
      }
    , { slug = "fitservice"
      , title = "FIT SERVICE"
      , skills = "Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Since 2020, as a Lead UI Designer I've been helping the company develop digital products & shape a new corporate web identity. My work includes designing interfaces for web & mobile apps, also landing pages & the company's new main website. Collaborating on product analysis with the product manager & overseeing the work of other designers & providing mentorship."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/fit-service/thumbnail.jpg", placeholderColor = rgb255 0xF4 0x7D 0x32 }
      }
    , { slug = "lukoil"
      , title = "Lukoil"
      , skills = "UX & UI Design, Web Design"
      , description = "As part of the startup, designed interfaces for projects for car service appointments & route search in webview in the Lukoil mobile application."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/lukoil/thumbnail.jpg", placeholderColor = rgb255 0xD2 0x23 0x3C }
      }
    , { slug = "pamir"
      , title = "Pamir"
      , skills = "Art Direction, Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Helped create the marketing concept & brand for residential real estate in 2019—2020. Made a design system to promote residential & commercial properties online & offline. Worked with the development team to analyze the real estate web portal product & designed the web portal Tayga City for property search & sales."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/pamir/thumbnail.jpg", placeholderColor = rgb255 0x75 0xA0 0xCB }
      }
    , { slug = "rastsvetai"
      , title = "Rastsvetai Group"
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, Visual Identity, Web Design"
      , description = "In 2019—2020 I created & developed a design system for the promotion of residential & commercial real estate of the group of companies on the web & offline. Created a brandbook of a group of companies & concepts of the appearance of individual residential real estate & residential complexes. Art directed & consulted in the creation of 3D visualizations of real estate objects & interior design of common areas. Actively participated in the development of planning solutions for residential real estate. Supervised the work of other designers & provided mentorship."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/rastsvetai/thumbnail.jpg", placeholderColor = rgb255 0x57 0xCB 0x93 }
      }
    , { slug = "2gis"
      , title = "2GIS"
      , skills = "Graphic Design, Motion Design, Type Design, Visual Identity"
      , description = "Promoted the product and developed 2GIS's corporate identity in 2018—2019, working in the areas of creation of graphics on the web & offline, creation of short animated videos, designing presentations, branding of events."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/2gis/thumbnail.jpg", placeholderColor = rgb255 0x05 0xA8 0x2E }
      }
    , { slug = "sclux"
      , title = "SCLUX"
      , skills = "Art Direction, Graphic Design, Motion Design, Visual Identity, Web Design"
      , description = "In 2016—2018 I assisted in establishment of SCLUX — a salon offering bathroom interior design, sanitary ware, and premium ceramic tiles. I also enhanced its brand identity online & offline via various tasks such as creation of a corporate website & longreads on Tilda, creation of materials for publications on social networks, video editing, creating animated graphics & creating a YouTube channel & designing printed products layouts."
      , experienceType = WorkExperience
      , thumbnail = { url = "/images/design-experience/sclux/thumbnail.jpg", placeholderColor = rgb255 0x32 0x32 0x32 }
      }
    , { slug = "incospt"
      , title = "Selected elements of inconsistent periodic table"
      , skills = "Art Direction, Graphic Design, Illustration"
      , description = "Experimental vision of names of selected chemical elements of Mendeleev's periodic table in Russian. There is no connection between the displaying of an element and its physical or chemical properties."
      , experienceType = PersonalProject
      , thumbnail = { url = "/images/design-experience/inconspt/thumbnail.jpg", placeholderColor = rgb255 0xF6 0xEC 0x13 }
      }
    , { slug = "vegyrain"
      , title = "Vegetable rain falls through leguminous evaporation"
      , skills = "Art Direction, Illustration"
      , description = "Drawliner, drawing paper. Triptych 420×891. 2017—2020"
      , experienceType = PersonalProject
      , thumbnail = { url = "/images/design-experience/vegyrain/thumbnail.jpg", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
      }
    ]
