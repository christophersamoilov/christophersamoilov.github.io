module Data.DesignExperience exposing
    ( DesignExperience
    , DesignExperienceType
    , ImageRow(..)
    , Images2
    , SquareImage
    , data
    , showDesignExperienceType
    , useTextColor
    )

import Color
import Element exposing (Color, rgb255)
import Window exposing (ScreenClass(..))


type ImageRow
    = ImageRow2 Images2
    | ImageRow4 Images4


type alias Images2 =
    { img1 : SquareImage, img2 : SquareImage }


type alias Images4 =
    { img1 : SquareImage, img2 : SquareImage, img3 : SquareImage, img4 : SquareImage }


type TextColor
    = WhiteText
    | BlackText


useTextColor : TextColor -> Color
useTextColor tc =
    case tc of
        WhiteText ->
            Color.white

        BlackText ->
            Color.black


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


{-| Note: We don't add size information (proportions) because all images will be square.
-}
type alias SquareImage =
    { url : String
    , placeholderColor : Color
    }


type alias DesignExperience =
    { slug : String
    , title : String
    , experienceType : DesignExperienceType
    , skills : String
    , description : String
    , thumbnail : SquareImage
    , backgroundColor : Color
    , textColor : TextColor
    , firstImages : Images2
    , restImages : List ImageRow
    }


data : List DesignExperience
data =
    [ { slug = "sansib"
      , title = "SANSIB"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Created the SANSIB brand & developed the visual identity for the group of companies. Also designed interfaces of the online store for the sale of sanitary ware."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0x42 0xAF 0xF0 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "fitservice"
      , title = "FIT SERVICE"
      , experienceType = WorkExperience
      , skills = "Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Since 2020, as a Lead UI Designer I've been helping the company develop digital products & shape a new corporate web identity. My work includes designing interfaces for web & mobile apps, also landing pages & the company's new main website. Collaborating on product analysis with the product manager & overseeing the work of other designers & providing mentorship."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0xF4 0x7D 0x32 }
      , backgroundColor = rgb255 0xF4 0x7D 0x32
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "lukoil"
      , title = "Lukoil"
      , experienceType = WorkExperience
      , skills = "UX & UI Design, Web Design"
      , description = "As part of the startup, designed interfaces for projects for car service appointments & route search in webview in the Lukoil mobile application."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0xD2 0x23 0x3C }
      , backgroundColor = rgb255 0xD2 0x23 0x3C
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "prospect"
      , title = "Prospect"
      , experienceType = WorkExperience
      , skills = "Graphic Design, UX & UI Design, Visual Identity"
      , description = "UX analysis & a new concept of a website for a construction company."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0x1B 0x61 0xE1 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "pamir"
      , title = "Pamir"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Helped create the marketing concept & brand for residential real estate in 2019—2020. Made a design system to promote residential & commercial properties online & offline. Worked with the development team to analyze the real estate web portal product & designed the web portal Tayga City for property search & sales."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0x75 0xA0 0xCB }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "rastsvetai"
      , title = "Rastsvetai Group"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, Visual Identity, Web Design"
      , description = "In 2019—2020 I created & developed a design system for the promotion of residential & commercial real estate of the group of companies on the web & offline. Created a brandbook of a group of companies & concepts of the appearance of individual residential real estate & residential complexes. Art directed & consulted in the creation of 3D visualizations of real estate objects & interior design of common areas. Actively participated in the development of planning solutions for residential real estate. Supervised the work of other designers & provided mentorship."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0x57 0xCB 0x93 }
      , backgroundColor = rgb255 0x57 0xCB 0x93
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "2gis"
      , title = "2GIS"
      , experienceType = WorkExperience
      , skills = "Graphic Design, Motion Design, Type Design, Visual Identity"
      , description = "Promoted the product and developed 2GIS's corporate identity in 2018—2019, working in the areas of creation of graphics on the web & offline, creation of short animated videos, designing presentations, branding of events."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0x05 0xA8 0x2E }
      , backgroundColor = rgb255 0x05 0xA8 0x2E
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "images/3.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img2 = { url = "images/4.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img3 = { url = "images/5.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img4 = { url = "images/6.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
                }
            , ImageRow2
                { img1 = { url = "images/7.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img2 = { url = "images/8.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
                }
            ]
      }
    , { slug = "sclux"
      , title = "SCLUX"
      , experienceType = WorkExperience
      , skills = "Art Direction, Graphic Design, Motion Design, Visual Identity, Web Design"
      , description = "In 2016—2018 I assisted in establishment of SCLUX — a salon offering bathroom interior design, sanitary ware, and premium ceramic tiles. I also enhanced its brand identity online & offline via various tasks such as creation of a corporate website & longreads on Tilda, creation of materials for publications on social networks, video editing, creating animated graphics & creating a YouTube channel & designing printed products layouts."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0x32 0x32 0x32 }
      , backgroundColor = rgb255 0x32 0x32 0x32
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "inconspt"
      , title = "Selected elements of inconsistent periodic table"
      , experienceType = PersonalProject
      , skills = "Art Direction, Graphic Design, Illustration"
      , description = "Experimental vision of names of selected chemical elements of Mendeleev's periodic table in Russian. There is no connection between the displaying of an element and its physical or chemical properties."
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0xF6 0xEC 0x13 }
      , backgroundColor = rgb255 0x1A 0x1A 0x1A
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    , { slug = "vegyrain"
      , title = "Vegetable rain falls through leguminous evaporation"
      , experienceType = PersonalProject
      , skills = "Art Direction, Illustration"
      , description = "Drawliner, drawing paper. Triptych 420×891. 2017—2020"
      , thumbnail = { url = "thumbnail.jpg", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "images/1.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            , img2 = { url = "images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages = []
      }
    ]
