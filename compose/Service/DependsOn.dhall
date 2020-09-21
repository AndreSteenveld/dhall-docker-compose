let list_map = https://prelude.dhall-lang.org/List/map

let identity = https://prelude.dhall-lang.org/Function/identity

let Entry = https://prelude.dhall-lang.org/Map/Entry
let kv    = https://prelude.dhall-lang.org/Map/keyValue 

let DependsOn = { condition : Text }

let default_depends_on = { condition = "service_started" }

let combine 
    : DependsOn -> DependsOn -> DependsOn
    = \( left : DependsOn ) -> \( right : DependsOn ) ->
        default_depends_on // left // right // { } : DependsOn

let mixin = \( mixins : List DependsOn ) -> \( target : Service ) -> List/fold DependsOn mixins DependsOn combine target

let KV = Entry Text DependsOn

let entry : Text -> DependsOn -> KV = kv DependsOn

let constructor = \( list_or_names : < Text | List ( Text ) | List ( KV ) > ) ->
    merge {
        , Text = \( key : Text ) -> \( value : DependsOn ) -> [ entry key value ]
        , List ( Text ) = list_map Text ( KV ) \( key : Text ) -> entry key default_depends_on
        , List ( KV ) = identity List ( KV )
    }

in {
    , Type    = DependsOn
    , default = default_depends_on
    , combine, mixin, constructor
}

assert : constructor [ "one", "two", "three" ] === [

    , kv "one" default_depends_on
    , kv "two" default_depends_on
    , kv "three" default_depends_on

]

assert : constructor "one" default_depends_on === [ kv "one" default_depends_on ]

assert : constructor 
    [ 
    , kv "one" default_depends_on 
    , kv "two" default_depends_on
    , kv "three" default_depends_on
    ] 
    === 
    [
    , kv "one" default_depends_on 
    , kv "two" default_depends_on
    , kv "three" default_depends_on
    ]

assert : constructor toMap 
    {
    , one = default_depends_on
    , two = default_depends_on
    , three = default_depends_on
    }
    ===
    [
    , kv "one" default_depends_on 
    , kv "two" default_depends_on
    , kv "three" default_depends_on
    ]
    {

