
let BlockIOConfig = { }

let default_block_io_config = {=}

let combine 
    : BlockIOConfig -> BlockIOConfig -> BlockIOConfig
    = \( left : BlockIOConfig ) -> \( right : BlockIOConfig ) ->
        default_block_io_config // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List BlockIOConfig ) -> \( target : Service ) -> List/fold BlockIOConfig mixins BlockIOConfig combine target

in {
    , Type    = BlockIOConfig
    , default = default_block_io_config
    , combine, mixin
}