# ocaml-cordova-plugin-loading-spinner-example

This is an example of the binding to the *loading spinner cordova plugin*. See the
binding [here](https://github.com/dannywillems/ocaml-cordova-plugin-loading-spinner).

## Compatibility

```
This plugin works on PhoneGap/Cordova 3.x. It's currently not tested against
PhoneGap 4.x and known not to be working on PhoneGap/Cordova 5.x and above.
```

Source: [cordova-plugin-loading-spinner](https://github.com/mobimentum/phonegap-plugin-loading-spinner)

## How to compile?

**You need to add the loading spinner plugin manually with**
```
cordova plugin add https://github.com/mobimentum/phonegap-plugin-loading-spinner.git
```

1. Add the plugin list repository as a remote opam package provider with
```Shell
opam repository add cordova https://github.com/dannywillems/ocaml-cordova-plugin-list.git
```

2. Initialize the project directory with
```
make init
```

3. Run (and build).
```
# Run on Android
make run_android
# Run on iOS
make run_ios
```
