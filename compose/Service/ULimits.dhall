let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Ulimits : Type = { 
    , hard : Natural
    , soft : Natural
}
let default = {=}

let combine = \( left : Ulimits ) -> \( right : Ulimits ) ->
    ( default // left // right ) : Ulimits

let mixin = \( mixins : List Ulimits ) -> \( target : Ulimits ) -> List/fold Ulimits mixins Ulimits combine target

in { Type = Ulimits, default, combine, mixin }