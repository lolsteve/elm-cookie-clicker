module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Models exposing (Model, Clicker, calcCPS, totalCPS)
import Bootstrap.Grid exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ node "link"
            [ Html.Attributes.rel "stylesheet", Html.Attributes.href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
            []
        , containerFluid
            [ row
                [ column [ Medium Four ]
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
                    ]
                , column [ Medium Four ]
                    (List.map clickerBox model.clickers)
                ]
            ]
        ]


clickerBox : Clicker -> Html Msg
clickerBox clicker =
    div []
        [ strong [] [ text clicker.id ]
        , div [] [ text ("Price: " ++ (toString clicker.cost)) ]
        , div [] [ text ("Owned: " ++ (toString clicker.amount)) ]
        , div []
            [ button [ onClick (Msgs.Buy clicker 1) ] [ text "Buy" ]
            , button [ onClick (Msgs.Sell clicker 1) ] [ text "Sell" ]
            ]
        , span []
            [ text ("CPS: " ++ (toString clicker.cps)) ]
        , span []
            [ text ("TCPS: " ++ (toString (calcCPS clicker))) ]
        ]
