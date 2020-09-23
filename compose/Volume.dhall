let `List/fold` = https://prelude.dhall-lang.org/List/fold
let Map = https://prelude.dhall-lang.org/Map/Type

let Volume : Type = { 

    , name      : Optional Text
    , driver    : Optional Text
    , driver_opts : Optional ( Map Text Text )
    , external  : Optional Bool
    , labels    : Optional ( Map Text Text )

}
let default = {

    , name      = None Text
    , driver    = None Text
    , driver_opts = None ( Map Text Text )
    , external  = None Bool
    , labels    = None ( Map Text Text )

}

let combine = \( left : Volume ) -> \( right : Volume ) ->
    ( default // left // right ) : Volume

let mixin = \( mixins : List Volume ) -> \( target : Volume ) -> List/fold Volume mixins Volume combine target

in { Type = Volume, default, combine, mixin }