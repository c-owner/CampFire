-- id, pw, email,
-- 이름, 나이, 성별, 휴대폰번호, 주소

CREATE TABLE MEMBER(
                       memberId VARCHAR2(100) NOT NULL,
                       memberPw VARCHAR2(100) NOT NULL,
                       memberEmail VARCHAR2(200) NOT NULL,
                       memberName VARCHAR2(100),
                       memberAge NUMBER(3),
                       memberGender VARCHAR2(20),
                       memberTel VARCHAR2(14),
                       memberZipcode VARCHAR2(20),
                       memberAddress VARCHAR2(300),
                       memberAddressDETAIL VARCHAR2(300),
                       memberAddressEtc VARCHAR2(100),
                       CONSTRAINT MEMBER_PK PRIMARY KEY (memberId)
);



