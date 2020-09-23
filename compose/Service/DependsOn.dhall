let `List/fold` = https://prelude.dhall-lang.org/List/fold

let DependsOn : Type = { condition : Text }
let default : DependsOn = { condition = "service_started" }

let combine = \( left : DependsOn ) -> \( right : DependsOn ) ->
    ( default // left // right ) : DependsOn

let mixin = \( mixins : List DependsOn ) -> \( target : DependsOn ) -> List/fold DependsOn mixins DependsOn combine target

in { Type = DependsOn, default, combine, mixin }