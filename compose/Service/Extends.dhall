let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Extends : Type = { 
    , service : Text
    , file : Optional Text
}

let default = { file = None Text }

let combine = \( left : Extends ) -> \( right : Extends ) ->
    ( default // left // right ) : Extends

let mixin = \( mixins : List Extends ) -> \( target : Extends ) -> List/fold Extends mixins Extends combine target

in { Type = Extends, default, combine, mixin }