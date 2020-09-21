

let Build = { }

let default_build = {=}

let combine 
    : Build -> Build -> Build
    = \( left : Build ) -> \( right : Build ) ->
        default_build // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Build ) -> \( target : Service ) -> List/fold Build mixins Build combine target

let constructor = \( value : < Text | Build > ) ->
    merge {
        , Text  = \( value : Text ) -> Build::{=}
        , Build = \( value : Build ) -> value
    }

in {
    , Type    = Build
    , default = default_build
    , combine, mixin, constructor
}