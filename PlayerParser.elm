module PlayerParser exposing (..)

import Html exposing (text)
import String

type Position = Forward | Midfielder | Defender | Goalie
type Club = Barcelona | Atletico | Sevilla | Real


printClub club = toString club

printPosition position = toString position

printPlayer : Player -> String
printPlayer (position, club) =
  [printPosition position, " at ", printClub club] |> String.concat

type alias Player = (Position, Club)

-- type Maybe a
--  = Just a
--  | Nothing

parseClub : Char -> Maybe Club
parseClub s =
  case s of
    'B' -> Just Barcelona
    'A' -> Just Atletico
    'S' -> Just Sevilla
    'R' -> Just Real
    _ -> Nothing



parsePosition : String -> Maybe Position
parsePosition s = 
   case s of
    "F" -> Just Forward
    "M" -> Just Midfielder
    "D" -> Just Defender
    "G" -> Just Goalie
    _ -> Nothing

dividePlayerString : String -> (Maybe String, Maybe Char)
dividePlayerString str =
  let
    chars = String.toList str
    
    club = chars
      |> List.reverse
      |> List.head
      
    position = chars
      |> List.reverse
      |> List.tail
      |> Maybe.map List.reverse
      |> Maybe.map String.fromList
    
    in
      (position, club)

parsePlayerTuple : (Maybe String, Maybe Char) -> Maybe Player
parsePlayerTuple (position, club) = 
  case (position `Maybe.andThen` parsePosition, club `Maybe.andThen` parseClub) of
    (Just p, Just c) ->
      Just (p, c)

    _ ->
      Nothing

--spellPlayer : String -> ( Maybe String, Maybe Char )
spellPlayer str =
  str
    |> dividePlayerString
    |> parsePlayerTuple
    |> Maybe.map printPlayer
    |> Maybe.withDefault "-- unknown player --"
    
--main =
--  "FS"
--    |> spellPlayer
--    |> text
--    