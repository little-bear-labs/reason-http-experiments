class type incomingRequest =
  [@bs]
  {
    inherit Stream.readableStream
  };

class type serverResponse =
  [@bs]
  {
    inherit Stream.writableStream;
    pub nutbar: unit => unit;
    pub writeHead:
      (int, Js.nullable(string), Js.nullable(Js.Dict.t(Js.Json.t))) => unit
  };

type server;

[@bs.module "http"]
external createServer :
  ((Js.t(incomingRequest), Js.t(serverResponse)) => unit) => server =
  "";

[@bs.send] external listen : (server, int) => server = "";