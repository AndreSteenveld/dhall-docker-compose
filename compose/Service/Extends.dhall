let Extends = { }

let default_extends = {=}

let combine 
    : Extends -> Extends -> Extends
    = \( left : Extends ) -> \( right : Extends ) ->
        default_extends // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Extends ) -> \( target : Service ) -> List/fold Extends mixins Extends combine target

in {
    , Type    = Extends
    , default = default_extends
    , combine, mixin
}