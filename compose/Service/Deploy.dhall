let Deploy = { }

let default_deploy = {=}

let combine 
    : Deploy -> Deploy -> Deploy
    = \( left : Deploy ) -> \( right : Deploy ) ->
        default_deploy // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Deploy ) -> \( target : Service ) -> List/fold Deploy mixins Deploy combine target

in {
    , Type    = Deploy
    , default = default_deploy
    , combine, mixin
}