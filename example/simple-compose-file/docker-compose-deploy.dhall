let C = ../../compose.dhall

let logging = C.Service::{

    logging = Some C.Service.logging::{
        , driver = "syslog"
        , options = Some C.Service.logging.options toMap {
            
            , `syslog-address` = C._.Primitive.String "udp://logs.papertrailapp.com:50183"
            , `tag`            = C._.Primitive.String "{{.Name}}"

        }
    }

}

in C.File::{

    version = "3.8",

    volumes = toMap {

        , `pgdata`              = C.Volume::{ driver = "local" }
        , `django-static-files` = C.Volume::{ driver = "local" }
        , `react-static-files`  = C.Volume::{ driver = "local" }

    }

    services = toMap {

        , nginx = C.Service.mixin [ logging ] C.Service::{
            , image   = Some "recipeyak/nginx:latest"
            , ports   = Some C.Service.ports [ "80:80" ]
            , volumes = Some C.Service.volumes toMap {
                , `react-static-files`  = C.Service.Volume.mount "/var/app/dist"
                , `django-static-files` = C.Service.Volume.mount "/var/app/django/static"
                }
            , depends_on = [ "django", "react" ]
        }

        , db = C.Service.mixin [ logging ] C.Service::{
            , image   = Some "postgres:10.1"
            , ports   = Some C.Service.ports [ "5432:5432" ]
            , volumes = Some C.Service.volumes toMap { 
                , `pgdata` = C.Service.Volume.mount "/var/lib/postgresql/data/" 
                }
            , command = Some
                [ "-c" , "shared_preload_libraries=\"pg_stat_statements\""
                , "-c" , "pg_stat_statements.max=10000"
                , "-c" , "pg_stat_statements.track=all"
                ]
        }

        , react = C.Service.mixin [ logging ] C.Service::{
            , image    = Some "recipeyak/react:latest"
            , env_file = Some [ ".env-production" ]
            , volumes  = C.Service.volumes toMap {
                , `react-static-files` = C.Service.Volume.mount "/var/app/dist"
                }
            , command  = Some [ "sh bootstrap.sh" ]
        }

        , django = C.Service.mixin [ logging ] C.Service::{
            , image    = Some "recipeyak/django:latest"
            , env_file = Some [ ".env-production" ]
            , command  = Some [ "sh bootstrap-prod.sh" ]
            , volumes  = Some C.Service.volumes toMap {
                , `django-static-files` = C.Service.Volume.mount "/var/app/static-files" 
                }
            , depends_on =  Some C.Service.depends_on [ "db" ]
            , restart = Some "always"
        }

    }

}