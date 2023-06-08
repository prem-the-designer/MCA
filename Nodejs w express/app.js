var express = require('express');
const bodyparser = require('body-parser');
const hbs = require('express-handlebars')
var app = express();
var fs = require('fs');

app.set('view engine', 'hbs');
app.set('views', 'C:/Users/MCA10/Desktop/new1/views');
app.use(bodyparser.urlencoded({ extended: false }));
app.get("/", function (req, res) {
    fs.readFile("demo.html", (err, data) => {
        res.writeHead(200,{'Content-Type':'text/html'});
        res.write(data);
        return res.end();
    });
});

app.post("/s", (req, res) => {
    console.log(req.body);
    var a = JSON.stringify(req.body);
    fs.writeFile("ex.json", a, (err) => {
        if (err) {
            console.error(err);
        }
    });
    res.redirect('/json');
});
app.get("/json", (req, res) => {
    var a = fs.readFileSync('ex.json');
    var b = JSON.parse(a);
    res.render('handle', { data: b })
});
console.log("The port ");
app.listen(5000);
console.log("is running");