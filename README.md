# STUDIO-BOARD
## 개발실-게시판
### 프로젝트 소개
- Ubuntu, MySQL, Nodejs, nginx, HTML 웹서비스 관련 프론트엔드와 백엔드를 답습하기 위한 프로젝트입니다.

### 환경설정
- Server version: Ubuntu 18.04.1 LTS
- nginx version: nginx/1.14.0 (Ubuntu)
- Nodejs version: 10.8.0
- MySQL version: 5.7.23, for Linux (x86_64)

### 실행방법
#### Nodejs
- 의존 패키지를 설치하세요
```sh> npm install```
- 서버를 실행시키세요
```sh> node app.js```

- /routes/posts.js 파일안에 mysql.createPool 설정값중 User는 root보다 다른계정 사용을 권장합니다.
	> 쿼리시 root 사용자로 접근하면 권한 문제가 발생 할 수 있음

- App은 3000포트를 사용하도록 코드안에 설정 되어있습니다.

#### MySQL
- mysql에 접속하세요
```sh> mysql -uroot -p;```

- 'stduio_board' 라는 데이터베이스를 생성하세요
```mysql> CREATE DATABASE stduio_board;```

- /hub/db/studio_board_schema.sql를 이용해 복구하세요
```sh> mysql -uroot -p studio_board < /hub/db/studio_board_schema.sql```

- 테이블은 이름은 'Contents'입니다.

#### 웹브라우저
[studio-board]:(http://localhost:3000/board)