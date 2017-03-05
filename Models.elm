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


initialClicker : Clicker
initialClicker =
    { id = "Cursor"
    , cps = 1
    , amount = 0
    , basecost = 10
    , cost = 10
    }


initialClicker2 : Clicker
initialClicker2 =
    { id = "Grandma"
    , cps = 3
    , amount = 0
    , basecost = 100
    , cost = 100
    }


initialModel : Model
initialModel =
    { cookies = 0
    , clickers = [ initialClicker, initialClicker2 ]
    }
