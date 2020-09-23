let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Port : Type = { 
    , mode      : Optional Text
    , target    : Natural
    , published : Natural
    , protocol  : Optional Text
}
let default = {
    , mode      = None Text
    , protocol  = None Text
}

let combine = \( left : Port ) -> \( right : Port ) ->
    ( default // left // right ) : Port

let mixin = \( mixins : List Port ) -> \( target : Port ) -> List/fold Port mixins Port combine target

in { Type = Port, default, combine, mixin }