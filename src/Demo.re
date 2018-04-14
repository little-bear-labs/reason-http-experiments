open Http;

let server =
  createServer((req, res) => {
    Js.log("Sup I be here");
    res
    |> ServerResponse.on(`close(() => Js.log("Close")))
    |> ServerResponse.on(`finish(() => Js.log("Finish")))
    |> ignore;
    let _ = res##writeHead(200, Js.Nullable.null, Js.Nullable.null);
    let _ = req##pipe(res);
    ();
  });

/* print_string(Http.ServerResponse.hello); */
listen(server, 60023);