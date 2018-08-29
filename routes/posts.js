var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({ extended: false }));

router.get("/board/pasing/:cur", function (req, res) {
  var max_size_view_page = 10; // 한번에 보여줄 수 있는 최대 페이지 목록 수
  var max_size_view_content = 10; // 한 페이지에서 보여줄 수 있는 최대 게시글 수

  var queryString = 'select count(*) as cnt from Contents'
  getConnection().query(queryString, function (error, data) {
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
    getConnection().query(queryString, [no, max_size_view_content], function (error, result) {
      if (error) {
        console.log("페이징 에러");
        return;
      }

      res.render('list', { data: result, pasing: pasing });
    });
  });
});

router.get("/board/insert", function (req, res) {
  res.render('insert');
});

router.post("/board/insert", function (req, res) {
  getConnection().query('select max(id) from Contents', function (error, result) {
    if (error) {
      return;
    }

    var groupid = 0;
    var groupord = 0;
    var depth = 0;

    var groupid = result[0]['max(id)'];
    
    if (!groupid) {
      groupid = 0;
    }
    
    groupid++;
    getConnection().query('insert into Contents(grpid, grpord, depth, title, writer, description) values (?,?,?,?,?,?)',
      [groupid, groupord, depth, req.body.title, req.body.writer, req.body.description], function () {
        res.redirect('/board');
      });
  });
});

router.get("/board/reply/:id", function (req, res) {
  getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
    res.render('reply', { data: result[0] });
  });
});

router.post("/board/reply/:id", function (req, res) {
  getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
    var origin = result[0];

    if (origin.depth == 0) {
      getConnection().query('select max(grpord) from Contents where grpid = ?', [origin.grpid], function (error, result) {
        var maxgrpord = result[0]['max(grpord)'];
        if (!maxgrpord) {
          maxgrpord = 0;
        }
        var groupid = origin.grpid;
        var grouporder = maxgrpord + 1;
        var depth = origin.depth + 1;
        getConnection().query('insert into Contents(grpid, grpord, depth, title, writer, description) values (?,?,?,?,?,?)',
          [groupid, grouporder, depth, req.body.title, req.body.writer, req.body.description], function () {
            res.redirect('/board');
          });
      });
    } else {
      getConnection().query('update Contents grpord = grpord + 1 where grpid = ? and grpord > ?', [origin.grpid, origin.grpord], function () {
        var groupid = origin.grpid;
        var grouporder = origin.grpord + 1;
        var depth = origin.depth + 1;
        getConnection().query('insert into Contents(grpid, grpord, depth, title, writer, description) values (?,?,?,?,?,?)', [groupid, grouporder, depth, req.body.title, req.body.writer, req.body.description], function () {
          res.redirect('/board');
        });
      });
    }
  });
});

router.get("/board/edit/:id", function (req, res) {
  getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
    res.render('edit', { data: result[0] });
  });
});

router.post("/board/edit/:id", function (req, res) {
  getConnection().query('update Contents set title = ?, writer = ?, description = ? where id = ?',
    [req.body.title, req.body.writer, req.body.description, req.params.id], function () {
      res.redirect('/board');
    });
});

router.get("/board/delete/:id", function (req, res) {
  getConnection().query('delete from Contents where id = ?', [req.params.id], function () {
    res.redirect('/board');
  });
});

router.get("/board/detail/:id", function (req, res) {
  getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
    var text = result[0].description;
    text = text.replace(/(?:\n|\r\n)/g, '<br>');
    result[0].description = text;
    res.render('detail', { data: result[0] });
  });
});

router.get("/board", function (req, res) {
  res.redirect('/board/pasing/' + 1)
});

var pool = mysql.createPool({
  connectionLimit: 10,
  host: 'localhost',
  user: 'root',
  database: 'studio_board',
  password: '1234'
});

function getConnection() {
  return pool
}

module.exports = router;