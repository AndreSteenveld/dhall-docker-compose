let L = {
    , map  = https://prelude.dhall-lang.org/List/map
    , fold = https://prelude.dhall-lang.org/List/fold
}

let Dict = {
    , type   = https://prelude.dhall-lang.org/Map/Type Text
    , entry  = https://prelude.dhall-lang.org/Map/keyValue
    , key    = \( record : { mapKey : Text } ) -> record.mapKey
    , value  = \( type : Type ) -> \( record : { mapValue : type } ) -> record.mapValue
}

let BlockIOConfig = ./Service/BlockIOConfig.dhall
let Build         = ./Service/Build.dhall
let Command       = ./Service/Command.dhall
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
    , blkio_config  : Optional BlockIOConfig
    , build         : Optional Build
    , cap_add       : Optional ( List Text )
    , cap_drop      : Optional ( List Text )
    , cgroup_parent : Optional Text
    , command       : Optional ( List Text )
    , configs       : Optional ( List Config )
    , container_name : Optional Text
    , cpu_count     : Optional Natural
    , cpu_percent   : Optional Natural
    , cpu_period    : Optional Text
    , cpu_quota     : Optional Text
    , cpu_rt_period : Optional Text
    , cpu_rt_runtime : Optional Text
    , cpu_shares    : Optional Text
    , cpuset        : Optional Text
    , credential_spec : Optional CredentialSpec
    , depends_on    : Optional List ( Dict.type DependsOn )
    , deploy        : Optional Deploy
    , device_cgroup_rules : Optional ( List Text )
    , devices       : Optional ( List Text )
    , dns           : Optional ( List Text )
    , dns_opt       : Optional ( List Text )
    , dns_search    : Optional ( List Text )
    , domainname    : Optional Text
    , entrypoint    : Optional ( List Text )
    , env_file      : Optional ( List Text )
    , environment   : Optional ( List ( Dict.type Text ) )
    , expose        : Optional ( List Text )
    , extends       : Optional Extends
    , external_links : Optional ( List Text )
    , extra_hosts   : Optional ( List ( Dict.type Text ) )
    , group_add     : Optional ( List Text )
    , healthcheck   : Optional Healthcheck
    , hostname      : Optional Text
    , image         : Optional Text
    , init          : Optional Bool
    , ipc           : Optional Text
    , isolation     : Optional Text
    , labels        : Optional ( List ( Dict.type Text ) )
    , links         : Optional ( List Text )
    , logging       : Optional Logging
    , mac_address   : Optional Text
    , mem_swappiness : Optional Natural
    , memswap_limit : Optional Text
    , network_mode  : Optional Text
    , networks      : Optional List ( Dict.type Network ) 
    , oom_kill_disable : Optional Bool
    , oom_score_adj : Optional Integer
    , pid           : Optional Text
    , pid_limit     : Optional Integer
    , platform      : Optional Text
    , ports         : Optional ( List Port )
    , privileged    : Optional Bool
    , pull_policy   : Optional Text
    , read_only     : Optional Bool
    , restart       : Optional Text
    , secret        : Optional ( List Secret )
    , security_opt  : Optional ( List Text )
    , shm_size      : Optional Text 
    , stdin_open    : Optional Bool
    , stop_grace_period : Optional Text
    , stop_signal   : Optional Text
    , sysctls       : Optional ( List ( Dict.type Text ) )
    , tmpfs         : Optional ( List Text )
    , tty           : Optional Bool
    , ulimits       : Optional ( List ( Dict.type ULimit ) )
    , user          : Optional Text
    , userns_mode   : Optional Text
    , volumes       : Optional ( List ( Dict.type Volume ) )
    , volumes_from  : Optional ( List Text )
    , working_dir   : Optional Text
}

