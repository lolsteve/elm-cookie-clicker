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
        ]
    }
