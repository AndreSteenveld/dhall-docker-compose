let `List/fold` = https://prelude.dhall-lang.org/List/fold

let Bind = {
    , Type    = { propegation : Optional Text }
    , default = { propegation = None Text }
}

let Bind/combine = \( left : Bind.Type ) -> \( right : Bind.Type ) -> ( Bind.default // left // right ) : Bind.Type
let Bind/mixin = \( mixins : List Bind.Type ) -> \( target : Bind.Type ) -> List/fold Bind.Type mixins Bind.Type Bind/combine target


let _Volume = {
    , Type    = { nocopy : Optional Text }
    , default = { nocopy = None Text }
}

let _Volume/combine = \( left : _Volume.Type ) -> \( right : _Volume.Type ) -> ( _Volume.default // left // right ) : _Volume.Type
let _Volume/mixin = \( mixins : List _Volume.Type ) -> \( target : _Volume.Type ) -> List/fold _Volume.Type mixins _Volume.Type _Volume/combine target


let TmpFs = {
    , Type    = { size : Optional Integer }
    , default = { size = None Integer }
}

let TmpFs/combine = \( left : TmpFs.Type ) -> \( right : TmpFs.Type ) -> ( TmpFs.default // left // right ) : TmpFs.Type
let TmpFs/mixin = \( mixins : List TmpFs.Type ) -> \( target : TmpFs.Type ) -> List/fold TmpFs.Type mixins TmpFs.Type TmpFs/combine target


---


let Volume : Type = { 
    , type      : Text 
    , source    : Optional Text 
    , target    : Optional Text
    , read_only : Optional Bool
    , consistency : Optional Text
    , bind      : Optional Bind.Type
    , volume    : Optional _Volume.Type
    , tmpfs     : Optional TmpFs.Type
}
let default = {
    , source    = None Text 
    , target    = None Text
    , read_only = None Bool
    , consistency = None Text
    , bind      = None Bind.Type
    , volume    = None _Volume.Type
    , tmpfs     = None TmpFs.Type
}

let combine = \( left : Volume ) -> \( right : Volume ) ->
    ( default // left // right ) : Volume

let mixin = \( mixins : List Volume ) -> \( target : Volume ) -> List/fold Volume mixins Volume combine target

in { 
    , Type = Volume, default, combine, mixin 
    
    , Bind = Bind // {
        , combine = ( Bind/combine )
        , mixin = ( Bind/mixin )
    }

    , Volume = _Volume // {
        , combine = ( _Volume/combine )
        , mixin = ( _Volume/mixin )
    }

    , TmpFs = TmpFs // {
        , combine = ( TmpFs/combine )
        , mixin = ( TmpFs/mixin )
    }
}