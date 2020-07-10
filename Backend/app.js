const express = require("express");
var app = express();

const bodyParser = require('body-parser');
const path = require('path');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

const db = require("./helpers/db")();

// Routes
const indexRoute = require('./routes/index');
app.use('/', indexRoute);

const userRoute = require('./routes/user');
app.use('/user', userRoute);


app.listen(3000, () => {
    console.log("App Started On Port : 3000");
});
