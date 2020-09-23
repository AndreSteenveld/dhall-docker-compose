let `List/map`   = https://prelude.dhall-lang.org/List/map
let `List/fold`  = https://prelude.dhall-lang.org/List/fold
let `List/empty` = https://prelude.dhall-lang.org/List/empty

let Entry        = https://prelude.dhall-lang.org/Map/Entry
let Entry/create = https://prelude.dhall-lang.org/Map/keyValue

let Map       = https://prelude.dhall-lang.org/Map/Type
let Map/empty = https://prelude.dhall-lang.org/Map/empty
let Map/map   = https://prelude.dhall-lang.org/Map/map

let BlockIOConfig = ./Service/BlockIOConfig.dhall
let Build         = ./Service/Build.dhall
let Config        = ./Service/Config.dhall
let CredentialSpec = ./Service/CredentialSpec.dhall
let DependsOn     = ./Service/DependsOn.dhall
let Deploy        = ./Service/Deploy.dhall
let Extends       = ./Service/Extends.dhall
let Healthcheck   = ./Service/Healthcheck.dhall
let Logging       = ./Service/Logging.dhall
let Network       = ./Service/Network.dhall
let Port          = ./Service/Port.dhall
let Secret        = ./Service/Secret.dhall
let ULimits       = ./Service/ULimits.dhall
let Volume        = ./Service/Volume.dhall

let Service = { 
    , blkio_config  : Optional BlockIOConfig.Type
    , build         : Optional Build.Type
    , cap_add       : Optional ( List Text )
    , cap_drop      : Optional ( List Text )
    , cgroup_parent : Optional Text
    , command       : Optional ( List Text )
    , configs       : Optional ( List Config.Type )
    , container_name : Optional Text
    , cpu_count     : Optional Natural
    , cpu_percent   : Optional Natural
    , cpu_period    : Optional Text
    , cpu_quota     : Optional Text
    , cpu_rt_period : Optional Text
    , cpu_rt_runtime : Optional Text
    , cpu_shares    : Optional Text
    , cpuset        : Optional Text
    , credential_spec : Optional CredentialSpec.Type
    , depends_on    : Optional ( Map Text DependsOn.Type )
    , deploy        : Optional Deploy.Type
    , device_cgroup_rules : Optional ( List Text )
    , devices       : Optional ( List Text )
    , dns           : Optional ( List Text )
    , dns_opt       : Optional ( List Text )
    , dns_search    : Optional ( List Text )
    , domainname    : Optional Text
    , entrypoint    : Optional ( List Text )
    , env_file      : Optional ( List Text )
    , environment   : Optional ( Map Text Text )
    , expose        : Optional ( List Text )
    , extends       : Optional Extends.Type
    , external_links : Optional ( List Text )
    , extra_hosts   : Optional ( Map Text Text )
    , group_add     : Optional ( List Text )
    , healthcheck   : Optional Healthcheck.Type
    , hostname      : Optional Text
    , image         : Optional Text
    , init          : Optional Bool
    , ipc           : Optional Text
    , isolation     : Optional Text
    , labels        : Optional ( Map Text Text )
    , links         : Optional ( List Text )
    , logging       : Optional Logging.Type
    , mac_address   : Optional Text
    , mem_swappiness : Optional Natural
    , memswap_limit : Optional Text
    , network_mode  : Optional Text
    , networks      : Optional ( Map Text Network.Type ) 
    , oom_kill_disable : Optional Bool
    , oom_score_adj : Optional Integer
    , pid           : Optional Text
    , pid_limit     : Optional Integer
    , platform      : Optional Text
    , ports         : Optional ( List Port.Type )
    , privileged    : Optional Bool
    , pull_policy   : Optional Text
    , read_only     : Optional Bool
    , restart       : Optional Text
    , secret        : Optional ( List Secret.Type )
    , security_opt  : Optional ( List Text )
    , shm_size      : Optional Text 
    , stdin_open    : Optional Bool
    , stop_grace_period : Optional Text
    , stop_signal   : Optional Text
    , sysctls       : Optional ( Map Text Text )
    , tmpfs         : Optional ( List Text )
    , tty           : Optional Bool
    , ulimits       : Optional ( Map Text ULimits.Type )
    , user          : Optional Text
    , userns_mode   : Optional Text
    , volumes       : Optional ( Map Text Volume.Type )
    , volumes_from  : Optional ( List Text )
    , working_dir   : Optional Text
}

