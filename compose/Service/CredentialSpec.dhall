let `List/fold` = https://prelude.dhall-lang.org/List/fold

let CredentialSpec : Type = { 
    , config   : Optional Text
    , file     : Optional Text
    , registry : Optional Text
}
let default : CredentialSpec = {
    , config   = None Text
    , file     = None Text
    , registry = None Text
}

let combine = \( left : CredentialSpec ) -> \( right : CredentialSpec ) ->
    ( default // left // right ) : CredentialSpec

let mixin = \( mixins : List CredentialSpec ) -> \( target : CredentialSpec ) -> List/fold CredentialSpec mixins CredentialSpec combine target

in { Type = CredentialSpec, default, combine, mixin }