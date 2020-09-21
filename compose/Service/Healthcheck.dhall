let Healthcheck = { }

let default_healthcheck = {=}

let combine 
    : Healthcheck -> Healthcheck -> Healthcheck
    = \( left : Healthcheck ) -> \( right : Healthcheck ) ->
        default_healthcheck // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List Healthcheck ) -> \( target : Service ) -> List/fold Healthcheck mixins Healthcheck combine target

in {
    , Type    = Healthcheck
    , default = default_healthcheck
    , combine, mixin
}