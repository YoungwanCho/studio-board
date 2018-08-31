module.exports = function (app) {
  var express = require('express');
  var router = express.Router();

  router.get("/", function (req, res) {
    res.redirect('/board/pasing/' + 1)
  });

  return router;
};