module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Models exposing (Model, Clicker, calcCPS, totalCPS)


view : Model -> Html Msg
view model =
    div []
        [ img
            [ src "images/cookie.png"
            , style [ ( "cursor", "pointer" ) ]
            , onClick (Msgs.OnCookieClick)
            ]
            []
        , h2 []
            [ text (toString model.cookies ++ " cookies") ]
        , h3 []
            [ text (toString (totalCPS model) ++ " cookies per second") ]
        , div []
            [ clickersList model.clickers ]
        ]


clickersList : List Clicker -> Html Msg
clickersList clickers =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "CPS" ]
                    , th [] [ text "Amount" ]
                    , th [] [ text "TCPS" ]
                    , th [] [ text "Cost" ]
                    , th [] [ text "Buy" ]
                    ]
                ]
            , tbody [] (List.map clickerRow clickers)
            ]
        ]


clickerRow : Clicker -> Html Msg
clickerRow clicker =
    tr []
        [ td [] [ text clicker.id ]
        , td [] [ text (toString clicker.cps) ]
        , td [] [ text (toString clicker.amount) ]
        , td [] [ text (toString (calcCPS clicker)) ]
        , td [] [ text (toString clicker.cost) ]
        , td []
            [ button
                [ onClick (Msgs.Buy clicker 1) ]
                [ text "buy" ]
            , button
                [ onClick (Msgs.Sell clicker 1) ]
                [ text "sell" ]
            ]
        ]
