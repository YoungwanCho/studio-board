var express = require('express');
var app = express();
var morgan = require('morgan');
var mysql = require('mysql');
var bodyParser = require('body-parser');

app.use(morgan('short'));
app.use(express.static('./public'));
app.use(bodyParser.urlencoded({extended:false}));

var productRouter = require('./routes/posts.js');
app.use(productRouter);

app.listen(3000, function() {
    console.log('Server On');
});