module Data.Contacts exposing (links, myName)

import Data.DesignExperience exposing (Link)


links : List Link
links =
    [ { label = "linkedin", url = "https://linkedin.com/in/christophersamoilov" }
    , { label = "telegram", url = "https://t.me/christophersamoilov" }
    , { label = "email", url = "mailto:christophersamoilov@gmail.com" }
    ]


myName : String
myName =
    "Christopher Samoilov"
