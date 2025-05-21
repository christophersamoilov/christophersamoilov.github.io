module Data.Contacts exposing (links, myName)

import Components.Link exposing (Link)


links : List Link
links =
    [ { label = "linkedin", url = "https://linkedin.com/in/christophersamoilov" }
    , { label = "telegram", url = "https://t.me/christophersamoilov" }
    , { label = "email", url = "mailto:christophersamoilov@gmail.com" }
    , { label = "CV", url = "https://disk.yandex.ru/i/4OC6gneAZJfC2w" }
    ]


myName : String
myName =
    "Christopher Samoilov"
