## 첫번째 프로젝트

첫번째 프로젝트에 대해 진행한 업무들과 제 생각들을 나름대로 정리해본 공간입니다.

웹 개발자로써, 처음으로 만든 프로젝트다 보니 많은 시행착오도 겪었지만 참 몰입감있게 작업을 진행했던것 같습니다.

이 과정에서 팀원들과 서로 소통하며, 서로의 고생했던 것들이 결합되어 최종 완성물이 나왔을때 완벽하진 않지만, 뿌듯한 기억이 납니다.

일기처럼 편안하게 봐주시면 좋을거 같습니다.

<br/>

![image](https://github.com/user-attachments/assets/270486cf-e687-4137-86ed-ae8fe48c428e)

**프로젝트 기간** : 2024.06.21 ~ 2024.06.27

**참여인원** : 5명

**프로젝트 개요** : 보드게임에 대한 정보를 한 공간에서 볼 수 있게 만들어보자!
<br/>

> 보드밍이라는 타이틀은 뭉글뭉글한 느낌을 주어, 모든연령층과 남녀노소 상관없이 진입할 수 있는 사이트임을 명시하고 싶어서 제작한 명칭입니다.
> 아무래도, 제가 실내인테리어를 통해서 경험한 디자인 업무들을 바탕으로 아이콘과 로고를 제작했습니다.

<br/><br/>
## 메인 화면

> **해당 화면에서 진행한 업무** : 헤더 구성 및 ui, 레이아웃 작업 / 디자인 작업 / 검색 기능 구현 / 로그인 및 회원가입 전반적인 회원 DB 작업 / 로그인 기능 구현 / 회원가입 기능 구현 / 프로필 사이드 메뉴 기능 구현 / 로그인 시 ‘회원’ , ‘관리자’ session 별 기능 변환 구현 / 슬라이딩 배너 구현 / 디자인 및 레이아웃 ui 구현 / 카테고리 별 서브페이지 링크 아이콘으로 호버 기능 구현 및 디자인 / 반응형으로 사이즈에 맞게 웹 제작

> 이 공간은 사이트의 간판인 첫 화면이기도 하구, 최대한 밝고 색감있게 구성하고 싶었습니다. 이 메인에서 작업한 핵심적인 주요기능은, 아래와 같습니다.

![image](https://github.com/user-attachments/assets/d485ebcd-0bb9-4f93-a831-6dcc7caeb2d5)

<br/><br/>




<br/>

### 검색 자동완성 기능

> (jQuery를 통한 비동기로 서버에서 자동완성 데이터를 가져오는 것에서 버전 충돌이 일어나서 정말 이걸 해결하느라 몹시 고생했던 기억이 나네요 ㅋㅋ..)
> 해당 자동완성 기능은 데이터베이스에 저장되어있는 모든 보드게임의 정보를 담고 있으며, 검색을 통하여 검색결과 -> 해당 상품의 상세페이지로 이동할 수 있습니다.

![image](https://github.com/user-attachments/assets/c032f577-6fb1-492f-885d-329542fd4cae)

> 회원가입 옆 정보 아이콘을 누르면 나오는 항목

![image](https://github.com/user-attachments/assets/06cb8cd4-a6bc-4d79-adaf-8aacb78dd610)


<br/><br/>

### 세션별로 변경되는 항목들

> 처음 배웠을때 서버에서 session을 가져와서 작업할 수 있다는 것이 참 신기하고 활용하는게 흥미로웠습니다.

![image](https://github.com/user-attachments/assets/77f72908-807f-4566-aa30-bfd21157d5df)

<br/><br/>

## 회원가입 페이지

> user와 관련된 회원가입과 로그인, 수정, 탈퇴등의 업무를 전담했습니다.

![image](https://github.com/user-attachments/assets/4775f3ff-84d7-48ff-9b86-c2da1643af35)

<br/><br/>

## 로그인 페이지

> 백그라운드에서 보드게임 관련 동영상이 재생이 됩니다.

![image](https://github.com/user-attachments/assets/503597b7-a3b1-44ce-a53d-1dcbc33dd6af)

![image](https://github.com/user-attachments/assets/f4cf889c-f887-4e4e-8678-62854b920041)

<br/><br/>

### 유저 데이터 베이스

> 로그인 화면에서는 아이디와 비밀번호에 대한 검증이 이루어집니다. 해당 유저 데이터베이스에서 정보를 매치시켜서, 올바른 정보값인지 판단합니다. 해당 데이터베이스는 Oracle을 활용했습니다.

![image](https://github.com/user-attachments/assets/a08a6398-87cb-45ed-b444-b1fea3f1970e)

<br/><br/>

## 관리자 페이지

> 회원등급이 관리자인 경우에는 회원 관리 페이지에서 회원의 정보를 수정 및 삭제할 수 있습니다.

![image](https://github.com/user-attachments/assets/e03ba3e8-9985-4e8b-bf7f-edd2e88f13e8)

<br/><br/>

## 회원수정

> 관리자는 모든 회원을 수정 가능하며, 회원은 메인 홈페이지에서 내 정보를 누르면 수정이 가능해집니다.

![image](https://github.com/user-attachments/assets/6c20710a-5097-4f0d-a053-5cbb2301b964)

<br/><br/>

## 검색 기능

> 검색 기능을 활용하여, 해당 검색결과의 보드게임이 조회가 가능합니다.

![image](https://github.com/user-attachments/assets/c49b91bf-ea47-4b6c-ba6f-74644d2f5798)

<br/><br/>

## 상세 페이지

> 해당 보드게임의 상세 페이지 입니다.

![image](https://github.com/user-attachments/assets/dedb2100-7941-4f1d-85e5-b019fb497224)

<br/><br/>

## 상세 페이지 내부

> 보드게임 상세 페이지 내부에서는 해당 보드게임의 플레이 방법 관련 영상과 보드게임의 테마, 내용물등을 확인하실 수 있습니다.

![image](https://github.com/user-attachments/assets/38b8c716-76a3-429d-825b-87a37496fd57)
