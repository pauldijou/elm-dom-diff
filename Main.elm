module Main exposing (..)

import Html.App
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Item exposing (Msg (Close))

type alias Model =
  { first: Maybe String
  , second: Maybe Item.Model
  }

type Msg
  = ItemMsg Item.Msg
  | OpenFirst
  | CloseFirst
  | OpenSecond

model =
  { first = Nothing
  , second = Nothing
  }

main =
  Html.App.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

viewFirst first =
  div
    [ class "item open", onClick CloseFirst ]
    [ text first ]

viewSecond second =
  Html.App.map ItemMsg (Item.view second)

view model =
  div
    []
    [ h1 [] [ text "elm-dom-diff" ]
    , button [ onClick OpenFirst ] [ text "Open first item" ]
    , button [ onClick OpenSecond ] [ text "Open second item" ]
    , Maybe.withDefault (div [ class "item" ] []) (Maybe.map viewFirst model.first)
    , Maybe.withDefault (div [ class "item" ] []) (Maybe.map viewSecond model.second)
    , div [] [ text "(click on item to remove it)" ]
    ]

update msg model =
  case msg of
    OpenFirst -> { model | first = Just "Here is the first item, with nice CSS opacity transition" }
    CloseFirst -> { model | first = Nothing }
    OpenSecond -> { model | second = Just "Here is the second item, without any CSS transition" }
    ItemMsg Close -> { model | second = Nothing }
