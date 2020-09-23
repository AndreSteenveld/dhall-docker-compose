let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Limit = { 
    , Type    = { path : Optional Text , rate : Optional Text } 
    , default = { path = None Text , rate = None Text }
}

let Weight = {
    , Type    = { path : Optional Text , weight : Optional Natural }
    , default = { path = None Text , weight = None Natural }
}

let BlockIOConfig = { 
    , device_read_bps  : Optional ( List Limit.Type )
    , device_read_iops : Optional ( List Limit.Type )
    
    , device_write_bps : Optional ( List Limit.Type )
    , device_write_iops : Optional ( List Limit.Type )

    , weight : Optional Integer
    , weight_device : Optional ( List Weight.Type )
}
let default : BlockIOConfig = {
    , device_read_bps  = None ( List Limit.Type )
    , device_read_iops = None ( List Limit.Type )
    
    , device_write_bps  = None ( List Limit.Type )
    , device_write_iops = None ( List Limit.Type )

    , weight = None Integer
    , weight_device = None ( List Weight.Type )
}

let combine = \( left : BlockIOConfig ) -> \( right : BlockIOConfig ) ->
    ( default // left // right ) : BlockIOConfig

let mixin = \( mixins : List BlockIOConfig ) -> \( target : BlockIOConfig ) -> List/fold BlockIOConfig mixins BlockIOConfig combine target

in { 
    , Type = BlockIOConfig, default, combine, mixin 
    , Limit, Weight
}