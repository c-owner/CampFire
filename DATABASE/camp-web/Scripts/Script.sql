-- id, pw, email,
-- 이름, 나이, 성별, 휴대폰번호, 주소
DROP TABLE CAMP_USER CASCADE CONSTRAINTS;
 
CREATE TABLE CAMP_MEMBER
(
    memberId            VARCHAR2(100) NOT NULL,
    memberPw            VARCHAR2(100) NOT NULL,
    memberEmail         VARCHAR2(200) NOT NULL,
    memberName          VARCHAR2(100),
    memberAge           NUMBER(3),
    memberGender        VARCHAR2(20),
    memberTel           VARCHAR2(14),
    memberZipcode       VARCHAR2(20),
    memberAddress       VARCHAR2(300),
    memberAddressDETAIL VARCHAR2(300),
    memberAddressEtc    VARCHAR2(100),
    CONSTRAINT CAMP_USER_PK PRIMARY KEY (memberId)
);

DROP TABLE CAMP_USER CASCADE CONSTRAINTS;
CREATE TABLE CAMP_USER
(
	memberId VARCHAR2(300),
	memberPw VARCHAR2(300)
--	memberName VARCHAR2(200),
--	memberAge NUMBER(3),
--	memberGender VARCHAR2(20),
	memberEmail VARCHAR2(200),
--	memberZipcode VARCHAR2(20),
--	memberAddress VARCHAR2(300),
--	memberAddressDetail VARCHAR2(300),
--	memberAddressEtc VARCHAR2(100),
  CONSTRAINT CAMP_USER_PK PRIMARY KEY (memberId)
);

CREATE TABLE CAMP_USER
(
	memberId VARCHAR2(300),
	memberPw VARCHAR2(300),
	memberEmail VARCHAR2(200),
	memberEmailHash VARCHAR2(200),
	memberEmailChecked char(1),
  CONSTRAINT CAMP_USER_PK PRIMARY KEY (memberId)
);

SELECT * FROM CAMP_USER;

SELECT * FROM HR.TABLE_MEMBER;

---
 

-- 제약조건 삭제
-- ALTER TABLE TABLE_MEMBER DROP CONSTRAINT MEMBER_PK;
--
-- SELECT * FROM TABLE_MEMBER;
SELECT * FROM CAMP_USER;

INSERT INTO CAMP_USER
(MEMBERID, MEMBERPW, MEMBEREMAIL, MEMBEREMAILHASH, MEMBEREMAILCHECKED)
VALUES('asd1235', '1234', 'ddd', 'asd', 0);
