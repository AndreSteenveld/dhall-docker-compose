let `List/fold` = https://prelude.dhall-lang.org/List/fold
let Map = https://prelude.dhall-lang.org/Map/Type

let OperationConfig = ./Deploy/OperationConfig.dhall
let Resources = ./Deploy/Resources/dhall

let Deploy : Type = { 
    , mode          : Optional Text
    , endpoint_mode : Optional Text
    , replicas      : Optional Integer
    , labels        : Optional ( Map Text Text )
    , rollback_config : Optional OperationConfig.Type
    , update_config : Optional OperationConfig.Type
    , resources     : Optional Resources.Type
}

let default = {
    , mode          = None Text
    , endpoint_mode = None Text
    , replicas      = None Integer
    , labels        = None ( Map Text Text )
    , rollback_config = None OperationConfig.Type
    , update_config = None OperationConfig.Type
    , resources     = None Resources.Type
}

let combine = \( left : Deploy ) -> \( right : Deploy ) ->
    ( default // left // right ) : Deploy

let mixin = \( mixins : List Deploy ) -> \( target : Deploy ) -> List/fold Deploy mixins Deploy combine target

in { 
    Type = Deploy, default, combine, mixin 
    OperationConfig, Resources
}