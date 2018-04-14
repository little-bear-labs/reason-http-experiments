class type incomingRequest =
  [@bs]
  {
    inherit Stream.readableStream
  };

class type serverResponse =
  [@bs]
  {
    inherit Stream.writableStream;
    pub writeHead:
      (int, Js.nullable(string), Js.nullable(Js.Dict.t(Js.Json.t))) => unit
  };

module ServerResponse: {
  type t = serverResponse;
  [@bs.send.pipe: Js.t(t)]
  external on :
    ([@bs.string] [ | `close(unit => unit) | `finish(unit => unit)]) =>
    Js.t(t) =
    "";
};

type server;

[@bs.module "http"]
external createServer :
  ((Js.t(incomingRequest), Js.t(serverResponse)) => unit) => server =
  "";

[@bs.send] external listen : (server, int) => server = "";