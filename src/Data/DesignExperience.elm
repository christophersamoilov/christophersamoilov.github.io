module Data.DesignExperience exposing
    ( DesignExperience
    , DesignExperienceType
    , data
    , showDesignExperienceType
    , useTextColor
    )

import Color
import Components.Image exposing (Image, ImageRow(..), Images2)
import Components.Link exposing (Link)
import Element exposing (Color, rgb255)


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


type alias DesignExperience =
    { slug : String
    , title : String
    , experienceType : DesignExperienceType
    , skills : String
    , description : String
    , thumbnail : Image
    , backgroundColor : Color
    , textColor : TextColor
    , firstImages : Images2
    , restImages : List ImageRow
    , links : List Link
    }


data : List DesignExperience
data =
    [ { slug = "thebroks"
      , title = "THEBROKS"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, No-Code Development, UX & UI Design, Visual Identity, Web Design"
      , description = "Working with the marketing team at THEBROKS, an international boutique real estate agency in Dubai & Moscow, redesigned the corporate identity & established a new design system, including redesigning the corporate website & landing pages using Tilda. Producing content for social media, illustrating articles, editing videos, developing presentations, catalogues & various communication materials for brokers & agency clients. Designed the Moscow office's identity, including a brand book, SMM design & corporate website on Tilda."
      , thumbnail = { url = "/images/design-experience/thebroks/thumbnail.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
      , backgroundColor = rgb255 0x08 0x09 0x0C
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/thebroks/images/1.jpg", description = "", placeholderColor = rgb255 0xD5 0xD4 0xCF }
            , img2 = { url = "/images/design-experience/thebroks/images/2.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/thebroks/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/thebroks/images/4.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                , img3 = { url = "/images/design-experience/thebroks/images/5.jpg", description = "", placeholderColor = rgb255 0x1F 0x92 0x97 }
                , img4 = { url = "/images/design-experience/thebroks/images/6.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/thebroks/images/7.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                , img2 = { url = "/images/design-experience/thebroks/images/8.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/thebroks/images/9.jpg", description = "", placeholderColor = rgb255 0xD3 0xEB 0xFE }
                , img2 = { url = "/images/design-experience/thebroks/images/10.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/thebroks/images/11.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                , img4 = { url = "/images/design-experience/thebroks/images/12.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/thebroks/images/13.jpg", description = "", placeholderColor = rgb255 0xE0 0xE3 0xE2 }
                , img2 = { url = "/images/design-experience/thebroks/images/14.jpg", description = "", placeholderColor = rgb255 0x05 0x02 0x01 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/thebroks/images/15.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                , img2 = { url = "/images/design-experience/thebroks/images/16.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                , img3 = { url = "/images/design-experience/thebroks/images/17.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/thebroks/images/18.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/thebroks/images/19.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                , img2 = { url = "/images/design-experience/thebroks/images/20.jpg", description = "", placeholderColor = rgb255 0x08 0x09 0x0C }
                }
            ]
      , links =
            [ { url = "https://thebroks.com"
              , label = "THEBROKS Dubai Website"
              }
            , { url = "https://thebroks.moscow"
              , label = "THEBROKS Moscow Website"
              }
            , { url = "https://disk.yandex.ru/i/CHr04TYhOmeBJQ"
              , label = "THEBROKS Moscow Brand Book"
              }
            , { url = "https://disk.yandex.ru/i/KIvxkI6npOmdWQ"
              , label = "THEBROKS Presentation"
              }
            , { url = "https://disk.yandex.ru/i/VXRRr0zBRS8sKQ"
              , label = "THEBROKS & SAMANA Ivy Gardens 2 Special Offer"
              }
            , { url = "https://disk.yandex.ru/i/Ytge6vqdXbR33Q"
              , label = "THEBROKS Property Finder Presentation"
              }
            , { url = "https://disk.yandex.ru/i/Nc8muchNNrdsAA"
              , label = "THEBROKS Off-Plan Catalogue 2025.05"
              }
            , { url = "https://disk.yandex.ru/i/rQ0ubo-cWuaRAw"
              , label = "THEBROKS Secondary Catalogue 2025.05"
              }
            , { url = "https://disk.yandex.ru/i/743PFS6MC6ShnQ"
              , label = "Brokers Wanted Video"
              }
            ]
      }
    , { slug = "thestudio"
      , title = "THESTUDIO"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, No-Code Development, Visual Identity, Web Design"
      , description = "Since 2024, working with the marketing team at a startup to create a brand identity for THESTUDIO, a social marketing agency for real estate in Dubai. Developing & maintaining content for the Instagram account, designing & developing a corporate website using Tilda."
      , thumbnail = { url = "/images/design-experience/thestudio/thumbnail.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/thestudio/images/1.jpg", description = "", placeholderColor = rgb255 0x21 0x1B 0x17 }
            , img2 = { url = "/images/design-experience/thestudio/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/thestudio/images/3.jpg", description = "", placeholderColor = rgb255 0x99 0x98 0x67 }
                , img2 = { url = "/images/design-experience/thestudio/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/thestudio/images/5.jpg", description = "", placeholderColor = rgb255 0x2E 0x28 0x21 }
                , img4 = { url = "/images/design-experience/thestudio/images/6.jpg", description = "", placeholderColor = rgb255 0x76 0x38 0x35 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/thestudio/images/7.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/thestudio/images/8.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0x00 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/thestudio/images/9.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/thestudio/images/10.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img3 = { url = "/images/design-experience/thestudio/images/11.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/thestudio/images/12.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0x00 }
                }
            ]
      , links =
            [ { url = "https://thestudio.website"
              , label = "THESTUDIO Website"
              }
            , { url = "https://disk.yandex.ru/i/JrDWjj4PGNQ0tg"
              , label = "THESTUDIO Presentation"
              }
            ]
      }
    , { slug = "da"
      , title = "Davai na Altai"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, No-Code Development, Visual Identity, Web Design"
      , description = "Designed brand identity & a website for a group of travelers who offer tours to Altai. The main idea for the design came from the shape of Le Murmure typeface & the spiritual world of Altai shamans. "
      , thumbnail = { url = "/images/design-experience/da/thumbnail.jpg", description = "", placeholderColor = rgb255 0xA5 0xCF 0xEB }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/da/images/1.jpg", description = "", placeholderColor = rgb255 0xA5 0xCF 0xEB }
            , img2 = { url = "/images/design-experience/da/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/da/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/da/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/da/images/5.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/da/images/6.jpg", description = "", placeholderColor = rgb255 0x77 0x8F 0xB8 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/da/images/7.jpg", description = "", placeholderColor = rgb255 0x26 0x26 0x26 }
                , img2 = { url = "/images/design-experience/da/images/8.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links = []
      }
    , { slug = "sansib"
      , title = "SANSIB"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Motion Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Created the SANSIB brand, designed visual identity & developed the online store interface for sanitary ware. The new style uses the clean Manrope typeface & laconic circle shapes to convey simplicity & conciseness, aligning with the client's interior design services for bathrooms."
      , thumbnail = { url = "/images/design-experience/sansib/thumbnail.jpg", description = "", placeholderColor = rgb255 0x42 0xAF 0xF0 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/sansib/images/1.jpg", description = "", placeholderColor = rgb255 0x42 0xAF 0xF0 }
            , img2 = { url = "/images/design-experience/sansib/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/sansib/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/sansib/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/sansib/images/5.jpg", description = "", placeholderColor = rgb255 0x42 0xAF 0xF0 }
                , img4 = { url = "/images/design-experience/sansib/images/6.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/sansib/images/7.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/sansib/images/8.jpg", description = "", placeholderColor = rgb255 0xFA 0xAC 0x16 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/sansib/images/9.jpg", description = "", placeholderColor = rgb255 0xFC 0x16 0x5B }
                , img2 = { url = "/images/design-experience/sansib/images/10.jpg", description = "", placeholderColor = rgb255 0xFF 0xFF 0xFF }
                , img3 = { url = "/images/design-experience/sansib/images/11.jpg", description = "", placeholderColor = rgb255 0xC9 0xB4 0x9F }
                , img4 = { url = "/images/design-experience/sansib/images/12.jpg", description = "", placeholderColor = rgb255 0x4A 0xC5 0xD8 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/sansib/images/13.jpg", description = "", placeholderColor = rgb255 0x14 0x1A 0x24 }
                , img2 = { url = "/images/design-experience/sansib/images/14.jpg", description = "", placeholderColor = rgb255 0x42 0xAF 0xF0 }
                }
            ]
      , links =
            [ { url = "https://sansibpro.ru"
              , label = "SANSIB Website"
              }
            , { url = "https://vimeo.com/933678695/c7fc43ee0e"
              , label = "SANSIB Group Movie"
              }
            , { url = "https://vimeo.com/933679719/47cca2a1e1"
              , label = "How To Make Good — Instagram Reels"
              }
            , { url = "https://vimeo.com/933679294/9c5da92dee"
              , label = "What Means Quality — Instagram Reels"
              }
            ]
      }
    , { slug = "fitservice"
      , title = "FIT SERVICE"
      , experienceType = WorkExperience
      , skills = "Brand Identity, Graphic Design, Motion Design, UX & UI Design, Visual Identity, Web Design"
      , description = "As a Lead UI Designer, helped FIT SERVICE make digital products & create a new look \u{2028}for its website. Designed screens for websites \u{2028}& apps, including the main website & special pages for new customers. I worked with the managers in charge of new products & other designers to make a new mobile app for the company. Helped with other new products the company was making. As the main designer, made sure that everyone in the design team could talk to each other well & helped new designers learn their job."
      , thumbnail = { url = "/images/design-experience/fitservice/thumbnail.jpg", description = "", placeholderColor = rgb255 0xF4 0x7D 0x32 }
      , backgroundColor = rgb255 0xFF 0x81 0x32
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/fitservice/images/1.jpg", description = "", placeholderColor = rgb255 0x16 0x1B 0x1F }
            , img2 = { url = "/images/design-experience/fitservice/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/fitservice/images/3.jpg", description = "", placeholderColor = rgb255 0x16 0x1B 0x1F }
                , img2 = { url = "/images/design-experience/fitservice/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/fitservice/images/5.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/fitservice/images/6.jpg", description = "", placeholderColor = rgb255 0x29 0x1D 0x1D }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/fitservice/images/7.jpg", description = "", placeholderColor = rgb255 0x93 0xAE 0xCF }
                , img2 = { url = "/images/design-experience/fitservice/images/8.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/fitservice/images/9.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/fitservice/images/10.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/fitservice/images/11.jpg", description = "", placeholderColor = rgb255 0x16 0x1B 0x1F }
                , img4 = { url = "/images/design-experience/fitservice/images/12.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/fitservice/images/13.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/fitservice/images/14.jpg", description = "", placeholderColor = rgb255 0x16 0x1B 0x1F }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/fitservice/images/15.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/fitservice/images/16.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/fitservice/images/17.jpg", description = "", placeholderColor = rgb255 0x8A 0x43 0x25 }
                , img4 = { url = "/images/design-experience/fitservice/images/18.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/fitservice/images/19.jpg", description = "", placeholderColor = rgb255 0x16 0x1B 0x1F }
                , img2 = { url = "/images/design-experience/fitservice/images/20.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/fitservice/images/21.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/fitservice/images/22.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/fitservice/images/23.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/fitservice/images/24.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links =
            [ { url = "https://disk.yandex.ru/i/Nfznnq0AeEx3DA"
              , label = "FIT App Presentation"
              }
            , { url = "https://disk.yandex.ru/i/5loH-JsCd-t4vA"
              , label = "×2 Using CJM as an Example of Fitauto Presentation"
              }
            , { url = "https://vimeo.com/933674884/5ed6036896"
              , label = "FIT SERVICE UI Kit Promo Video 2023"
              }
            , { url = "https://vimeo.com/933673725/8199b3ac81"
              , label = "FIT App Video for App Store"
              }
            ]
      }
    , { slug = "ts"
      , title = "Tyre Storage"
      , experienceType = WorkExperience
      , skills = "Art Direction, Graphic Design, Visual Identity, Web Design"
      , description = "As part of the startup, designed interfaces for tyre storage service. The main source of inspiration was the Swiss-style clarity & stereotypical posters in car service stations."
      , thumbnail = { url = "/images/design-experience/ts/thumbnail.jpg", description = "", placeholderColor = rgb255 0xFF 0xB9 0x1D }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/ts/images/1.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            , img2 = { url = "/images/design-experience/ts/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/ts/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/ts/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/ts/images/5.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/ts/images/6.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links = []
      }
    , { slug = "lukoil"
      , title = "Lukoil"
      , experienceType = WorkExperience
      , skills = "UX & UI Design, Web Design"
      , description = "As part of the startup, I designed user-friendly interfaces for car service booking & route search with cashback features in the Lukoil mobile app. I worked in two different styles & came up with new & creative visual ideas to improve the app's design."
      , thumbnail = { url = "/images/design-experience/lukoil/thumbnail.jpg", description = "", placeholderColor = rgb255 0xD2 0x23 0x3C }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/lukoil/images/1.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            , img2 = { url = "/images/design-experience/lukoil/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow2
                { img1 = { url = "/images/design-experience/lukoil/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/lukoil/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links =
            [ { url = "https://disk.yandex.ru/i/ynxLZdR_TlFgjg"
              , label = "Lukoil Booking Presentation"
              }
            ]
      }
    , { slug = "prospect"
      , title = "Prospect"
      , experienceType = WorkExperience
      , skills = "Graphic Design, UX & UI Design, Visual Identity"
      , description = "Updating the visual identity & creating a new website concept for a construction company based on analysis performed by the UX designer."
      , thumbnail = { url = "/images/design-experience/prospect/thumbnail.jpg", description = "", placeholderColor = rgb255 0x1B 0x61 0xE1 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/prospect/images/1.jpg", description = "", placeholderColor = rgb255 0x1B 0x61 0xE1 }
            , img2 = { url = "/images/design-experience/prospect/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow2
                { img1 = { url = "/images/design-experience/prospect/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/prospect/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links = []
      }
    , { slug = "pamir"
      , title = "Pamir"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, UX & UI Design, Visual Identity, Web Design"
      , description = "Helped come up with the marketing idea & brands for residential real estate. Created \u{2028}a set of design rules to advertise residential & commercial properties online & offline. Worked with the development team to design a real estate web portal Tayga City for search & sales property."
      , thumbnail = { url = "/images/design-experience/pamir/thumbnail.jpg", description = "", placeholderColor = rgb255 0x61 0xAC 0xE1 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/pamir/images/1.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            , img2 = { url = "/images/design-experience/pamir/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/pamir/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/pamir/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/pamir/images/5.jpg", description = "", placeholderColor = rgb255 0xFE 0xB3 0x02 }
                , img4 = { url = "/images/design-experience/pamir/images/6.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/pamir/images/7.jpg", description = "", placeholderColor = rgb255 0x00 0xA3 0x41 }
                , img2 = { url = "/images/design-experience/pamir/images/8.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links = []
      }
    , { slug = "rastsvetai"
      , title = "Rastsvetai Group"
      , experienceType = WorkExperience
      , skills = "Art Direction, Brand Identity, Graphic Design, Illustration, Motion Design, No-Code Development, Visual Identity, Web Design"
      , description = "Designed a system to promote residential & commercial real estate by a group of companies — made a brand book, updated the logo & visual identity. Created a logo for a real estate developer Acacia. Helped with creation of 3D renders of real estate & the design of common areas inside buildings. Supervised the work of other designers & provided mentorship."
      , thumbnail = { url = "/images/design-experience/rastsvetai/thumbnail.jpg", description = "", placeholderColor = rgb255 0x57 0xCB 0x93 }
      , backgroundColor = rgb255 0x57 0xCB 0x93
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/rastsvetai/images/1.jpg", description = "", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
            , img2 = { url = "/images/design-experience/rastsvetai/images/2.jpg", description = "", placeholderColor = rgb255 0x1A 0x1A 0x1A }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/rastsvetai/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/rastsvetai/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/rastsvetai/images/5.jpg", description = "", placeholderColor = rgb255 0x4D 0xC3 0x86 }
                , img4 = { url = "/images/design-experience/rastsvetai/images/6.jpg", description = "", placeholderColor = rgb255 0x60 0x97 0xB6 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/rastsvetai/images/7.jpg", description = "", placeholderColor = rgb255 0x2B 0x4E 0x62 }
                , img2 = { url = "/images/design-experience/rastsvetai/images/8.jpg", description = "", placeholderColor = rgb255 0xFF 0xFF 0xFF }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/rastsvetai/images/9.jpg", description = "", placeholderColor = rgb255 0x00 0x6A 0x56 }
                , img2 = { url = "/images/design-experience/rastsvetai/images/10.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/rastsvetai/images/11.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/rastsvetai/images/12.jpg", description = "", placeholderColor = rgb255 0x00 0x6A 0x56 }
                }
            ]
      , links =
            [ { url = "https://disk.yandex.ru/i/Z8LIDO8LoAkXTg"
              , label = "Rastsvetai Brand Book"
              }
            , { url = "https://vimeo.com/437333861"
              , label = "Rastsvetai Group Movie 2019"
              }
            , { url = "https://vimeo.com/437333413"
              , label = "BLACK FRIDAY RASTSVETAI Promo Video"
              }
            , { url = "https://vimeo.com/437337589"
              , label = "500/1500 STEPS Movie"
              }
            , { url = "https://vimeo.com/446721307"
              , label = "Rastsvetai on Marxa Video"
              }
            , { url = "https://vimeo.com/449205141"
              , label = "Rastsvetai on Gogolya Video"
              }
            ]
      }
    , { slug = "2gis"
      , title = "2GIS"
      , experienceType = WorkExperience
      , skills = "Graphic Design, Illustration, Motion Design, Visual Identity"
      , description = "Promoted the product & developed 2GIS's corporate identity, working in the areas of creation of graphics on the web & offline, creation of short animated videos, designing presentations, branding of events."
      , thumbnail = { url = "/images/design-experience/2gis/thumbnail.jpg", description = "", placeholderColor = rgb255 0x05 0xA8 0x2E }
      , backgroundColor = rgb255 0x39 0xC7 0x01
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/2gis/images/1.jpg", description = "", placeholderColor = rgb255 0x26 0x26 0x26 }
            , img2 = { url = "/images/design-experience/2gis/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/2gis/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/2gis/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/2gis/images/5.jpg", description = "", placeholderColor = rgb255 0x29 0xB7 0x00 }
                , img4 = { url = "/images/design-experience/2gis/images/6.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/2gis/images/7.jpg", description = "", placeholderColor = rgb255 0x29 0xB7 0x00 }
                , img2 = { url = "/images/design-experience/2gis/images/8.jpg", description = "", placeholderColor = rgb255 0x26 0x26 0x26 }
                }
            ]
      , links =
            [ { url = "https://disk.yandex.ru/i/M0laj7iw3faFCw"
              , label = "2GIS UAE Hotels Presentation"
              }
            , { url = "https://disk.yandex.ru/i/0mnqQ-12OnLj9g"
              , label = "2GIS Franchise Presentation"
              }
            , { url = "https://vimeo.com/437331502"
              , label = "2GIS Agents Achievements Promo Video"
              }
            ]
      }
    , { slug = "sclux"
      , title = "SCLUX"
      , experienceType = WorkExperience
      , skills = "Art Direction, Graphic Design, Motion Design, No-Code Development, Visual Identity, Web Design"
      , description = "Created brand identity for SCLUX (pronounced like ascaleuxe), a salon specializing in bathroom interior design, product sales & high-quality ceramic tiles. I enhanced its online & offline visibility by creating a Tilda website, producing social media content, editing videos, animating for YouTube & designing printed materials."
      , thumbnail = { url = "/images/design-experience/sclux/thumbnail.jpg", description = "", placeholderColor = rgb255 0x32 0x32 0x32 }
      , backgroundColor = rgb255 0x1A 0x1A 0x1A
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/sclux/images/1.jpg", description = "", placeholderColor = rgb255 0x32 0x32 0x32 }
            , img2 = { url = "/images/design-experience/sclux/images/2.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/sclux/images/3.jpg", description = "", placeholderColor = rgb255 0x32 0x32 0x32 }
                , img2 = { url = "/images/design-experience/sclux/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/sclux/images/5.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/sclux/images/6.jpg", description = "", placeholderColor = rgb255 0xFB 0xE9 0x42 }
                }
            ]
      , links = []
      }
    , { slug = "inconspt"
      , title = "Selected elements of inconsistent periodic table"
      , experienceType = PersonalProject
      , skills = "Art Direction, Graphic Design, Illustration"
      , description = "Experimental vision of names of selected chemical elements of Mendeleev's periodic table in Russian. There is no connection between the displaying of an element & its physical or chemical properties. Main sources of inspiration were the art of True Norwegian Black Metal bands & graphic design works of Böfüms studio."
      , thumbnail = { url = "/images/design-experience/inconspt/thumbnail.jpg", description = "", placeholderColor = rgb255 0xF6 0xEC 0x10 }
      , backgroundColor = rgb255 0x1A 0x1A 0x1A
      , textColor = WhiteText
      , firstImages =
            { img1 = { url = "/images/design-experience/inconspt/images/1.jpg", description = "", placeholderColor = rgb255 0xF6 0xEC 0x10 }
            , img2 = { url = "/images/design-experience/inconspt/images/2.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0x00 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/inconspt/images/3.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/inconspt/images/4.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0xFE }
                , img3 = { url = "/images/design-experience/inconspt/images/5.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/inconspt/images/6.jpg", description = "", placeholderColor = rgb255 0x94 0x94 0x94 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/inconspt/images/7.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img2 = { url = "/images/design-experience/inconspt/images/8.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/inconspt/images/9.jpg", description = "", placeholderColor = rgb255 0xFF 0xFF 0xFF }
                , img2 = { url = "/images/design-experience/inconspt/images/10.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/inconspt/images/11.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/inconspt/images/12.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/inconspt/images/13.jpg", description = "", placeholderColor = rgb255 0x00 0x00 0x00 }
                , img2 = { url = "/images/design-experience/inconspt/images/14.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/inconspt/images/15.jpg", description = "", placeholderColor = rgb255 0xFF 0xFF 0xFF }
                , img2 = { url = "/images/design-experience/inconspt/images/16.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/inconspt/images/17.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/inconspt/images/18.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/inconspt/images/19.jpg", description = "", placeholderColor = rgb255 0xFE 0x00 0x00 }
                , img2 = { url = "/images/design-experience/inconspt/images/20.jpg", description = "", placeholderColor = rgb255 0xBB 0x1F 0x3E }
                }
            , ImageRow4
                { img1 = { url = "/images/design-experience/inconspt/images/21.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img2 = { url = "/images/design-experience/inconspt/images/22.jpg", description = "", placeholderColor = rgb255 0x55 0x55 0x55 }
                , img3 = { url = "/images/design-experience/inconspt/images/23.jpg", description = "", placeholderColor = rgb255 0x33 0x33 0x33 }
                , img4 = { url = "/images/design-experience/inconspt/images/24.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links = []
      }
    , { slug = "vegyrain"
      , title = "Vegetable rain falls through leguminous evaporation"
      , experienceType = PersonalProject
      , skills = "Art Direction, Illustration"
      , description = "Drawliner, drawing paper. Triptych 420×891mm, 2017—2020. The entire work was a stream of pure creativity & has no specific references."
      , thumbnail = { url = "/images/design-experience/vegyrain/thumbnail.jpg", description = "", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
      , backgroundColor = rgb255 0xFF 0xFF 0xFF
      , textColor = BlackText
      , firstImages =
            { img1 = { url = "/images/design-experience/vegyrain/images/1.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
            , img2 = { url = "/images/design-experience/vegyrain/images/2.jpg", description = "", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
            }
      , restImages =
            [ ImageRow4
                { img1 = { url = "/images/design-experience/vegyrain/images/3.jpg", description = "", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
                , img2 = { url = "/images/design-experience/vegyrain/images/4.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img3 = { url = "/images/design-experience/vegyrain/images/5.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                , img4 = { url = "/images/design-experience/vegyrain/images/6.jpg", description = "", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
                }
            , ImageRow2
                { img1 = { url = "/images/design-experience/vegyrain/images/7.jpg", description = "", placeholderColor = rgb255 0xA7 0xA7 0xA7 }
                , img2 = { url = "/images/design-experience/vegyrain/images/8.jpg", description = "", placeholderColor = rgb255 0xF2 0xF2 0xF2 }
                }
            ]
      , links = []
      }
    ]
