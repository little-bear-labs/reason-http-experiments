/*
   NOTE: these are used as reference as we do not have the capability to
   reuse these values and still have them appear as strings. Translation?
   We copy paste these all over the place.
 */
[@bs.deriving jsConverter]
type t = [
  | [@bs.as "ascii"] `ascii
  | [@bs.as "base64"] `base64
  | [@bs.as "binary"] `binary
  | [@bs.as "hex"] `hex
  | [@bs.as "ucs2"] `ucs2
  | [@bs.as "utf16le"] `utf16le
  | [@bs.as "utf8"] `utf8
  | [@bs.as "latin1"] `latin1
];