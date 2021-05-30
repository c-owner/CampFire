# commit🌱

`해야할 일`

```

```

**이슈 발견**



---





## 2021-05-30🌨 v0.01c-alpha - by corner

- 메뉴 헤더 목록 변경 
- smallNav (계정) 메뉴 수정 
- 헤더 사이즈 변경
- header 인라인 style들 정리
- 캠핑 리뷰 게시판 초안 레이아웃 (샘플)





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