let default_service = { 
    , blkio_config  : None BlockIOConfig
    , build         : None Build
    , cap_add       : None ( List Text )
    , cap_drop      : None ( List Text )
    , cgroup_parent : None Text
    , command       : None ( List Text )
    , configs       : None ( List Config )
    , container_name : None Text
    , cpu_count     : None Natural
    , cpu_percent   : None Natural
    , cpu_period    : None Text
    , cpu_quota     : None Text
    , cpu_rt_period : None Text
    , cpu_rt_runtime : None Text
    , cpu_shares    : None Text
    , cpuset        : None Text
    , credential_spec : None CredentialSpec
    , depends_on    : None List ( Dict.type DependsOn )
    , deploy        : None Deploy
    , device_cgroup_rules : None ( List Text )
    , devices       : None ( List Text )
    , dns           : None ( List Text )
    , dns_opt       : None ( List Text )
    , dns_search    : None ( List Text )
    , domainname    : None Text
    , entrypoint    : None ( List Text )
    , env_file      : None ( List Text )
    , environment   : None ( List ( Dict.type Text ) )
    , expose        : None ( List Text )
    , extends       : None Extends
    , external_links : None ( List Text )
    , extra_hosts   : None ( List ( Dict.type Text ) )
    , group_add     : None ( List Text )
    , healthcheck   : None Healthcheck
    , hostname      : None Text
    , image         : None Text
    , init          : None Bool
    , ipc           : None Text
    , isolation     : None Text
    , labels        : None ( List ( Dict.type Text ) )
    , links         : None ( List Text )
    , logging       : None Logging
    , mac_address   : None Text
    , mem_swappiness : None Natural
    , memswap_limit : None Text
    , network_mode  : None Text
    , networks      : None List ( Dict.type Network ) 
    , oom_kill_disable : None Bool,
    , oom_score_adj : None Integer
    , pid           : None Text
    , pid_limit     : None Integer
    , platform      : None Text
    , ports         : None ( List Port )
    , privileged    : None Bool
    , pull_policy   : None Text
    , read_only     : None Bool
    , restart       : None Text
    , secret        : None ( List Secret )
    , security_opt  : None ( List Text )
    , shm_size      : None Text 
    , stdin_open    : None Bool
    , stop_grace_period : None Text
    , stop_signal   : None Text
    , sysctls       : None ( List ( Dict.type Text ) )
    , tmpfs         : None ( List Text )
    , tty           : None Bool
    , ulimits       : None ( List ( Dict.type ULimit ) )
    , user          : None Text
    , userns_mode   : None Text
    , volumes       : None ( List ( Dict.type Volume ) )
    , volumes_from  : None ( List Text )
    , working_dir   : None Text
}

let combine 
    : Service -> Service -> Service 
    = \( left : Service ) -> \( right : Service ) -> 
        default_service // left // right // {

            -- : 
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

        }

let mixin = \( mixins : List Service ) -> \( target : Service ) -> L.fold Service mixins Service combine target

in {
    , Type    = Service
    , default = default_service
    , combine, mixin

    --
    -- Some convienence methods
    --
    , env_var    = Dict.entry Text
    , extra_host = Dict.entry Text
    , label      = Dict.entry Text
    , sysctl     = Dict.entry Text
    
    --
    -- Nested types and their builders
    --
    , BlockIOConfig, Build, Deploy, CredentialSpec, Healthcheck, Ulimit

    , Config
    , configs = L.map ( Dict.type Text ) ( Config ) \( mapping : ( Dict.type Text ) ) -> Config::{ name = ( Dict.key mapping ), target = ( Dict.value Text mapping ) }
    , config  = \( name : Text ) -> \( target : Text ) -> Config::{ name, target }

    , Secret
    , secrets = L.map ( Dict.type Text ) ( Secret ) \( mapping : ( Dict.type Text ) ) -> Secret::{ name = ( Dict.key mapping ), target = ( Dict.value Text mapping ) }
    , secret  = \( name : Text ) -> \( target : Text ) -> Secret::{ name, target }

    , Extends
    , extends = \( service : Text ) -> Extends::{ service }

    , DependsOn
    , depends_on = L.map ( Text ) ( DependsOn ) \( service : Text ) -> DependsOn::{ service, health = "service_started" }

    , Port
    , ports = {
    
        , mapping = L.map ( Dict.type Text ) ( Port ) \( mapping : ( Dict.type Text ) ) -> Port::{ source = ( Dict.key mapping ) , target = ( Dict.value Text mapping ) }
        , list    = L.map ( Text ) ( Port ) \( port : Text ) -> Port::{ source = port, target = port }
    
    }

    , Network 
    , networks = L.map Text Network \( name : Text ) -> Network::{ name }

    , Volume = Volume /\ {

        , mount = \( source : Text ) -> \( target : Text ) -> Volume::{ type = "mount", source, target }
        , bind  = \( source : Text ) -> \( target : Text ) -> Volume::{ type = "bind", source, target }

    }

}
