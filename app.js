var express = require('express');
var bodyParser = require('body-parser');
var morgan = require('morgan');

var app = express();

app.set('view engine', 'ejs');
app.set('views', './views');

app.use(morgan('short'));
app.use(express.static('./public'));
app.use(bodyParser.urlencoded({ extended: false }));

var productRouter = require('./routes/posts.js');
app.use(productRouter);

app.listen(3000, function () {
  console.log('Server On');
});