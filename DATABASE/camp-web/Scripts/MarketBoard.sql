-- 
CREATE SEQUENCE SEQ_MARKET_BOARD;

-- DROP TABLE TBL_MARKET_BOARD;
CREATE TABLE TBL_MARKET_BOARD(
	BNO NUMBER(10),
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WRITER VARCHAR2(200) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE,
	REPLYCNT NUMBER DEFAULT 0,
	PRICE VARCHAR2(200) DEFAULT 0,
	MARKETKEYWORD CHAR(1) NOT NULL,
	THUMBNAIL VARCHAR2(3000),
	AREA VARCHAR2(500) NOT NULL
);

--06/09 키워드 컬럼 추가 (팝니다('S'), 삽니다('B'), 무료나눔('P'))
ALTER TABLE TBL_MARKET_BOARD DROP COLUMN MARKETKEYWORD;
ALTER TABLE TBL_MARKET_BOARD ADD MARKETKEYWORD CHAR(1);
ALTER TABLE TBL_MARKET_BOARD MODIFY MARKETKEYWORD CHAR(1) NOT NULL;
ALTER TABLE TBL_MARKET_BOARD ADD PRICE VARCHAR2(200);
--06/14 썸네일, 지역 컬럼 추가
ALTER TABLE TBL_MARKET_BOARD ADD THUMBNAIL VARCHAR2(3000);
ALTER TABLE TBL_MARKET_BOARD ADD AREA VARCHAR2(500);
ALTER TABLE TBL_MARKET_BOARD MODIFY AREA VARCHAR2(500) NOT NULL;

INSERT INTO TBL_MARKET_BOARD
VALUES(9999999, 'test', 'test', 'juno1234', sysdate, sysdate, 0, 'S', 0, 'test', 'test');



-----------------------------------------------------------------------


ALTER TABLE TBL_MARKET_BOARD ADD CONSTRAINT PK_MARKET_BOARD PRIMARY KEY(BNO);
ALTER TABLE TBL_MARKET_BOARD ADD CONSTRAINT FK_MARKET_BOARD FOREIGN KEY(WRITER) REFERENCES CF_USER(userId) ON DELETE CASCADE;

-- ALTER TABLE TBL_MARKET_BOARD DROP COLUMN LIKECNT;

UPDATE TBL_MARKET_BOARD SET REPLYCNT = (SELECT COUNT(RNO) FROM TBL_MARKET_REPLY 
WHERE TBL_MARKET_REPLY.BNO = TBL_MARKET_BOARD.BNO);


INSERT INTO TBL_MARKET_BOARD
(BNO, TITLE, CONTENT, WRITER, REGDATE, MARKETKEYWORD, PRICE)
VALUES(SEQ_MARKET_BOARD.NEXTVAL, '장작 팝니다', '장작 많아요. 많이 사줘요', 'bbbb0603', SYSDATE, 'S', '33000'
);

SELECT * FROM TBL_MARKET_BOARD ORDER BY BNO desc;


INSERT INTO TBL_MARKET_BOARD (BNO, TITLE, CONTENT, WRITER)
(SELECT SEQ_MARKET_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM TBL_MARKET_BOARD);


---------------------------
-- 댓글 테이블 추가
CREATE SEQUENCE SEQ_MARKET_REPLY;
CREATE TABLE TBL_MARKET_REPLY(
	RNO NUMBER(10),
	BNO NUMBER(10) NOT NULL,
	REPLY VARCHAR2(1000) NOT NULL, -- 댓글 
	REPLYER VARCHAR2(100) NOT NULL, -- 작성자
	REPLYDATE DATE DEFAULT SYSDATE, -- 작성날짜 
	UPDATEDATE DATE DEFAULT SYSDATE -- 수정날짜
);

ALTER TABLE TBL_MARKET_REPLY ADD CONSTRAINT PK_MARKET_REPLY PRIMARY KEY(RNO);
-- ALTER TABLE TBL_REPLY DROP CONSTRAINT FK_REPLY;

ALTER TABLE TBL_MARKET_REPLY ADD CONSTRAINT FK_MARKET_REPLY FOREIGN KEY(BNO)
REFERENCES TBL_MARKET_BOARD(BNO) ON DELETE CASCADE;

ALTER TABLE TBL_MARKET_REPLY ADD CONSTRAINT FK_MARKET_WRITER_REPLY FOREIGN KEY(REPLYER) REFERENCES CF_USER(userId) ON DELETE CASCADE;
-----
SELECT * FROM TBL_MARKET_REPLY;

INSERT INTO TBL_MARKET_REPLY (RNO, BNO, REPLY, REPLYER) VALUES (SEQ_MARKET_REPLY.NEXTVAL, 41, '별로인데용?!', 'test1');


---------------------------------------
-- 파일 첨부 테이블 

CREATE TABLE TBL_MARKET_ATTACH (
	UUID VARCHAR2(200) NOT NULL,
	UPLOADPATH VARCHAR2(200) NOT NULL,
	FILENAME VARCHAR2(200) NOT NULL,
--	FILETYPE CHAR(1) DEFAULT 'I',
	FILETYPE CHAR(1) CHECK(FILETYPE IN(0, 1)), -- 파일타입이 이미지인지 구분하기 위해 지정한다. 0 또는 1이 참이어야지 들어가는 조건식
	BNO NUMBER(10,0)
);

ALTER TABLE TBL_MARKET_ATTACH ADD CONSTRAINT PK_MARKET_ATTACH PRIMARY KEY (UUID);
ALTER TABLE TBL_MARKET_ATTACH ADD CONSTRAINT FK_MARKET_BOARD_ATTACH FOREIGN KEY(BNO) REFERENCES TBL_MARKET_BOARD(BNO);

SELECT * FROM TBL_MARKET_ATTACH;
SELECT * FROM TBL_MARKET_BOARD ;