port module Layouts.WebappLayout exposing (Model, Msg, Props, layout)

import Constants
import Effect exposing (Effect)
import Element exposing (..)
import Layout exposing (Layout)
import Route exposing (Route)
import Shared
import TextStyle
import View exposing (View)
import Window exposing (..)


port urlChanged : () -> Cmd msg

type alias Props =
    {}


layout : Props -> Shared.Model -> Route () -> Layout () Model Msg contentMsg
layout _ shared _ =
    Layout.new
        { init = init
        , update = update
        , view = view shared
        , subscriptions = subscriptions
        }
        |> Layout.withOnUrlChanged UrlChanged



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
    = UrlChanged { from : Route (), to : Route () }


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        UrlChanged _ ->
           ( model, Effect.sendCmd <| urlChanged ())


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Shared.Model -> { toContentMsg : Msg -> contentMsg, content : View contentMsg, model : Model } -> View contentMsg
view shared { content } =
    { title = content.title
    , attributes = content.attributes
    , element =
        let
            outerElement =
                column (width fill :: TextStyle.body)

            innerElement =
                column
                    ((case shared.screenClass of
                        SmallScreen ->
                            [ width (fill |> minimum Constants.minimalSupportedMobileScreenWidth)
                            , padding Constants.layoutPaddingSmallScreen
                            ]

                        BigScreen ->
                            [ width (fill |> maximum Constants.contentWithPaddingsMaxWidthBigScreen)
                            , padding Constants.layoutPaddingBigScreen
                            ]
                     )
                        ++ [ centerX ]
                    )
        in
        outerElement [ innerElement [ content.element ] ]
    }