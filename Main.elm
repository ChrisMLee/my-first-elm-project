module Main exposing (..)

import Html.App exposing (beginnerProgram)
import ParserComponent exposing (Model, Msg, init, view, update)

-- Main
main =
    Html.App.beginnerProgram
        { model = ParserComponent.init ""
        , view = ParserComponent.view
        , update = ParserComponent.update
        }

-- Model
--type alias Model =
--    { firstParser : ParserComponent.Model
--    , secondParser : ParserComponent.Model
--    }

--init first second =
--    Model first second