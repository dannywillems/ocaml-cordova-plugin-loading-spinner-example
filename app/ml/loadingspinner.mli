type options =
  <
    overlay           : bool Js.t Js.readonly_prop ;
    timeout           : int Js.readonly_prop ;
    fullscreen        : bool Js.t Js.readonly_prop
  > Js.t

val create_options :  ?overlay:bool     ->
                      ?timeout:int      ->
                      ?fullscreen:bool  ->
                      unit -> options

class type loading_spinner =
  object
    method show       : unit Js.meth
    method show_opt   : options -> unit Js.meth
    method hide       : unit Js.meth
  end

val loading_spinner : unit -> loading_spinner Js.t
