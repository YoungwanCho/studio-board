var database = require('../database/mysql.js');

module.exports = function (app) {
  var express = require('express');
  var router = express.Router();

  router.get("/:id", function (req, res) {
    database.getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
      var text = result[0].description;
      text = text.replace(/(?:\n|\r\n)/g, '<br>');
      result[0].description = text;

      database.getConnection().query('select * from Comments where parentid = ?', [result[0].id], function (error2, result2) {
        var comments = result2;
        res.render('detail', { data: result[0], comment: comments });
      })
    });
  });

  router.post("/comment/:id", function (req, res) {
    database.getConnection().query('insert into Comments(parentid, writer, description) values (?,?,?)',
      [req.params.id, req.body.writer, req.body.description], function () {
        res.redirect('/board/detail/' + req.params.id);
      });
  })

  return router;
};