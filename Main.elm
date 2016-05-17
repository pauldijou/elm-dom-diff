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

type ItemId = Second | Third

type Msg
  = ItemMsg ItemId Item.Msg
  | OpenFirst
  | CloseFirst
  | OpenSecond
  | OpenThird

model =
  { first = Nothing
  , second = Nothing
  , third = Nothing
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
  Html.App.map (ItemMsg Second) (Item.view second)

view model =
  div
    []
    [ h1 [] [ text "elm-dom-diff" ]
    , button [ onClick OpenFirst ] [ text "Open first item" ]
    , button [ onClick OpenSecond ] [ text "Open second item" ]
    , button [ onClick OpenThird ] [ text "Open third item" ]
    -- Raw display from Main.elm
    , Maybe.withDefault (div [ class "item" ] []) (Maybe.map viewFirst model.first)
    -- Html.map inside Maybe.withDefault
    , Maybe.withDefault (div [ class "item" ] []) (Maybe.map viewSecond model.second)
    -- Maybe.withDefault inside Html.map
    , Html.App.map (ItemMsg Third) (Maybe.withDefault (div [ class "item" ] []) (Maybe.map Item.view model.third))
    , div [] [ text "(click on item to remove it)" ]
    ]

update msg model =
  case msg of
    OpenFirst -> { model | first = Just "Here is the first item, with nice CSS opacity transition" }
    CloseFirst -> { model | first = Nothing }
    OpenSecond -> { model | second = Just "Here is the second item, without any CSS transition" }
    ItemMsg Second Close -> { model | second = Nothing }
    OpenThird -> { model | third = Just "Here is the third item, also with nice CSS opacity transition" }
    ItemMsg Third Close -> { model | third = Nothing }
