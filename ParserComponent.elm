module ParserComponent exposing (..)

import Html exposing (Html, Attribute, div, input, text, p)
import Html.Attributes exposing (style, placeholder)
import Html.App exposing (beginnerProgram, map)
import Html.Events exposing (onClick, onInput)

import PlayerParser

-- Main
main =
    Html.App.beginnerProgram
        { model = init ""
        , view = view
        , update = update
        }

-- MODEL
type alias Model =
  { 
    content : String
  }


init : String -> Model
init str =
  Model str

-- UPDATE

type Msg
  = Change String

-- { model | content <- value } returns model record with content field set to a new value.

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


-- VIEW

view model =   
  let 
    player = 
      PlayerParser.spellPlayer model.content
  in
  div [ mainStyle ]
    [ input[ inputStyle 
    , placeholder "Type your player ..."
    , onInput Change
    ] []
    , p [cardStyle] [ text player]

    ]



mainStyle =
    style
        [ ( "font-family", "-apple-system, system, sans-serif" )
        , ( "margin", "10px" )
        , ( "padding", "40px" )
        , ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "align-items", "stretch" )
        , ( "background-color", "#fafafa" )
        , ( "border", "lightgray solid 1px" )
        ]


inputStyle =
    style
        [ ( "border", "#fafafa solid" )
        , ( "border-bottom", "lightgray solid 1px" )
        , ( "font-size", "2em" )
        , ( "color", "rgba(0,0,0,0.75)" )
        , ( "background-color", "#fafafa" )
        ]


cardStyle =
    style
        [ ( "font-size", "2em" )
        , ( "color", "rgba(0,0,0,0.75)" )
        ]