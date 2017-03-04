module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Models exposing (Model, Clicker)


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ button [ onClick (Msgs.Update) ] [ text "update" ] ]
        , div []
            [ button [ onClick (Msgs.OnCookieClick) ] [ text "cookie" ] ]
        , div []
            [ text (toString model.cookies ++ " cookies") ]
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
        , td [] [ text (toString (clicker.cps * clicker.amount)) ]
        , td [] [ button [ onClick (Msgs.Buy clicker) ] [ text "buy" ] ]
        ]
