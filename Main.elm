module Main exposing (..)

import Html exposing (Html, program)
import Element exposing (el, layout, row, text)
import Element.Attributes exposing (spacing, padding)
import Style exposing (style, styleSheet)
import Style.Color as Color
import Color exposing (..)


type alias Model =
    String


type Msg
    = NoOp


type Styles
    = NavBar
    | Logo
    | NavOptoin
    | UserMenu


stylesheet =
    styleSheet
        [ style NavBar
            [ Color.background blue
            , Color.text white
            ]
        ]


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )


view : Model -> Html Msg
view model =
    layout
        stylesheet
        (row NavBar
            [ padding 10 ]
            [ el Logo [] (text "Project Bunny")
            , row UserMenu
                [ spacing 10 ]
                [ el NavOptoin [] (text "Home")
                , el NavOptoin [] (text "Home")
                , el NavOptoin [] (text "Home")
                ]
            ]
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
