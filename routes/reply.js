var database = require('../database/mysql.js');

module.exports = function (app) {
  var express = require('express');
  var router = express.Router();

  router.get("/:id", function (req, res) {
    database.getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
      var text = result[0].description;
      text = text.replace(/(?:\n|\r\n)/g, '<br>');
      result[0].description = text;
      res.render('reply', { data: result[0] });
    });
  });

  router.post("/:id", function (req, res) {
    database.getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
      var origin = result[0];
      // 원글의 답글을 다는 경우
      if (origin.id == origin.parentid) {
        database.getConnection().query('select max(grpord) from Contents where grpid = ?', [origin.grpid], function (error, result) {
          var maxgrpord = result[0]['max(grpord)'];
          if (!maxgrpord) {
            maxgrpord = 0;
          }
          var parentid = origin.id;
          var groupid = origin.grpid;
          var grouporder = maxgrpord + 1;
          var depth = origin.depth + 1;
          database.getConnection().query('insert into Contents(parentid, grpid, grpord, depth, title, writer, description) values (?,?,?,?,?,?,?)',
            [parentid, groupid, grouporder, depth, req.body.title, req.body.writer, req.body.description], function () {
              res.redirect('/board');
            });
        });
        //답글의 답글을 다는 경우
      } else {
        database.getConnection().query('select max(grpord) from Contents where parentid = ?', [origin.id], function (error, result) {
          var maxgrpord = result[0]['max(grpord)'];
          if (!maxgrpord) {
            maxgrpord = origin.grpord;
          }
          database.getConnection().query('update Contents set grpord = grpord + 1 where grpid = ? and grpord > ?', [origin.grpid, maxgrpord], function () {
            var parentid = origin.id;
            var groupid = origin.grpid;
            var grouporder = maxgrpord + 1;
            var depth = origin.depth + 1;
            database.getConnection().query('insert into Contents(parentid, grpid, grpord, depth, title, writer, description) values (?,?,?,?,?,?,?)', [parentid, groupid, grouporder, depth, req.body.title, req.body.writer, req.body.description], function () {
              res.redirect('/board');
            });
          });
        });
      }
    });
  });

  return router;
};