let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Map = https://prelude.dhall-lang.org/Map/Type

let Logging : Type = { 
    , driver  : Text
    , options : Map Text Text
}
let default = {=}

let combine = \( left : Logging ) -> \( right : Logging ) ->
    ( default // left // right ) : Logging

let mixin = \( mixins : List Logging ) -> \( target : Logging ) -> List/fold Logging mixins Logging combine target

in { Type = Logging, default, combine, mixin }
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