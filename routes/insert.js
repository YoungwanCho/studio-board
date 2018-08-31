var database = require('../database/mysql.js');

module.exports = function (app) {
  var express = require('express');
  var router = express.Router();

  router.get("/", function (req, res) {
    res.render('insert');
  });

  router.post("/", function (req, res) {
    database.getConnection().query('select max(id) from Contents', function (error, result) {
      if (error) {
        return;
      }

      var parentid = 0;
      var groupid = 0;
      var groupord = 0;
      var depth = 0;

      var groupid = result[0]['max(id)'];

      if (!groupid) {
        groupid = 0;
      }

      groupid++;
      parentid = groupid;
      database.getConnection().query('insert into Contents(parentid, grpid, grpord, depth, title, writer, description) values (?,?,?,?,?,?,?)',
        [parentid, groupid, groupord, depth, req.body.title, req.body.writer, req.body.description], function () {
          res.redirect('/board');
        });
    });
  });

  return router;
};