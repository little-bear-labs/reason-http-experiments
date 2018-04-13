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