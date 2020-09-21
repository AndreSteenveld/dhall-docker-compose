let Secret = { }

let default_secret = {=}

let combine 
    : Secret -> Secret -> Secret
    = \( left : Secret ) -> \( right : Secret ) ->
        default_secret // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Secret ) -> \( target : Service ) -> List/fold Secret mixins Secret combine target

in {
    , Type    = Secret
    , default = default_secret
    , combine, mixin
}