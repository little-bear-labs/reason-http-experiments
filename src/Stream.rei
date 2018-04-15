type dataOut;

class type writableStream =
  [@bs]
  {};

class type readableStream =
  [@bs]
  {};

module ReadableStream: {
  type t = Js.t(readableStream);
  [@bs.send] external isPaused : unit => bool = "";
  [@bs.send.pipe: t] external pause : unit => Js.t(#readableStream) = "";
  [@bs.send.pipe: t]
  external pipe : Js.t(#writableStream) => Js.t(#readableStream) = "";
  [@bs.get]
  external getReadableHighWaterMark : Js.t(#readableStream) => int =
    "readableHighWaterMark";
  [@bs.set]
  external setReadableHighWaterMark : (Js.t(#readableStream), int) => int =
    "readableHighWaterMark";
  [@bs.send] external read : (Js.t(#readableStream), int) => dataOut = "";
  [@bs.get]
  external getReadableLength : Js.t(#readableStream) => int =
    "readableLength";
  [@bs.send.pipe: t]
  external resume : Js.t(#readableStream) => Js.t(#readableStream) = "";
  [@bs.send] external setEncoding : string => Js.t(#readableStream) = "";
  [@bs.send]
  external unpipe :
    Js.Undefined.t(Js.t(#writableStream)) => Js.t(readableStream) =
    "";
  [@bs.send.pipe: t]
  external on :
    (
    [@bs.string]
    [
      | `close(unit => 'a)
      | `data(dataOut => 'a)
      | `error(Js.Exn.t => unit)
      | `readable(unit => unit)
    ]
    ) =>
    t =
    "";
  [@bs.send.pipe: Js.t(#readableStream)]
  external onEnd : ([@bs.as "end"] _, unit => unit) => 'a = "on";
};

module WritableStream: {
  type t = Js.t(writableStream);
  [@bs.send.pipe: Js.t(#writableStream)]
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
    Js.t(#writableStream) =
    "";
  [@bs.send.pipe: Js.t(#writableStream)]
  external onEnd : ([@bs.as "end"] _, unit => unit) => 'a = "on";
};