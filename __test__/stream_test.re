open Jest;

open BsNode;

open Stream;

open Cast;

describe("Stream", () => {
  open Expect;
  open! Expect.Operators;
  testAsync("Pipe data through stream", finish => {
    let subject = createPassThroughStream();
    let dest = createPassThroughStream();
    let fixture = "I am the string";
    ReadableStream.pipe(subject, dest) |> ignore;
    WritableStream.writeString(subject, ~data=fixture, ()) |> ignore;
    dest
    |> ReadableStream.on(
         `data(
           out =>
             switch (classifyDataOutput(out)) {
             | Buf(buf) =>
               finish(expect(NodeBuffer.toString(buf)) |> toEqual(fixture))
             | _ => Js.Exn.raiseError("Did not get buffer")
             },
         ),
       )
    |> ignore;
  });
});