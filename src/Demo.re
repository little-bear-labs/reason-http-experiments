open Http;

open Stream;

/* open Cast; */
let server =
  createServer((req, res) => {
    /* req
       |> Stream.ReadableStream.on(
            `data(
              out =>
                switch (classifyDataOutput(out)) {
                | Buf(buf) =>
                  Js.log("got buffer" ++ BsNode.NodeBuffer.toString(buf))
                | Str(str) => Js.log("got string" ++ str)
                | JsType(Js.Types.JSString(str)) => Js.log("got string" ++ str)
                | _ => Js.log("unkonwn type")
                },
            ),
          )
       |> ignore; */
    /* req |> ReadableStream.(pipe(res)) |> ignore; */
    let out =
      res
      |> WritableStream.on(`close(() => Js.log("Close")))
      |> ServerResponse.on(`finish(() => Js.log("Finish")))
      |> WritableStream.onEnd(() => Js.log("the end"))
      |> ServerResponse.writeHead(~status=200, ());
    Js.log(out);
    /* let _ = req##pipe(res); */
    let _ =
      WritableStream.writeString(
        res,
        ~data="yo I am the data",
        ~encoding=`ascii,
        (),
      );
    let _ = WritableStream.endStream(res);
    ();
  });

/* print_string(Http.ServerResponse.hello); */
listen(server, 60023);