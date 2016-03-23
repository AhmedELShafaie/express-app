var express = require('express');
var app = express();

app.get('/', function (req, res) {
  var hostname = require('os').hostname();
  res.send('This is my updated version! Coucou nico, My hostname is '+hostname);
});

app.listen(8080, function () {
  console.log('Listening on port 8080');
});
