class type writableStream =
  [@bs]
  {
    pub write: string => unit
  };

class type readableStream =
  [@bs]
  {
    pub pipe: Js.t(#writableStream) => Js.t(readableStream)
  };

module WritableStream: {
  type t = Js.t(writableStream);
  [@bs.send.pipe: Js.t(t)]
  external on :
    (
    [@bs.string]
    [
      | `close(unit => unit)
      | `drain(unit => unit)
      | `finish(unit => unit)
      | `pipe(Js.t(readableStream) => unit)
      | `unpipe(Js.t(readableStream) => unit)
    ]
    ) =>
    t =
    "";
};