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

let new_button action =
  let row = Dom_html.createDiv doc in
  let col = Dom_html.createDiv doc in
  let button = Dom_html.createButton doc in
  row##.className := (Js.string "row");
  col##.className := (Js.string "col s12");
  button##.className := (Js.string "waves-effect waves-light btn");
  button##.innerHTML := (Js.string (action_to_str action));
  Lwt.async
  ( fun () ->
    Lwt_js_events.clicks button
    ( fun _ev _thread ->
      let spinner = Loadingspinner.loading_spinner () in
      ignore (match action with
      | Spinner_fs -> spinner##(show_opt (Loadingspinner.create_options
      ~timeout:2000 ~fullscreen:true ()))
      | Spinner_no_fs -> spinner##(show_opt (Loadingspinner.create_options
      ~timeout:2000 ()))
      | Spinner -> spinner##show
      | Hide -> spinner##hide);
      Lwt.return ()
    )
  );
  Dom.appendChild col button;
  Dom.appendChild row col;
  row

let on_device_ready _ =
  let div = Dom_html.createDiv doc in
  div##.className := (Js.string "container center");
  Dom.appendChild div (new_button Spinner_fs);
  Dom.appendChild div (new_button Spinner_no_fs);
  Dom.appendChild div (new_button Spinner);
  Dom.appendChild div (new_button Hide);
  Dom.appendChild doc##.body div;
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
(Dom_html.handler on_device_ready) Js._false
