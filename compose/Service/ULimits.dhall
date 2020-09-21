let ULimits = { }

let default_ulimits = {=}

let combine 
    : ULimits -> ULimits -> ULimits
    = \( left : ULimits ) -> \( right : ULimits ) ->
        default_ulimits // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List ULimits ) -> \( target : Service ) -> List/fold ULimits mixins ULimits combine target

in {
    , Type    = ULimits
    , default = default_ulimits
    , combine, mixin
}