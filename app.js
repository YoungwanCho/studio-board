var express = require('express');
var bodyParser = require('body-parser');
var morgan = require('morgan');

var app = express();

app.set('view engine', 'ejs');
app.set('views', './views');

app.use(morgan('short'));
app.use(express.static('./public'));
app.use(bodyParser.urlencoded({ extended: false }));

var board = require('./routes/board.js')(app);
app.use('/board', board);

var pasing = require('./routes/pasing.js')(app);
app.use('/board/pasing', pasing);

var detail = require('./routes/detail.js')(app);
app.use('/board/detail', detail);

var reply = require('./routes/reply.js')(app);
app.use('/board/reply', reply);

var insert = require('./routes/insert.js')(app);
app.use('/board/insert', insert);

var edit = require('./routes/edit.js')(app);
app.use('/board/edit', edit);

var deleteContent = require('./routes/delete.js')(app);
app.use('/board/delete', deleteContent);

app.listen(3000, function () {
  console.log('Server On');
});