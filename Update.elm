module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model, Clicker)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnCookieClick ->
            let
                updatedModel =
                    { model | cookies = model.cookies + 1 }
            in
                ( updatedModel, Cmd.none )

        Msgs.Update time ->
            let
                updatedModel =
                    { model | cookies = model.cookies + (calcCookies model.clickers) }
            in
                ( updatedModel, Cmd.none )

        Msgs.Buy clicker howMuch ->
            let
                updatedClicker =
                    { clicker | amount = clicker.amount + howMuch }

                updatedModel =
                    { model | cookies = model.cookies - (howMuch * clicker.cost) }
            in
                ( updateClicker updatedModel updatedClicker, Cmd.none )


updateClicker : Model -> Clicker -> Model
updateClicker model updatedClicker =
    let
        pick currentClicker =
            if updatedClicker.id == currentClicker.id then
                updatedClicker
            else
                currentClicker

        updatedClickers =
            List.map pick model.clickers
    in
        { model | clickers = updatedClickers }


calcCookie : Clicker -> Int
calcCookie clicker =
    clicker.cps * clicker.amount


calcCookies : List Clicker -> Int
calcCookies clickers =
    let
        cookies =
            List.map calcCookie clickers
    in
        List.sum cookies
