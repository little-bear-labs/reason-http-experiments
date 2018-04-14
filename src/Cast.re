open Stream;

external toBuffer : 'a => Node.Buffer.t = "%identity";

type bufferClassification =
  | Buf(Node.Buffer.t)
  | Str(string)
  | JsType(Js.Types.tagged_t);

let classifyDataOutput = (bufOrStr: dataOut) : bufferClassification =>
  if (Node_buffer.isBuffer(bufOrStr)) {
    Buf(toBuffer(bufOrStr));
  } else {
    let classified = Js.Types.classify(bufOrStr);
    switch (classified) {
    | Js.Types.JSString(str) => Str(str)
    | _ => JsType(classified)
    };
  };