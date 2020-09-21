let Network = { }

let default_network = {=}

let combine 
    : Network -> Network -> Network
    = \( left : Network ) -> \( right : Network ) ->
        default_network // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Network ) -> \( target : Service ) -> List/fold Network mixins Network combine target

in {
    , Type    = Network
    , default = default_network
    , combine, mixin
}