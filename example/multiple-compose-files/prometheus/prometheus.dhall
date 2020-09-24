let C = ../../../compose/v3/types.dhall
let E = ../environment.dhall

in { 
  build = C.ComposeConfig::{
    version  = E.version,
    services = [

      C.services.create "prometheus" C.Service::{
        image = "dhall-example/prometheus",
        build = C.Service.Build::{ context = "./prometheus" }
      }

    ]
  }, 

  stack = C.ComposeConfig::{
    version  = E.version,
    networks = E.networks,
    volumes  = [ C.volumes.create "prometheus_data" C.Volume::{=} ]
    services = [

      C.services.create "prometheus" C.Service.mixin [ E.service.restart_policy, E.service.network, E.service.labels ] C.Service::{
        , image = "dhall-example/prometheus"
        , container_name = "prometheus"
        , volumes = C.Service.volumes 
          [ "./prometheus:/etc/prometheus"
          , "prometheus_data:/prometheus"
          ]
        , command = C.Service.command 
          [ "--config.file=/etc/prometheus/prometheus.yml"
          , "--storage.tsdb.path=/prometheus"
          , "--web.console.libraries=/etc/prometheus/console_libraries"
          , "--web.console.templates=/etc/prometheus/consoles"
          , "--storage.tsdb.retention.time=200h"
          , "--web.enable-lifecycle"
          ]
        , expose = C.Service.expose [ 9000 ]
      }

    ]
  }
}