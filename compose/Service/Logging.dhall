let Logging = { }

let default_logging = {=}

let combine 
    : Logging -> Logging -> Logging
    = \( left : Logging ) -> \( right : Logging ) ->
        default_logging // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Logging ) -> \( target : Service ) -> List/fold Logging mixins Logging combine target

in {
    , Type    = Logging
    , default = default_logging
    , combine, mixin
}

  {-
        JSON.types?
        Logging::{
            driver = "logging driver"
            options = toMap {

                , driver_option = Type.Text "a property"
                , other_option  = Type.Number 123

            }
        }

    -}