let default_service = { 
    , blkio_config  = None BlockIOConfig.Type
    , build         = None Build.Type
    , cap_add       = None ( List Text )
    , cap_drop      = None ( List Text )
    , cgroup_parent = None Text
    , command       = None ( List Text )
    , configs       = None ( List Config.Type )
    , container_name = None Text
    , cpu_count     = None Natural
    , cpu_percent   = None Natural
    , cpu_period    = None Text
    , cpu_quota     = None Text
    , cpu_rt_period = None Text
    , cpu_rt_runtime = None Text
    , cpu_shares    = None Text
    , cpuset        = None Text
    , credential_spec = None CredentialSpec.Type
    , depends_on    = None ( Map Text DependsOn.Type )
    , deploy        = None Deploy.Type
    , device_cgroup_rules = None ( List Text )
    , devices       = None ( List Text )
    , dns           = None ( List Text )
    , dns_opt       = None ( List Text )
    , dns_search    = None ( List Text )
    , domainname    = None Text
    , entrypoint    = None ( List Text )
    , env_file      = None ( List Text )
    , environment   = None ( Map Text Text )
    , expose        = None ( List Text )
    , extends       = None Extends.Type
    , external_links = None ( List Text )
    , extra_hosts   = None ( Map Text Text )
    , group_add     = None ( List Text )
    , healthcheck   = None Healthcheck.Type
    , hostname      = None Text
    , image         = None Text
    , init          = None Bool
    , ipc           = None Text
    , isolation     = None Text
    , labels        = None ( Map Text Text )
    , links         = None ( List Text )
    , logging       = None Logging.Type
    , mac_address   = None Text
    , mem_swappiness = None Natural
    , memswap_limit = None Text
    , network_mode  = None Text
    , networks      = None ( Map Text Network.Type ) 
    , oom_kill_disable = None Bool
    , oom_score_adj = None Integer
    , pid           = None Text
    , pid_limit     = None Integer
    , platform      = None Text
    , ports         = None ( List Port.Type )
    , privileged    = None Bool
    , pull_policy   = None Text
    , read_only     = None Bool
    , restart       = None Text
    , secret        = None ( List Secret.Type )
    , security_opt  = None ( List Text )
    , shm_size      = None Text 
    , stdin_open    = None Bool
    , stop_grace_period = None Text
    , stop_signal   = None Text
    , sysctls       = None ( Map Text Text )
    , tmpfs         = None ( List Text )
    , tty           = None Bool
    , ulimits       = None ( Map Text ULimits.Type )
    , user          = None Text
    , userns_mode   = None Text
    , volumes       = None ( Map Text Volume.Type )
    , volumes_from  = None ( List Text )
    , working_dir   = None Text
}

let combine 
    : Service -> Service -> Service 
    = \( left : Service ) -> \( right : Service ) -> 
        ( default_service // left // right ) : Service {-

            -- 
            -- Merging a service is fine as for most of the complex object we can pawn that off
            -- to the sub types. The compose spec has some things to say about the about extending
            -- which helps us here with what we want to extend or otherwise just override.
            --
            -- If for some reason it is neccesay to append something to a command (which is overwritten)
            -- that could be done in a fashion like this (roughly):
            --
            --  let cocktail_mixer = C.Service::{ command = Some [ "mix" ] }
            --  let gin   = C.Service::{ command = Some [ "-p30", "gin" ] }
            --  let tonic = C.Service::{ command = Some [ "-p60", "tonic"] }
            --
            --  let gin_and_tonic = C.Service.mixin [ cocktail_mixer, gin, tonic ] C.Service::{
            --      
            --      command = cocktail_mixer.command # gin.command # tonic.command
            --
            --  }
            --

        -}

let mixin = \( mixins : List Service ) -> \( target : Service ) -> List/fold Service mixins Service combine target

in {
    , Type    = Service
    , default = default_service
    , combine, mixin

    --
    -- Some convienence methods
    --
    , env_var    = Entry/create Text
    , extra_host = Entry/create Text
    , label      = Entry/create Text
    , sysctl     = Entry/create Text
    
    --
    -- Nested types and their builders
    --
    , BlockIOConfig, Build, Deploy, CredentialSpec, Healthcheck, ULimits

    , Config
    , config  = \( source : Text ) -> \( target : Text ) -> Config::{ source, target }
    , configs = List/map ( Entry Text Text ) ( Config.Type )
        ( \( mapping : ( Entry Text Text ) ) -> Config::{ source = mapping.mapKey , target = mapping.mapValue } )

    , Secret
    , secret  = \( source : Text ) -> \( target : Text ) -> Secret::{ source, target }
    , secrets = List/map ( Entry Text Text ) ( Secret.Type ) 
        ( \( mapping : Entry Text Text ) -> Secret::{ source = mapping.mapKey , target = mapping.mapValue } )

    , Extends
    , extends = \( service : Text ) -> Extends::{ service }

    , DependsOn
    , depends_on = List/map ( Text ) ( Entry Text DependsOn.Type ) 
        ( \( service : Text ) -> Entry/create DependsOn.Type service DependsOn::{ condition = "service_started" } )

    , Port
    , ports = {
    
        , mapping = List/map ( Entry Natural Natural ) ( Port.Type ) 
            ( \( mapping : ( Entry Natural Natural ) ) -> Port::{ target = mapping.mapKey , published = mapping.mapValue } )
        
        , list = List/map ( Natural ) ( Port.Type ) 
            ( \( port : Natural ) -> Port::{ target = port, published = port } )
    
    }

    , Network 
    , networks = List/map Text ( Entry Text Network.Type ) 
        ( \( name : Text ) -> Entry/create Network.Type name Network::{=} )

    , Volume = Volume /\ {

        , mount = \( source : Text ) -> \( target : Text ) -> Volume::{ type = "mount", source = Some source, target = Some target }
        , bind  = \( source : Text ) -> \( target : Text ) -> Volume::{ type = "bind", source = Some source, target = Some target }

    }

}
