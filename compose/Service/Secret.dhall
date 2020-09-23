let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Secret : Type = { 
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

let combine = \( left : Secret ) -> \( right : Secret ) ->
    ( default // left // right ) : Secret

let mixin = \( mixins : List Secret ) -> \( target : Secret ) -> List/fold Secret mixins Secret combine target

in { Type = Secret, default, combine, mixin }