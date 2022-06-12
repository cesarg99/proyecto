var express = require("express")
var path = require("path")
var bodyParser = require("body-parser")
var flash = require("connect-flash")
var app = express()


// Config
app.set("port", 3000)
app.set("view engine", "ejs")
app.set("views", path.join(__dirname, "views"))

// Middleware.
app.use(flash())
app.use(bodyParser.urlencoded({ extend: false}))
app.use(bodyParser.json())
app.use(require("./routes/index.js"))


app.listen(app.get("port"), () => {
    console.log("Corriendo")
})