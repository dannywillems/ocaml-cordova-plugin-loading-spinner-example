let doc = Dom_html.document

type action =
  | Spinner_fs
  | Spinner_no_fs
  | Spinner
  | Hide

let action_to_str a = match a with
  | Spinner_fs -> "Show no fullscreen"
  | Spinner_no_fs -> "Show fullscreen"
  | Spinner -> "Show"
  | Hide -> "Hide"

let on_device_ready () =
  let div = Dom_html.createDiv doc in
  let new_button action =
    let row = Dom_html.createDiv doc in
    let col = Dom_html.createDiv doc in
    let button = Dom_html.createButton doc in
    row##.className := (Js.string "row");

    button##.className := (Js.string "waves-effect waves-light btn");
    button##.innerHTML := (Js.string (action_to_str action));
    button##.onclick := Dom.handler (fun ev ->
    (ignore (match action with
      | Spinner_fs ->
          Cordova_loading_spinner.show
            ~options:
              (Cordova_loading_spinner.create_options
                ~timeout:2000
                ~fullscreen:true
                ()
              )
            ()
      | Spinner_no_fs ->
          Cordova_loading_spinner.show
            ~options:
              (Cordova_loading_spinner.create_options
                ~timeout:2000
                ()
              )
            ()
      | Spinner -> Cordova_loading_spinner.show ()
      | Hide -> Cordova_loading_spinner.hide ());
      Js._false
    ));
    Dom.appendChild col button;
    Dom.appendChild row col;
    row
  in


  div##.className := (Js.string "container center");
  Dom.appendChild div (new_button Spinner_fs);
  Dom.appendChild div (new_button Spinner_no_fs);
  Dom.appendChild div (new_button Spinner);
  Dom.appendChild div (new_button Hide);
  Dom.appendChild doc##.body div

let _ =
  Cordova.Event.device_ready on_device_ready
