let Port = { }

let default_port = {=}

let combine 
    : Port -> Port -> Port
    = \( left : Port ) -> \( right : Port ) ->
        default_port // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Port ) -> \( target : Service ) -> List/fold Port mixins Port combine target

in {
    , Type    = Port
    , default = default_port
    , combine, mixin
}