// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();
let bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({ optionsSuccessStatus: 200 }));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


// your first API endpoint... 
function isValidDate(date) {
  return date.toUTCString() === 'Invalid Date';
}
app.get("/api/", (req, res) => {
  let date = new Date();
  res.json({ "unix": date.getTime(), "utc": date.toUTCString() });

});
app.get("/api/:date", (req, res) => {
  let dateString = req.params['date'];
  let date = new Date();
  if (isNaN(+req.params['date'])) {
    date = new Date(req.params['date'])
  } else {
    date = new Date(+req.params['date'])
  }

  console.log("Date: " + date);
  if (!isValidDate(date)) {
    res.json({ "unix": date.getTime(), "utc": date.toUTCString() });
  } else {
    res.json({ error: "Invalid Date" });
  }





});
// app.post("/api", (req, res) => {
//   const date = newDate("" + req.body.date);
//   console.log(req.body.date);
// })


// listen for requests :)
const port = process.env.PORT || 3001;
var listener = app.listen(port, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
