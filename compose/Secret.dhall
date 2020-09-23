let `List/fold` = https://prelude.dhall-lang.org/List/fold
let Map = https://prelude.dhall-lang.org/Map/Type

let Secret : Type = { 

    , name      : Optional Text
    , file      : Optional Text
    , external  : Optional Bool
    , labels    : Optional ( Map Text Text )
    , driver    : Optional Text
    , driver_opts : Optional ( Map Text Text )
    , template_driver : Optional Text

}

let default = {
    
    , name      = None Text
    , file      = None Text
    , external  = None Text
    , labels    = None ( Map Text Text )
    , driver    = None Text
    , driver_opts = None ( Map Text Text )
    , template_driver = None Text

}

let combine = \( left : Secret ) -> \( right : Secret ) ->
    ( default // left // right ) : Secret

let mixin = \( mixins : List Secret ) -> \( target : Secret ) -> List/fold Secret mixins Secret combine target

in { Type = Secret, default, combine, mixin }