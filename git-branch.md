# Git Branch 사용 & 병합하기

![img](https://blog.kakaocdn.net/dn/5WVI1/btqKC959HKv/iNdTGEFKuFygShxWNTM4a1/img.jpg)

※ Branch란?

\- Software개발시 개발자들은 동일한 소스코드 위에서 신규 개발, 버그 수정 등의 업무를 협업하곤 한다. 이럴 때, 여러 개발자들이 동시에 다양한 작업을 할 수 있게 만들어 주는 기능이 "Branch" 이다.

즉, 브랜치(Branch)를 통해 하나의 프로젝트를 여러 갈래로 나누어서 관리할 수 있다. 각각의 독립된 Branch에서 마음대로 소스코드를 변경하여 작업 한 후 원래 버전과 비교하여 또 하나의 새로운 버전을 만들어 낼 수 있다.



---

## ➡ 1. Branch 확인 하기



#### 1) 현재 내가 위치한 Branch 확인

```
$ git branch
```

![img](https://blog.kakaocdn.net/dn/PfAlx/btq4XfAgp3P/qgu0nrJA2DYQ9KdS1jsFCk/img.png)

![img](https://blog.kakaocdn.net/dn/bHGd1F/btq4YKGybIR/NInypIbAwF528tFBNkDPbK/img.png)



\- 현재는 master 브랜치만 존재 한다. (master :최초 레포지토리 생성후 커밋하면 자동으로 생기는 브랜치)

\- \*가 붙어있는 브랜치가 현재 활성화된 브랜치이다.



```
$ git status
```

![img](https://blog.kakaocdn.net/dn/WjZRN/btq433SoNPt/quK0tnK2x7TQykhnvhsuJK/img.png)

\- On branch master > 마스터 브랜치 위에 있다.



#### 2) 원격 저장소의 Branch 확인

```
$ git branch -r
```

![img](https://blog.kakaocdn.net/dn/r0uRS/btq44bWYUwu/EaSQEzgRJDBxNTxS4mnEm1/img.png)



#### 3) 브랜치의 마지막 커밋 메세지 확인

```
$ git branch -v
```

![img](https://blog.kakaocdn.net/dn/bbjOAw/btqKxQT1Tsw/fumirxB2fUA4Q2kJjyYL0k/img.png)



---

## ➡ 2. Branch 생성 및 이동



#### 2.1 첫번째 방법



1) Branch 생성

```
git branch 브랜치명
```

2) 생성한 Branch로 이동하기

```
git checkout 브랜치명
```

![img](https://blog.kakaocdn.net/dn/c7W2UX/btq4XD8LZfL/muaQzdoDnKjT62YgiTetCk/img.png)



#### 2.2 두번째 방법



1) checkout 옵션 중 `-b`를 사용하여, 생성 후 바로 이동

`git checkout -b 브랜치명`

```
git checkout -b c
```

---

## ➡ 3. Branch 삭제



#### 1) git branch -d 브랜치명

```
$ git branch -d test
```

---

## ➡ 4. 생성한 Branch를 원격 저장소(Repository)에 푸쉬(Push)하기



#### 1) 생성한 Branch로 이동



`git checkout test`

-   현재 원격 저장소에는 master branch밖에 없는 상태이고, test branch로 이동하여 push를 그대로 한다면 오류가 발생한다.
-   로컬 레포지토리를 리모트 레포지토리로 처음 push할 때는 --set-upstream 옵션을 주어야 한다.
-   그래야 tracking 정보 설정이 되어 git push만 사용해도 푸쉬가 된다.

```
$ git push --set-upstream origin 브랜치명(test)
```

or

```
$ git push -u origin 브랜치명(test)
```

---

# Git Branch(2) - 브랜치 병합하기



## ➡ 1. Git Merge



#### 1) 신규 생성한 branch로 이동하기

`git checkout c`

`git branch`



#### 2) c 브랜치에서 다음과 같은 파일을 하나 생성한다.

파일명 : `test.txt`

command Line : `mkdir test.txt`

![img](https://blog.kakaocdn.net/dn/kY6vZ/btq4Yjbnduj/sq5Ua2EcMMGsjNM479esK1/img.png)



#### 3) 신규 txt 파일 커밋

`git add .`

`git status`

`git commit -m "add test txt"`

![img](https://blog.kakaocdn.net/dn/olxgy/btq4XXzC8BU/eCvdN9KcMImhkJnGf6CuAk/img.png)



 \- c 브랜치에 신규 txt 파일이 추가 되었고 충분히 테스트 되어 문제가 없다는 가정하에 master 브랜치에도 똑같은 txt 파일을 생성 하려 한다.
이때 내가 작성한 파일을 master branch로 이동하여 그대로 작성해도 되지만, merge 기능을 사용하여 c 브랜치에서 합칠 수 있다.



#### 4) master branch로 이동

`git checkout master`

`ll`

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> c
![img](https://blog.kakaocdn.net/dn/bEhtre/btq4ZgxZlas/asmiDIbvUsJHBKobWV1Yc1/img.png)



#### 5) c브랜치에서 작업하였던 파일을 master 브랜치로 병합 해본다.

command Line : `git merge 브랜치명`

```shell
git merge c
```

<<<<<<< HEAD
=======


>>>>>>> c
=======


-
>>>>>>> c
