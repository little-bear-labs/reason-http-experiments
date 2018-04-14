type dataOut;

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

module ReadableStream: {
  type t = Js.t(readableStream);
  [@bs.send.pipe: t]
  external on :
    ([@bs.string] [ | `close(unit => 'a) | `data(dataOut => 'a)]) => t =
    "";
};

module WritableStream: {
  type t = Js.t(writableStream);
  [@bs.send.pipe: t]
  external on :
    (
    [@bs.string]
    [
      | `close(unit => 'a)
      | `drain(unit => 'a)
      | `finish(unit => 'a)
      | `pipe(Js.t(readableStream) => 'a)
      | `unpipe(Js.t(readableStream) => 'a)
    ]
    ) =>
    t =
    "";
  [@bs.send.pipe: Js.t(#writableStream)]
  external onEnd : ([@bs.as "end"] _, unit => unit) => 'a = "on";
};