let `List/fold` = https://prelude.dhall-lang.org/List/fold
let Map = https://prelude.dhall-lang.org/Map/Type

let Config : Type = { 

    , name      : Optional Text
    , file      : Optional Text
    , external  : Optional Bool
    , labels    : Optional ( Map Text Text )
    , template_driver : Optional Text

}
let default = {

    , name      = None Text
    , file      = None Text
    , external  = None Bool
    , labels    = None ( Map Text Text )
    , template_driver = None Text

}

let combine = \( left : Config ) -> \( right : Config ) ->
    ( default // left // right ) : Config

let mixin = \( mixins : List Config ) -> \( target : Config ) -> List/fold Config mixins Config combine target

in { Type = Config, default, combine, mixin }