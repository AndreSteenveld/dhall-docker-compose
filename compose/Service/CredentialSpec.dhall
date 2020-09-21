let CredentialSpec = { }

let default_credential_spec = {=}

let combine 
    : CredentialSpec -> CredentialSpec -> CredentialSpec
    = \( left : CredentialSpec ) -> \( right : CredentialSpec ) ->
        default_credential_spec // left // right // {

            -- Merging 

        }

let mixin = \( mixins : List CredentialSpec ) -> \( target : Service ) -> List/fold CredentialSpec mixins CredentialSpec combine target

in {
    , Type    = CredentialSpec
    , default = default_credential_spec
    , combine, mixin
}