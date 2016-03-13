type options =
  <
    overlay           : bool Js.t Js.readonly_prop ;
    timeout           : int Js.readonly_prop ;
    fullscreen        : bool Js.t Js.readonly_prop
  > Js.t

let create_options ?(overlay=true) ?(timeout=0) ?(fullscreen=false) () =
  object%js
    val overlay     = Js.bool overlay
    val timeout     = timeout
    val fullscreen  = Js.bool fullscreen
  end

class type loading_spinner =
  object
    method show       : unit Js.meth
    method show_opt   : options -> unit Js.meth
    method hide       : unit Js.meth
  end

let loading_spinner () = Js.Unsafe.js_expr ("spinnerplugin")
