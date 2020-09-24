
let Limits = { 
    , Type = { 
        , cpus : Optional Integer
        , memory : Optional Text,
    }
    , default = {
        , cpus = None Integer
        , memory : None Text
    }
}

let DiscreteResourceSpec = { 
    , Type = { 
        , discrete_resource_spec : Optional {
            , kind : Text
            , value : Integer
        }
    }
    , default = {
        , discrete_resource_spec = None {
            , kind : Text
            , value : Integer
        }
    }
}

let Resevations =  { 
    , Type = {
        
    }
}

let RestartPolicy = { }

let Placement = { }



{
        , limits : Optional { 
            , cpus : Optional Integer
            , memory : Optional Text,
        }
        , resevations : Optional { 
            , cpus : Optional Integer
            , memory : Optional Text
            , generic_resources : Optional (
                List { 
                    discrete_resource_spec : { kind : Text , value : Integer }
                }
            )
        }
        , restart_policy : Optional {
            , condtion : Optional Text
            , delay : Optional Text
            , max_attempts : Optional Integer
            , window : Optional Text
        }
        , placement : Optional {
            , max_replicas_per_node : Optional Integer
            , constraints : Optional ( List Text )
            , preferences : Optional (
                List { spread : Optional Text }
            )
        }
    }