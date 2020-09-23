let `List/fold`  = https://prelude.dhall-lang.org/List/fold

let Entry/create = https://prelude.dhall-lang.org/Map/keyValue

let Map = https://prelude.dhall-lang.org/Map/Type

let Service = ./Service.dhall
let Network = ./Network.dhall
let Volume  = ./Volume.dhall
let Config  = ./Config.dhall
let Secret  = ./Secret.dhall

let File = {

    , version  : Text
    , services : Optional ( Map Text Service.Type )
    , networks : Optional ( Map Text Network.Type )
    , volumes  : Optional ( Map Text Volume.Type )

    -- Configs and secrets are only relevant in swarm deployments
    , configs : Optional ( Map Text Config.Type )
    , secrets : Optional ( Map Text Secret.Type )

}

let default = {

    , services = None ( Map Text Service.Type )
    , networks = None ( Map Text Network.Type )
    , volumes  = None ( Map Text Volume.Type )
    , configs  = None ( Map Text Config.Type )
    , secrets  = None ( Map Text Secret.Type )

}

let combine 
    : File -> File -> File 
    = \( left : File ) -> \( right : File ) -> 
        ( default // left // right ) : File

let mixin = \( mixins : List File ) -> \( target : File ) -> List/fold File mixins File combine target

in {
    , Type = File 
    , default, combine, mixin

    , service = \( name : Text ) -> \( mixins : List Service.Type ) -> \( service : Service.Type ) -> Entry/create Service.Type name ( Service.mixin mixins service )
    , network = \( name : Text ) -> \( mixins : List Network.Type ) -> \( network : Network.Type ) -> Entry/create Network.Type name ( Network.mixin mixins network )
    , volume  = \( name : Text ) -> \( mixins : List Volume.Type ) -> \( volume : Volume.Type ) -> Entry/create Volume.Type name ( Volume.mixin mixins volume )
    , config  = \( name : Text ) -> \( mixins : List Config.Type ) -> \( config : Config.Type ) -> Entry/create Config.Type name ( Config.mixin mixins config )
    , secret  = \( name : Text ) -> \( mixins : List Secret.Type ) -> \( secret : Secret.Type ) -> Entry/create Secret.Type name ( Secret.mixin mixins secret )

}
