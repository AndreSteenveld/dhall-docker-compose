let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Config : Type = { 
    , source : Text
    , target : Text
    
    , uid  : Optional Text
    , gid  : Optional Text
    , mode : Optional Integer
}

let default = {
    , uid  = None Text
    , gid  = None Text
    , mode = None Integer
}

let combine = \( left : Config ) -> \( right : Config ) ->
    ( default // left // right ) : Config

let mixin = \( mixins : List Config ) -> \( target : Config ) -> List/fold Config mixins Config combine target

in { Type = Config, default, combine, mixin }