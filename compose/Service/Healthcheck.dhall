let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Healthcheck : Type = { }
let default : Healthcheck = {=}

let combine = \( left : Healthcheck ) -> \( right : Healthcheck ) ->
    ( default // left // right ) : Healthcheck

let mixin = \( mixins : List Healthcheck ) -> \( target : Healthcheck ) -> List/fold Healthcheck mixins Healthcheck combine target

in { Type = Healthcheck, default, combine, mixin }