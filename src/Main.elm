module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    Int


init : Model
init =
    0


type Msg
    = Clicked


update : Msg -> Model -> Model
update msg model =
    case msg of
        Clicked ->
            model


showFib : Int -> Html msg
showFib n =
    div
        []
        [ text ("Fibonacci of" ++ String.fromInt n ++ " = " ++ String.fromInt (expensiveFibonacci n)) ]


view : Model -> Html Msg
view count =
    div []
        [ text <| "Model:" ++ String.fromInt count
        , button [ class "btn btn-primary", onClick Clicked ] [ text "Trigger update" ]
        , showFib 43
        , button [ class "btn btn-primary" ] [ text "No event" ]
        ]


expensiveFibonacci : Int -> Int
expensiveFibonacci n =
    case n of
        0 ->
            0

        1 ->
            1

        _ ->
            expensiveFibonacci (n - 1) + expensiveFibonacci (n - 2)
