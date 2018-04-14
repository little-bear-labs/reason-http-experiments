open Http;

let server =
  createServer((req, res) => {
    req |> Stream.ReadableStream.on(`close(() => Js.log("readable close")));
    res
    /* |> ServerResponse.on(`close(() => Js.log("Close"))) */
    |> ServerResponse.on(`finish(() => Js.log("Finish")))
    |> Stream.WritableStream.onEnd(() => Js.log("the end"))
    |> ignore;
    let _ = res##writeHead(200, Js.Nullable.null, Js.Nullable.null);
    let _ = req##pipe(res);
    ();
  });

/* print_string(Http.ServerResponse.hello); */
listen(server, 60023);