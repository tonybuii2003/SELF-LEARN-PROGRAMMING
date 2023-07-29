let express = require('express');
let bodyParser = require('body-parser');
let app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.post("/name", (req, res) => {
    firstname = req.body.first;
    lastname = req.body.last;
    var full_name = "" + firstname + " " + lastname;
    res.json({ name: full_name });
});
app.use(function middleware(req, res, next) {
    var string = req.method + " " + req.path + " - " + req.ip;
    console.log(string);
    next();
});
//get current time
app.get("/now", (req, res, next) => {
    req.time = new Date().toString();
    next();
}, (req, res) => {
    res.json({ "time": req.time });
});
//get the route before echo must use /:word/echo
app.get("/:word/echo", (req, res) => {
    res.json({ echo: req.params['word'] });
});
app.get("/name", (req, res) => {
    firstname = req.query.first;
    lastname = req.query.last;
    var full_name = "" + firstname + " " + lastname;
    res.json({ name: full_name });
});

require('dotenv').config();
console.log("Hello World")

// app.get("/", function (req, res) {
//     res.send("Hello Express");
// });



app.get("/", (req, res) => {
    res.sendFile(__dirname + "/views/index.html");
});

app.use("/public", express.static(__dirname + "/public"))

app.get("/json", (req, res) => {
    if (process.env.MESSAGE_STYLE === "uppercase") {
        res.json({ "message": "Hello json".toUpperCase() });
    } else {
        res.json({ "message": "Hello json" });
    }

});






























module.exports = app;
