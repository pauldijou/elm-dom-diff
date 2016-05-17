module Item exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type Msg
  = Close

type alias Model = String

view model =
  div
    [ class "item open", onClick Close ]
    [ text model ]

update msg model =
  case msg of
    Close -> model
