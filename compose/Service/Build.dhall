let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Map = https://prelude.dhall-lang.org/Map/Type

let Build : Type = { 

    , context       : Optional Text
    , dockerfile    : Optional Text
    , args          : Optional ( Map Text Text )
    , labels        : Optional ( Map Text Text )
    , cache_from    : Optional ( List Text )
    , network       : Optional Text
    , target        : Optional Text
    , shm_size      : Optional Text
    , extra_hosts   : Optional ( Map Text Text )
    , isolation     : Optional Text

}

let default : Build = {

    , context       = None Text
    , dockerfile    = None Text
    , args          = None ( Map Text Text )
    , labels        = None ( Map Text Text )
    , cache_from    = None ( List Text )
    , network       = None Text
    , target        = None Text
    , shm_size      = None Text
    , extra_hosts   = None ( Map Text Text )
    , isolation     = None Text

}

let combine = \( left : Build ) -> \( right : Build ) ->
    ( default // left // right ) : Build

let mixin = \( mixins : List Build ) -> \( target : Build ) -> List/fold Build mixins Build combine target

in { Type = Build, default, combine, mixin }