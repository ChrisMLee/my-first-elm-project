module Main exposing (..)

import Html.App exposing (beginnerProgram)
import Html exposing (Html, Attribute, div, input, text, p, h1)
import ParserComponent exposing (Model, Msg, init, view, update)

-- Main
main =
    Html.App.beginnerProgram
        { model = init "" ""
        , view = view
        , update = update
        }

-- Model
type alias Model =
    { firstParser : ParserComponent.Model
    , secondParser : ParserComponent.Model
    }


init : String -> String -> Model
init first second =
  { firstParser = ParserComponent.init first
    , secondParser = ParserComponent.init second
  }

-- UPDATE


type Msg
    = First ParserComponent.Msg
    | Second ParserComponent.Msg


update : Msg -> Model -> Model
update msg model =
 case msg of
   First m ->
     { model | firstParser = ParserComponent.update m model.firstParser}

   Second m ->
     { model | secondParser = ParserComponent.update m model.secondParser}

-- VIEW

view model =
    div [] [ 
      div []
          [ 
          h1 [] [text "first"]
          , Html.App.map First
              (ParserComponent.view model.firstParser)
          ]
      , div []
          [ 
          h1 [] [text "second"]
          , Html.App.map Second
              (ParserComponent.view model.secondParser)
          ]
    ]