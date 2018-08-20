var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var fs = require('fs');
var ejs = require('ejs');
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({ extended: false }));

router.get("/pasing/:cur", function (req, res) {

    var page_size = 10;
    var page_list_size = 10;
    var no = "";
    var totalContentCount = 0;

    var queryString = 'select count(*) as cnt from Contents'
    getConnection().query(queryString, function (error2, data) {
        if (error2) {
            console.log(error2 + "메인화면 mysql 조회 실패");
            return;
        }
        console.log('data ' + data[0].cnt);

        totalContentCount = data[0].cnt;

        var curPage = req.params.cur;

        console.log("cur Page : " + curPage, "total Page : " + totalContentCount);

        if (totalContentCount < 0) {
            totalContentCount = 0;
        }

        var totalPage = Math.ceil(totalContentCount / page_size);
        var totalSet = Math.ceil(totalContentCount / page_list_size);
        var curSet = Math.ceil(curPage / page_list_size);
        var startPage = ((curSet - 1) * 10) + 1;
        var endPage = (startPage + page_list_size) - 1;

        console.log('[0] curPage : ' + curPage + ' | [1] page_list_size : ' + page_list_size + ' | [2] page_size : ' + page_size + ' | [3] totalPage : ' + totalPage + ' | [4] totalSet : ' + totalSet + ' | [5] curSet : ' + curSet + ' | [6] startPage : ' + startPage + ' | [7] endPage : ' + endPage);

        if (curPage < 0) {
            no = 0;
        } else {
            no = (curPage - 1) * 10
        }

        var result2 = {
            "curPage": curPage,
            "page_list_size": page_list_size,
            "page_size": page_size,
            "totalPage:": totalPage,
            "totalSet:": totalSet,
            "curSet": curSet,
            "startPage": startPage,
            "endPage": endPage
        };

        fs.readFile('./html/list.html', 'utf-8', function (error, data) {
            if (error) {
                console.log("ejs오류" + error);
                return;
            }

            var queryString = 'select * from Contents order by id desc limit ?,?';
            getConnection().query(queryString, [no, page_size], function (error, result) {
                if (error) {
                    console.log("페이징 에러");
                    return;
                }
                res.send(ejs.render(data, {
                    data: result,
                    pasing: result2
                }
                ));
            });
        });
    });
});

router.get("/insert", function (req, res) {
    console.log("글쓰기");
    fs.readFile('./html/insert.html', 'utf-8', function (error, data) {
        res.send(data);
    });
});

router.post("/insert", function (req, res) {
    console.log("삽입 포스트 데이터 진행")
    var body = req.body;
    console.log('[0] id : ' + body.id + ' | [1] title : ' + body.title + ' | [2] writer : ' + body.writer + ' | description : ' + body.description);
    console.log();
    getConnection().query('insert into Contents(id, title, writer, description) values (?,?,?,?)', [body.id, body.title, body.writer, body.description], function () {
        //응답
        res.redirect('/main');
    })
})

router.get("/main", function (req, res) {
    console.log("main");
    res.redirect('/pasing/' + 1)
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