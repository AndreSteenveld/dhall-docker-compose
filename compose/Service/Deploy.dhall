let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Deploy : Type = { }
let default : Deploy = {=}

let combine = \( left : Deploy ) -> \( right : Deploy ) ->
    ( default // left // right ) : Deploy

let mixin = \( mixins : List Deploy ) -> \( target : Deploy ) -> List/fold Deploy mixins Deploy combine target

in { Type = Deploy, default, combine, mixin }