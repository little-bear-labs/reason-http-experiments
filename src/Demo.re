open Http;

open Cast;

let server =
  createServer((req, res) => {
    req
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
    |> ignore;
    res
    /* |> ServerResponse.on(`close(() => Js.log("Close"))) */
    |> ServerResponse.on(`finish(() => Js.log("Finish")))
    |> Stream.WritableStream.onEnd(() => Js.log("the end"))
    |> ignore;
    let _ = res##writeHead(200, Js.Nullable.null, Js.Nullable.null);
    /* let _ = req##pipe(res); */
    ();
  });

/* print_string(Http.ServerResponse.hello); */
listen(server, 60023);