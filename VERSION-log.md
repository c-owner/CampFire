# commit🌱

`해야할 일`

```

```

**이슈 발견**

- 

---

## 2021-06-11😶‍🌫️ v0.01g-alpha - hotFix

- 리뷰 페이지 검색 구현 완료 (테스트 이상 없음)
  - 페이징 처리 구현
    - **bug hot fix**
- 자유게시판, 리뷰 게시판 날짜 형식 수정 
- 마켓 페이지 구현 진행 중 
- Default 썸네일 이미지 수정 
  - 사이즈 변경
- 불필요 파일 및 이미지 제거 

- iOS 웹뷰 앱 개발 구현 완료 



---

## 2021-06-10😶‍🌫️ v0.01g-alpha

- 서버 경로에 맞게 경로 수정 됨
- ReviewReplyMapper.xml  SQL 수정 
- ReviewReply 비지니스 로직 수정
- 리뷰 상세보기
  - 리뷰 상세보기 댓글 폼 스타일 수정
  - 댓글 기능 구현 완료 
  - 리뷰 댓글 페이징 처리 완료 
- 사진을 첨부하지 않았을 경우 및 파일 경로가 Error일 경우 default Img 처리
- 리뷰 뷰페이지 img 태그의 css 스타일 겹친 문제 수정

---

## 2021-06-08😤 v0.01f-alpha

- 리뷰 리스트 / 등록 / 수정 구현 
  - **이슈 :** 파일 첨부 관련 문제 
- main css - 버튼 색상 전체 수정
- 마켓 페이지 매퍼 테스트 까지 구현 완료 

---

## 2021-06-07🔥 v0.01f-alpha

- 리뷰 등록 페이지 카테고리 추가 + 유효성 검사 
- 파일 첨부 컨트롤러 구현 (UploadController에 프리보드 작업으로 인해 보류)







---

## 2021-06-06🔥 v0.01f-alpha

- 회원가입시 비밀번호 정규식으로 인해 비밀번호 유효성 일치하지 않던 문제 해결 

- 버그 : 로그아웃 시 401 에러 문제 ( 카카오API 관련 ) 

- 캠핑 리뷰 게시판 검색 기준 카테고리 간격 수정 (반응형 o ) 

  - 검색 아이콘 -> 버튼으로 수정 

    









---

## 2021-06-03🏕 v0.01e-alpha

- 프로젝트 폴더 및 페이지 이름&구조 변경 
- Controller : ReviewController, FreeController 구현 및 매퍼 테스트 완료 
- 테이블 수정 및 추가 구현 

![ERD](https://github.com/Eight-Corner/CampFire/blob/master/ERD.png?raw=true)

- 자유게시판, 등록, 뷰, 리스트 페이지 구현

- 회원가입 / 로그인 디테일 수정 및 점검

- 헤더, 푸터 모든 링크 지정 

- 리뷰게시판 List 페이지 테스트 이상없음

- 리뷰게시판 댓글처리 구현

  

---

## 2021-05-31🌱 v0.01d-alpha 



- 리뷰리스트 게시판 페이지 부분 스타일 조정 

  - 사진 반응형 수정 ( 고해상도 사이즈 늘어짐 fix)
  - 헤더 스타일 fix

  - Review List header & 버튼 글 정렬 스타일 수정 
  - 738px 에서 980px까지 리스트 2열 정렬

- header 로고 하단 블루 라인 제거 

- USER Account 부분 email library 구현

- 인증코드 전송 구현 / 테스트시 mailDTO, 이메일 비밀번호 입력 후 테스트 

- 회원가입, 유효성 검사, ID / PW 찾기

- 비밀번호 변경 페이지 개발



> 구현예정

- 회원가입 폼 ajax 구현 예정
- 아이디 비번 찾기 구현 예정



---





## 2021-05-30🌨 v0.01c-alpha - by corner

- 메뉴 헤더 목록 변경 

- smallNav (계정) 메뉴 수정 

- 헤더 사이즈 변경

- header 인라인 style들 정리

- 캠핑 리뷰 게시판 초안 레이아웃 (샘플)

- 캠핑 리뷰 리스트 게시판 사진 레이아웃 조절 - by JunoFlow

- 리뷰리스트 게시판 페이지 부분 스타일 조정 

  > - 리뷰 리스트 게시판 페이지 번호 박스 내부 센터 정렬
  > - 리뷰 리스트 게시판 페이지 액티브 박스 색상 사이즈 조절
  > - 페이지 박스 스타일 border 굵기 겹칩문제 수정 
  > - 767px 이하 사이즈에서 업로드 버튼 show
  > - 정렬 카테고리 부분 447px이하 사이즈에서 가로 정렬 틀어짐 문제 수정





---

## 2021-05-28-⚙️  0.01c - by corner

- width 1281 ~ 1680 사이즈  && 1700 이상 사이즈까지 모달 하단부 margin 적용 (no media screen)

- 타 페이지에서 헤더 메뉴에서 모달 동작 안되는 문제  - 해결

- modal.jsp에 아래  li태그 `<li style="">` 인라인 스타일 코드들 전부 제거 

  ```jsp
  <ul class="actions">
    <li style="margin-left: auto;">
      <a href="javascript:goSignIn2()" class="button primary" style="border-radius: 6px; height: 46px;">로그인</a>
    </li>
    <li style="margin-right: auto;">
      <a class="button primary" style="border-radius: 6px; height: 46px;">이메일 발송</a>
    </li>
  </ul>
  ```

  - id 부여 및 글자 중앙정렬 스타일 적용 - 간격 정렬

- `home.jsp` `header.jsp` 에 있는 `<style>` 태그 /* modal */ 부분 `layout.css`로 이동 









---

## 2021-05-27-⚙️  0.01b - by corner

`작업기간 : 1d 4h`

- header.jsp 메뉴 수정 
- 메인 & header 분리 완료 
  - 메인에서는 투명도 100%
  - 헤더에서는 투명도 50%
- 컨트롤러 elements / generic 추가 
- Default 폰트 교체, 감성 멘트 폰트 추가
- CSS 스타일 수정 
  - 모달 투명도 50%
  - 반응형 수정 
  - 중복 스타일 제거
- javascript 추가
  - modal.js
- 슬라이더 제거
- includes/modal.jsp 추가

- signup 내부 버튼 사이즈 0.87rem -> **14px 고정**

  



## 문제점 

- ~~모달창 반응형 사이즈에 따라 위치가 변경되던 문제~~  : 해결 
- ~~모달 반응형에 따라 내부 컨텐츠 사이즈 문제~~ : 해결
- ~~회원가입 내부 간격 조절~~ : 완료 
- ~~width : 1680px 사이즈부터 모달 컨텐츠 늘어나는 문제~~: 해결
  - 템플릿에서 1680px 이상부터 모든 태그,이미지 등 사이즈와 간격이 전부 커짐.
- ~~다른 페이지에서 모달 동작 안하던 문제~~ : 해결 

- **signup :password 입력란 ••• 안보임  : 기본 폰트 수정으로 해결**

#### **ISSUE **

<span style="color: red;">**980px 이하 반응형 헤더 메뉴가 변경 되었을 때** 
**모달창 동작 불가능!!**</span>







---

##### 0.01a

- ~~MVC Model2 디자인 패턴~~ -> Spring MVC 프로젝트 변경 
