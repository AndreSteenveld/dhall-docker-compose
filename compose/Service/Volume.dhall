let Volume = { }

let default_volume = {=}

let combine 
    : Volume -> Volume -> Volume
    = \( left : Volume ) -> \( right : Volume ) ->
        default_volume // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Volume ) -> \( target : Service ) -> List/fold Volume mixins Volume combine target

in {
    , Type    = Volume
    , default = default_volume
    , combine, mixin
}