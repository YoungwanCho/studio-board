var database = require('../database/mysql.js');

module.exports = function (app) {
  var express = require('express');
  var router = express.Router();

  router.get("/:cur", function (req, res) {
    var max_size_view_page = 10; // 한번에 보여줄 수 있는 최대 페이지 목록 수
    var max_size_view_content = 10; // 한 페이지에서 보여줄 수 있는 최대 게시글 수

    var queryString = 'select count(*) as cnt from Contents'
    database.getConnection().query(queryString, function (error, data) {
      if (error) {
        console.log(error + "메인화면 mysql 조회 실패");
        return;
      }

      var total_size_content = data[0].cnt;  // 전체 게시글의 수
      var curPage = req.params.cur;

      if (total_size_content < 0) {
        total_size_content = 0;
      }

      var totalPage = parseInt(total_size_content / max_size_view_content); // 필요한 전체 페이지 수

      if ((total_size_content % max_size_view_content) != 0) {
        totalPage++;
      }

      var totalSet = parseInt(totalPage / max_size_view_page) + 1; // 필요한 전체 세트 수
      var curSet = parseInt(curPage / max_size_view_page) + 1;
      var startPage = ((curSet - 1) * max_size_view_page) + 1;
      var min_size_page = Math.min(totalPage, max_size_view_page);
      var endPage = (startPage + min_size_page) - 1;

      var no = 0; // 보여줄 게시글의 시작 번호

      if (curPage < 0) {
        no = 0;
      } else {
        no = (curPage - 1) * max_size_view_content
      }

      var pasing = {
        "curPage": curPage,
        "max_size_view_content": max_size_view_content,
        "totalPage": totalPage,
        "totalSet": totalSet,
        "curSet": curSet,
        "startPage": startPage,
        "endPage": endPage
      };

      var queryString = 'select * from Contents order by grpid desc, grpord asc limit ?,?';
      database.getConnection().query(queryString, [no, max_size_view_content], function (error, result) {
        if (error) {
          console.log("페이징 에러");
          return;
        }

        res.render('list', { data: result, pasing: pasing });
      });
    });
  });

  return router;
};