module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Models exposing (Model, Clicker, calcCPS, totalCPS)
import Bootstrap.Buttons exposing (..)
import Bootstrap.Panels exposing (..)
import Bootstrap.Grid exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ node "link"
            [ Html.Attributes.rel "stylesheet", Html.Attributes.href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
            []
        , container
            [ row
                [ column [ Medium Six ]
                    [ div
                        [ style [ ( "text-align", "center" ) ] ]
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
                    ]
                , column [ Medium Six ]
                    [ div
                        [ style
                            [ ( "overflow-y", "scroll" )
                            , ( "max-height", "100vh" )
                            ]
                        ]
                        (List.map clickerBox model.clickers)
                    ]
                ]
            ]
        ]


clickerBox : Clicker -> Html Msg
clickerBox clicker =
    div []
        [ panel NormalPanel
            []
            [ panelHeading (PanelH5 clicker.id) [] []
            , panelBody []
                [ span
                    [ style
                        [ ( "display", "inline-block" )
                        , ( "margin", "3px" )
                        , ( "vertical-align", "top" )
                        ]
                    ]
                    [ div [] [ text ("Price: " ++ (toString clicker.cost)) ]
                    , div [] [ text ("Owned: " ++ (toString clicker.amount)) ]
                    ]
                , span
                    [ style
                        [ ( "display", "inline-block" )
                        , ( "margin", "3px" )
                        , ( "vertical-align", "top" )
                        ]
                    ]
                    [ div []
                        [ text ("CPS: " ++ (toString clicker.cps)) ]
                    , div []
                        [ text ("TCPS: " ++ (toString (calcCPS clicker))) ]
                    ]
                , span
                    [ style
                        [ ( "display", "inline-block" )
                        , ( "margin", "3px" )
                        , ( "vertical-align", "top" )
                        ]
                    ]
                    [ btn BtnSuccess [] [] [ onClick (Msgs.Buy clicker 1) ] [ text "Buy" ]
                    , btn BtnDanger [] [] [ onClick (Msgs.Sell clicker 1) ] [ text "Sell" ]
                    ]
                ]
            ]
        ]
