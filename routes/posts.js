var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var fs = require('fs');
var ejs = require('ejs');
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({ extended: false }));

router.get("/board/pasing/:cur", function (req, res) {

    var max_size_view_page = 10; // 한번에 보여줄 수 있는 최대 페이지 목록 수
    var max_size_view_content = 10; // 한 페이지에서 보여줄 수 있는 최대 게시글 수

    var queryString = 'select count(*) as cnt from Contents'
    getConnection().query(queryString, function (error2, data) {
        if (error2) {
            console.log(error2 + "메인화면 mysql 조회 실패");
            return;
        }

        var total_size_content = data[0].cnt;  // 전체 게시글의 수
        var curPage = req.params.cur;
        if (total_size_content < 0) {
            total_size_content = 0;
        }

        var totalPage = parseInt(total_size_content / max_size_view_content) + 1; // 필요한 전체 페이지 수
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

        var result2 = {
            "curPage": curPage,
            "max_size_view_content": max_size_view_content,
            "totalPage": totalPage,
            "totalSet": totalSet,
            "curSet": curSet,
            "startPage": startPage,
            "endPage": endPage
        };

        var queryString = 'select * from Contents order by id desc limit ?,?';
        getConnection().query(queryString, [no, max_size_view_content], function (error, result) {
            if (error) {
                console.log("페이징 에러");
                return;
            }

            res.render('list', { data: result, pasing: result2 });
        });
    });
});

router.get("/board/insert", function (req, res) {
    res.render('insert');
});

router.post("/board/insert", function (req, res) {
    console.log("삽입 포스트 데이터 진행")
    var body = req.body;
    getConnection().query('insert into Contents(title, writer, description) values (?,?,?)', [body.title, body.writer, body.description], function () {
        //응답
        res.redirect('/board');
    })
})

router.get("/board/detail/:id", function (req, res) {
    getConnection().query('select * from Contents where id = ?', [req.params.id], function (error, result) {
        res.render('detail', { data: result[0] });
    });
});

router.get("/board", function (req, res) {
    console.log("main");
    res.redirect('/board/pasing/' + 1)
});

var pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    database: 'studio_board',
    password: '1234'
})

function getConnection() {
    return pool
}

module.exports = router;