module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model, Clicker, totalCPS)


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
                    { model
                        | cookies =
                            model.cookies + (totalCPS model)
                    }
            in
                ( updatedModel, Cmd.none )

        Msgs.Buy clicker howMuch ->
            if model.cookies >= clicker.cost then
                let
                    updatedClicker =
                        { clicker
                            | amount = clicker.amount + howMuch
                            , cost =
                                floor
                                    ((toFloat clicker.basecost)
                                        * 1.15
                                        ^ toFloat (clicker.amount + howMuch)
                                    )
                        }

                    updatedModel =
                        { model
                            | cookies =
                                model.cookies
                                    - floor
                                        (toFloat
                                            ((howMuch * clicker.cost))
                                        )
                        }
                in
                    ( updateClicker updatedModel updatedClicker, Cmd.none )
            else
                ( model, Cmd.none )

        Msgs.Sell clicker howMuch ->
            if clicker.amount > 0 then
                let
                    updatedClicker =
                        { clicker
                            | amount = clicker.amount - howMuch
                            , cost =
                                floor
                                    ((toFloat clicker.basecost)
                                        * 1.15
                                        ^ toFloat (clicker.amount - howMuch)
                                    )
                        }

                    updatedModel =
                        { model
                            | cookies =
                                model.cookies
                                    + floor
                                        (toFloat
                                            ((howMuch * clicker.cost))
                                            * 0.5
                                        )
                        }
                in
                    ( updateClicker updatedModel updatedClicker, Cmd.none )
            else
                ( model, Cmd.none )


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
