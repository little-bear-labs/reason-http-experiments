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
    (
    [@bs.string]
    [
      | `close(unit => unit)
      | `data([ | `Str(string) | `Buf(Buffer.buffer)] => unit)
    ]
    ) =>
    t =
    "";
  /* [@bs.send.pipe: t]
     external on :
       (
       [@bs.string]
       [
         | `close
       ]
       ) =>
       t =
       ""; */
};

module WritableStream: {
  type t = Js.t(writableStream);
  [@bs.send.pipe: t]
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
  [@bs.send.pipe: Js.t(#writableStream)]
  external onEnd : ([@bs.as "end"] _, unit => unit) => 'a = "on";
};