port module Layouts.WebappLayout exposing (Model, Msg, Props, layout)

import Effect exposing (Effect)
import Element exposing (..)
import GridLayout2
import Layout exposing (Layout)
import Route exposing (Route)
import Shared
import TextStyle
import View exposing (View)


port urlChanged : () -> Cmd msg


type alias Props =
    {}


layout : Props -> Shared.Model -> Route () -> Layout () Model Msg contentMsg
layout _ shared _ =
    Layout.new
        { init = init
        , update = update
        , view = view shared
        , subscriptions = always Sub.none
        }
        |> Layout.withOnUrlChanged (always UrlChanged)



-- MODEL


type alias Model =
    {}


init : () -> ( Model, Effect Msg )
init _ =
    ( {}
    , Effect.none
    )



-- UPDATE


type Msg
    = UrlChanged


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        UrlChanged ->
            ( model, Effect.sendCmd <| urlChanged () )



-- VIEW


view : Shared.Model -> { toContentMsg : Msg -> contentMsg, content : View contentMsg, model : Model } -> View contentMsg
view shared { content } =
    { title = content.title
    , attributes = GridLayout2.bodyAttributes shared.layout ++ TextStyle.body.attrs ++ content.attributes
    , element =
        let
            outerElementAttrs : List (Attribute msg)
            outerElementAttrs =
                []

            innerElementAttrs : List (Attribute msg)
            innerElementAttrs =
                []

            outerElement : List (Element msg) -> Element msg
            outerElement =
                column (GridLayout2.layoutOuterAttributes ++ outerElementAttrs)

            innerElement : List (Element msg) -> Element msg
            innerElement =
                column (GridLayout2.layoutInnerAttributes shared.layout ++ innerElementAttrs)
        in
        outerElement [ innerElement [ content.element ] ]
    }
