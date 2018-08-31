var mysql = require('mysql');

var pool = mysql.createPool({
  connectionLimit: 10,
  host: 'localhost',
  user: 'root',
  database: 'studio_board',
  password: '1234'
});

exports.getConnection = function () {
  return pool
};