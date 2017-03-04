module Msgs exposing (..)

import Models exposing (Clicker)
import Time exposing (..)


type Msg
    = OnCookieClick
    | Update Time
    | Buy Clicker Int
