let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Volume : Type = { 
    , type      : Text 
    , source    : Optional Text 
    , target    : Optional Text
    , read_only : Optional Bool
    , consistency : Optional Text
    -- , bind      : Optional { propegation : Optional Text }
    -- , volume    : Optional { nocopy : Optional Text }
    -- , tmpfs     : Optional { size : Optional Integer }
}
let default = {
    , source    = None Text 
    , target    = None Text
    , read_only = None Bool
    , consistency = None Text
    -- , bind      = None { } -- { propegation = None Text }
    -- , volume    = None { } -- { nocopy = None Text }
    -- , tmpfs     = None { } -- { size = None Integer }
}

let combine = \( left : Volume ) -> \( right : Volume ) ->
    ( default // left // right ) : Volume

let mixin = \( mixins : List Volume ) -> \( target : Volume ) -> List/fold Volume mixins Volume combine target

in { Type = Volume, default, combine, mixin }