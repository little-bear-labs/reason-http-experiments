class type incomingRequest =
  [@bs]
  {
    inherit Stream.readableStream
  };

class type serverResponse =
  [@bs]
  {
    inherit Stream.writableStream
  };

module ServerResponse: {
  type t = Js.t(serverResponse);
  [@bs.send.pipe: t]
  external writeHead :
    (
      ~status: int,
      ~message: string=?,
      ~headers: Js.Dict.t(Js.Json.t)=?,
      unit
    ) =>
    unit =
    "";
  [@bs.send.pipe: t]
  external on : ([@bs.string] [ | `finish(unit => 'a)]) => t = "";
};

type server;

[@bs.module "http"]
external createServer :
  ((Js.t(incomingRequest), Js.t(serverResponse)) => unit) => server =
  "";

[@bs.send] external listen : (server, int) => server = "";