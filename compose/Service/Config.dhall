let Config = { }

let default_config = {=}

let combine 
    : Config -> Config -> Config
    = \( left : Config ) -> \( right : Config ) ->
        default_config // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Config ) -> \( target : Service ) -> List/fold Config mixins Config combine target

in {
    , Type    = Config
    , default = default_config
    , combine, mixin
}