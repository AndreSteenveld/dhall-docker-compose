let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Network : Type = { 
    
    , aliases : Optional ( List Text )
    
    , ipv4_address : Optional Text
    , ipv6_address : Optional Text
    
    , link_local_ips : Optional ( List Text )
    , priority : Optional Natural

}
let default : Network = {
        
    , aliases = None ( List Text )
    
    , ipv4_address = None Text
    , ipv6_address = None Text
    
    , link_local_ips = None ( List Text )
    , priority = None Natural


}

let combine = \( left : Network ) -> \( right : Network ) ->
    ( default // left // right ) : Network

let mixin = \( mixins : List Network ) -> \( target : Network ) -> List/fold Network mixins Network combine target

in { Type = Network, default, combine, mixin }