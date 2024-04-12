module Data.DesignExperience exposing
    ( DesignExperience
    , DesignExperienceType
    , ImageRow(..)
    , Images2
    , Link
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


type alias Link =
    { url : String
    , label : String
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
    , links : List Link
    }


data : List DesignExperience
data =
    [ { slug = "sansib"
      , title = "SANSIB"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Created the SANSIB brand & developed the visual identity for the group of companies. Also designed interfaces of the online store for the sale of sanitary ware."
      , thumbnail = { url = "/images/design-experience/sansib/thumbnail.jpg", placeholderColor = rgb255 0x42 0xAF 0xF0 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/sansib/images/1.jpg", placeholderColor = rgb255 0x42 0xaf 0xF0 }
            , img2 = { url = "/images/design-experience/sansib/images/2.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            }
      , restImages = []
      , links = []
      }
    , { slug = "fitservice"
      , title = "FIT SERVICE"
      , experienceType = WorkExperience
      , skills = "Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Since 2020, as a Lead UI Designer I've been helping the company develop digital products & shape a new corporate web identity. My work includes designing interfaces for web & mobile apps, also landing pages & the company's new main website. Collaborating on product analysis with the product manager & overseeing the work of other designers & providing mentorship."
      , thumbnail = { url = "/images/design-experience/fitservice/thumbnail.jpg", placeholderColor = rgb255 0xF4 0x7D 0x32 }
      , backgroundColor = rgb255 0xF4 0x7D 0x32
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/fitservice/images/1.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            , img2 = { url = "/images/design-experience/fitservice/images/2.jpg", placeholderColor = rgb255 0x16 0x1b 0x1f }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/fitservice/images/3.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img2 = { url = "/images/design-experience/fitservice/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img3 = { url = "/images/design-experience/fitservice/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img4 = { url = "/images/design-experience/fitservice/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/fitservice/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img2 = { url = "/images/design-experience/fitservice/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                }
            ]
      , links = []
      }
    , { slug = "lukoil"
      , title = "Lukoil"
      , experienceType = WorkExperience
      , skills = "UX & UI Design, Web Design"
      , description = "As part of the startup, designed interfaces for projects for car service appointments & route search in webview in the Lukoil mobile application."
      , thumbnail = { url = "/images/design-experience/lukoil/thumbnail.jpg", placeholderColor = rgb255 0xD2 0x23 0x3C }
      , backgroundColor = rgb255 0xD2 0x23 0x3C
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/lukoil/images/1.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            , img2 = { url = "/images/design-experience/lukoil/images/2.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            }
      , restImages = []
      , links = []
      }
    , { slug = "prospect"
      , title = "Prospect"
      , experienceType = WorkExperience
      , skills = "Graphic Design, UX & UI Design, Visual Identity"
      , description = "UX analysis & a new concept of a website for a construction company."
      , thumbnail = { url = "/images/design-experience/prospect/thumbnail.jpg", placeholderColor = rgb255 0x1B 0x61 0xE1 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/prospect/images/1.jpg", placeholderColor = rgb255 0x1B 0x61 0xE1 }
            , img2 = { url = "/images/design-experience/prospect/images/2.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            }
      , restImages = []
      , links = []
      }
    , { slug = "pamir"
      , title = "Pamir"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Helped create the marketing concept & brand for residential real estate in 2019—2020. Made a design system to promote residential & commercial properties online & offline. Worked with the development team to analyze the real estate web portal product & designed the web portal Tayga City for property search & sales."
      , thumbnail = { url = "/images/design-experience/pamir/thumbnail.jpg", placeholderColor = rgb255 0x75 0xA0 0xCB }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/pamir/images/1.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            , img2 = { url = "/images/design-experience/pamir/images/2.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            }
      , restImages = []
      , links = []
      }
    , { slug = "rastsvetai"
      , title = "Rastsvetai Group"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Illustration, Motion Design, Visual Identity, Web Design"
      , description = "In 2019—2020 I created & developed a design system for the promotion of residential & commercial real estate of the group of companies on the web & offline. Created a brandbook of a group of companies & concepts of the appearance of individual residential real estate & residential complexes. Art directed & consulted in the creation of 3D visualizations of real estate objects & interior design of common areas. Actively participated in the development of planning solutions for residential real estate. Supervised the work of other designers & provided mentorship."
      , thumbnail = { url = "/images/design-experience/rastsvetai/thumbnail.jpg", placeholderColor = rgb255 0x57 0xCB 0x93 }
      , backgroundColor = rgb255 0x57 0xCB 0x93
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/rastsvetai/images/1.jpg", placeholderColor = rgb255 0xa7 0xa7 0xa7 }
            , img2 = { url = "/images/design-experience/rastsvetai/images/2.jpg", placeholderColor = rgb255 0x1a 0x1a 0x1a }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/rastsvetai/images/3.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img2 = { url = "/images/design-experience/rastsvetai/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img3 = { url = "/images/design-experience/rastsvetai/images/5.jpg", placeholderColor = rgb255 0x4d 0xc3 0x86 }
                , img4 = { url = "/images/design-experience/rastsvetai/images/6.jpg", placeholderColor = rgb255 0x60 0x97 0xb6 }
                }
            ]
      , links =
            [ { url = "https://vimeo.com/437333861"
              , label = "Rastsvetai Group 2019"
              }
            , { url = "https://vimeo.com/437333413"
              , label = "BLACK FRIDAY RASTSVETAI"
              }
            , { url = "https://vimeo.com/437337589"
              , label = "500/1500 STEPS"
              }
            , { url = "https://vimeo.com/446721307"
              , label = "Rastsvetai on Marxa"
              } 
            , { url = "https://vimeo.com/449205141"
              , label = "Rastsvetai on Gogolya"
              }    
            ]
      }
    , { slug = "2gis"
      , title = "2GIS"
      , experienceType = WorkExperience
      , skills = "Graphic Design, Illustration, Motion Design, Type Design, Visual Identity"
      , description = "Promoted the product and developed 2GIS's corporate identity in 2018—2019, working in the areas of creation of graphics on the web & offline, creation of short animated videos, designing presentations, branding of events."
      , thumbnail = { url = "/images/design-experience/2gis/thumbnail.jpg", placeholderColor = rgb255 0x05 0xA8 0x2E }
      , backgroundColor = rgb255 0x05 0xA8 0x2E
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/2gis/images/1.jpg", placeholderColor = rgb255 0x26 0x26 0x26 }
            , img2 = { url = "/images/design-experience/2gis/images/2.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/2gis/images/3.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img2 = { url = "/images/design-experience/2gis/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img3 = { url = "/images/design-experience/2gis/images/5.jpg", placeholderColor = rgb255 0x29 0xB7 0x00 }
                , img4 = { url = "/images/design-experience/2gis/images/6.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/2gis/images/7.jpg", placeholderColor = rgb255 0x29 0xB7 0x00 }
                , img2 = { url = "/images/design-experience/2gis/images/8.jpg", placeholderColor = rgb255 0x26 0x26 0x26 }
                }
            ]
      , links =
            [ { url = "https://vimeo.com/437331502"
              , label = "2GIS agents achievements"
              }
            ]
      }
    , { slug = "sclux"
      , title = "SCLUX"
      , experienceType = WorkExperience
      , skills = "Art Direction, Graphic Design, Motion Design, Visual Identity, Web Design"
      , description = "In 2016—2018 I assisted in establishment of SCLUX — a salon offering bathroom interior design, sanitary ware, and premium ceramic tiles. I also enhanced its brand identity online & offline via various tasks such as creation of a corporate website & longreads on Tilda, creation of materials for publications on social networks, video editing, creating animated graphics & creating a YouTube channel & designing printed products layouts."
      , thumbnail = { url = "/images/design-experience/sclux/thumbnail.jpg", placeholderColor = rgb255 0x32 0x32 0x32 }
      , backgroundColor = rgb255 0x32 0x32 0x32
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/sclux/images/1.jpg", placeholderColor = rgb255 0x32 0x32 0x32 }
            , img2 = { url = "/images/design-experience/sclux/images/2.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            }
      , restImages = []
      , links = []
      }
    , { slug = "inconspt"
      , title = "Selected elements of inconsistent periodic table"
      , experienceType = PersonalProject
      , skills = "Art Direction, Graphic Design, Illustration"
      , description = "Experimental vision of names of selected chemical elements of Mendeleev's periodic table in Russian. There is no connection between the displaying of an element and its physical or chemical properties."
      , thumbnail = { url = "/images/design-experience/inconspt/thumbnail.jpg", placeholderColor = rgb255 0xf6 0xEC 0x10 }
      , backgroundColor = rgb255 0x1A 0x1A 0x1A
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/inconspt/images/1.jpg", placeholderColor = rgb255 0xf6 0xEC 0x10 }
            , img2 = { url = "/images/design-experience/inconspt/images/2.jpg", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/inconspt/images/3.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img2 = { url = "/images/design-experience/inconspt/images/4.jpg", placeholderColor = rgb255 0x3A 0xA3 0x4D }
                , img3 = { url = "/images/design-experience/inconspt/images/5.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img4 = { url = "/images/design-experience/inconspt/images/6.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                }
            ]
      , links = []
      }
    , { slug = "vegyrain"
      , title = "Vegetable rain falls through leguminous evaporation"
      , experienceType = PersonalProject
      , skills = "Art Direction, Illustration"
      , description = "Drawliner, drawing paper. Triptych 420×891. 2017—2020"
      , thumbnail = { url = "/images/design-experience/vegyrain/thumbnail.jpg", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/vegyrain/images/1.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
            , img2 = { url = "/images/design-experience/vegyrain/images/2.jpg", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/vegyrain/images/3.jpg", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
                , img2 = { url = "/images/design-experience/vegyrain/images/4.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img3 = { url = "/images/design-experience/vegyrain/images/5.jpg", placeholderColor = rgb255 0xf2 0xf2 0xf2 }
                , img4 = { url = "/images/design-experience/vegyrain/images/6.jpg", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
                }
            ]
      , links = []
      }
    ]
