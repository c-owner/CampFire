## 개발

1. 기획(ppt 파일)

2. 디자인

3. 개발(ppt파일-플로우차트, 로직프로세스)

   1. **MVC model2로 구현**

   - **회원가입(이메일 인증), 로그인** - 구현완료
   - 로그아웃 - 구현완료
   - **아이디, 비밀번호 찾기** -  구현완료



---

**아이디 찾기**

ID는 login.jsp 에서 email 을 입력받는다.

↓

입력받은 email로 가입된 회원을 조회하여 아이디를 전송한다.

↓

```sql
select memberId from camp_user where memberEmail = ?;
```

↓

SQL을 통해 조회한 아이디를 컨트롤러에서 이메일로 전송하는 로직을 구현한다.

↓

이메일 전송 완료를 alert창을 띄워 사용자가 메일로 확인하도록 유도한다.

↓

----



##### 비밀번호 찾기

login.jsp 에서 id와 email을 입력하여 비밀번호 찾기 버튼 클릭

↓

아이디와 이메일을 조회하여 임시비밀번호로 새로 갱신해준다.

↓

```sql
SELECT MEMBERPW FROM CAMP_USER WHERE MEMBERID = #{memberId};
```



```sql
update camp_user set memberPw 
where memberId = #{memberId} and memberEmail = #{memberEmail};
```

↓

임시 비밀번호를 사용자 이메일에 전송한다.

↓



#### **-- 임시 비밀번호를 발급하고 update할 때에는 encrypt로 암호화 해야한다.!!**