module Models exposing (..)


type alias Model =
    { cookies : Int
    , clickers : List Clicker
    }


type alias ClickerId =
    String


type alias Clicker =
    { id : ClickerId
    , cps : Int
    , amount : Int
    , basecost : Int
    , cost : Int
    }


cursorClicker : Clicker
cursorClicker =
    { id = "Cursor"
    , cps = 1
    , amount = 0
    , basecost = 10
    , cost = 10
    }


grandmaClicker : Clicker
grandmaClicker =
    { id = "Grandma"
    , cps = 5
    , amount = 0
    , basecost = 100
    , cost = 100
    }


farmClicker : Clicker
farmClicker =
    { id = "Farm"
    , cps = 20
    , amount = 0
    , basecost = 500
    , cost = 500
    }


mineClicker : Clicker
mineClicker =
    { id = "Mine"
    , cps = 100
    , amount = 0
    , basecost = 3000
    , cost = 3000
    }


factoryClicker : Clicker
factoryClicker =
    { id = "Factory"
    , cps = 400
    , amount = 0
    , basecost = 10000
    , cost = 10000
    }


shipmentClicker : Clicker
shipmentClicker =
    { id = "Shipment"
    , cps = 1000
    , amount = 0
    , basecost = 40000
    , cost = 40000
    }


alchemyClicker : Clicker
alchemyClicker =
    { id = "Alchemy Lab"
    , cps = 4000
    , amount = 0
    , basecost = 200000
    , cost = 200000
    }


portalClicker : Clicker
portalClicker =
    { id = "Portal"
    , cps = 66666
    , amount = 0
    , basecost = 1666666
    , cost = 1666666
    }


timeClicker : Clicker
timeClicker =
    { id = "Time Machine"
    , cps = 987654
    , amount = 0
    , basecost = 123456789
    , cost = 123456789
    }


antimatterClicker : Clicker
antimatterClicker =
    { id = "Antimatter Condenser"
    , cps = 9999999
    , amount = 0
    , basecost = 3999999999
    , cost = 3999999999
    }


initialModel : Model
initialModel =
    { cookies = 0
    , clickers =
        [ cursorClicker
        , grandmaClicker
        , farmClicker
        , mineClicker
        , factoryClicker
        , shipmentClicker
        , alchemyClicker
        , portalClicker
        , timeClicker
        , antimatterClicker
        ]
    }


calcCPS : Clicker -> Int
calcCPS clicker =
    clicker.cps * clicker.amount


totalCPS : Model -> Int
totalCPS model =
    let
        cps =
            List.map calcCPS model.clickers
    in
        List.sum cps
