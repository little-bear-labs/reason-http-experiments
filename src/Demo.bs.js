// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var Http = require("http");

var server = Http.createServer((function (req, res) {
        req.on("close", (function () {
                console.log("readable close");
                return /* () */0;
              }));
        res.on("finish", (function () {
                  console.log("Finish");
                  return /* () */0;
                })).on("end", (function () {
                console.log("the end");
                return /* () */0;
              }));
        res.writeHead(200, null, null);
        req.pipe(res);
        return /* () */0;
      }));

server.listen(60023);

exports.server = server;
/* server Not a pure module */
