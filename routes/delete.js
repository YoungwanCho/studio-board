var database = require('../database/mysql.js');

module.exports = function (app) {
  var express = require('express');
  var router = express.Router();

  router.get("/:id", function (req, res) {
    database.getConnection().query('update Contents set title = ?, writer = ?, description = ? where id = ?', ["", "", "", req.params.id], function () {
      res.redirect('/board');
    });
  });

  return router;
};