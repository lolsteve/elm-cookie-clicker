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
    }


initialClicker : Clicker
initialClicker =
    { id = "Cursor", cps = 1, amount = 0 }


initialClicker2 : Clicker
initialClicker2 =
    { id = "Grandma", cps = 3, amount = 0 }


initialModel : Model
initialModel =
    { cookies = 0
    , clickers = [ initialClicker, initialClicker2 ]
    }
