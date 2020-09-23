let `List/fold` = https://prelude.dhall-lang.org/List/fold
let Map = https://prelude.dhall-lang.org/Map/Type

let Config = {
    , Type = {
        , subnet    : Optional Text
        , ip_range  : Optional Text
        , gateway   : Optional Text
        , aux_address : Optional ( Map Text Text )
    }

    , default = {
        , subnet    = None Text
        , ip_range  = None Text
        , gateway   = None Text
        , aux_address = None ( Map Text Text )
    }
}

let Config/combine = \( left : Config.Type ) -> \( right : Config.Type ) -> ( Config.default // left // right ) : Config.Type
let Config/mixin = \( mixins : List Config.Type ) -> \( target : Config.Type ) -> List/fold Config.Type mixins Config.Type Config/combine target

let Ipam = {
    , Type = { 
        , driver : Optional Text
        , config : Optional ( List Config.Type )
    }

    , default = {
        , driver = None Text
        , config = None ( List Config.Type )
    }

    , Config = Config // {
        , combine = ( Config/combine )
        , mixin = ( Config/mixin )
    }
}

let Ipam/combine = \( left : Ipam.Type ) -> \( right : Ipam.Type ) -> ( Ipam.default // left // right ) : Ipam.Type
let Ipam/mixin = \( mixins : List Ipam.Type ) -> \( target : Ipam.Type ) -> List/fold Ipam.Type mixins Ipam.Type Ipam/combine target


---


let Network : Type = { 

    , name      : Optional Text
    , driver    : Optional Text
    , driver_opts : Optional ( Map Text Text )
    , external  : Optional Bool
    , internal  : Optional Bool
    , enable_ipv6 : Optional Bool
    , attachable : Optional Bool
    , labels    : Optional ( Map Text Text )

}
let default = {
    
    , name      = None Text
    , driver    = None Text
    , driver_opts = None ( Map Text Text )
    , external  = None Bool
    , internal  = None Bool
    , enable_ipv6 = None Bool
    , attachable = None Bool
    , labels    = Optional ( Map Text Text )

}

let combine = \( left : Network ) -> \( right : Network ) ->
    ( default // left // right ) : Network

let mixin = \( mixins : List Network ) -> \( target : Network ) -> List/fold Network mixins Network combine target

in { 
    
    , Type = Network, default, combine, mixin 
    
    , Ipam = Ipam // {
        , combine = ( Ipam/combine )
        , mixin = ( Ipam/mixin )
    }

}