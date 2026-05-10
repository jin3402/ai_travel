# ✈️ AI_TRAVEL (스마트 해외여행 가이드 앱) -마이크로스톤 팀프로젝트-

> **"사용자의 여행 성향 분석부터 필수 정보 제공까지, 매끄러운 사용자 경험(UX)에 집중한 크로스 플랫폼 프로젝트입니다."**

<br>

## 🙋‍♂️ My Role & Contribution
**Front-End Development (프론트엔드 UI/UX 구현 및 아키텍처 설계)**
* 기획 및 디자인 요구사항을 바탕으로 Flutter 기반의 모바일 앱 전체 화면(UI) 및 인터랙션 구현
* 기능 단위의 위젯(Widget) 모듈화를 통한 코드 재사용성 및 가독성 향상
* 외부 데이터 로딩 에러 및 화면 깨짐을 방지하는 방어적 UI(Defensive UI) 설계

<br>

## 📱 Screen Preview
<img width="354" height="370" alt="Image" src="https://github.com/user-attachments/assets/db55a35b-936b-45b6-9084-277c95e82a35" />
<img width="172" height="372" alt="Image" src="https://github.com/user-attachments/assets/599c3ef6-889a-4b11-a7da-a6b9b6dc9b85" />
<img width="171" height="363" alt="Image" src="https://github.com/user-attachments/assets/3cbf3bc7-a2fe-4575-82d2-d5f51abce60b" />
<img width="169" height="368" alt="Image" src="https://github.com/user-attachments/assets/1e2c346a-39b0-443d-a59f-f79269c98a57" />
<img width="173" height="380" alt="Image" src="https://github.com/user-attachments/assets/aa1ceda1-cf15-47be-a2f8-de8efcd2d5dd" />
<img width="176" height="380" alt="Image" src="https://github.com/user-attachments/assets/50327349-8b3b-4078-9e79-6179ef9ba752" />

<br>

## ✨ UI/UX Implementation (주요 프론트엔드 구현 내용)

* **📝 사용자 참여형 인터랙티브 UI (여행 성향 테스트)**
  * 7단계의 MBTI 스타일 테스트 화면을 상태 관리(State)를 통해 매끄럽게 전환되도록 구현했습니다.
  * 테스트 결과에 따른 동적 UI 렌더링을 통해 맞춤형 여행지 결과를 직관적으로 시각화했습니다.

* **🗺️ 시각적 계층을 고려한 여행지 대시보드**
  * `ListView`를 활용하여 가로 스크롤 기반의 부드러운 목적지 탐색 경험을 제공합니다.
  * `Stack` 위젯을 사용해 여행지 배경 이미지 위에 해당 국가의 국기(SVG/PNG)를 오버레이하여 시각적 직관성을 높였습니다.
  * 국가별 상세 페이지 내 날씨, 시간, 관광지 리스트를 정보의 중요도에 따라 컴포넌트화하여 배치했습니다.

* **💱 데이터 가독성을 높인 정보 뷰어 (환율/긴급연락망)**
  * 다양한 국가의 환율 정보와 통화 기호를 사용자가 한눈에 읽기 쉽도록 Grid/List 형태로 깔끔하게 정렬했습니다.
  * 위급 상황 시 당황하지 않고 직관적으로 누를 수 있도록 하단 네비게이션(BottomNavigationBar)과 큼직한 버튼 위주로 긴급 연락망 화면을 설계했습니다.

<br>

## 🛠 Front-End Tech Stack

* **Framework:** Flutter (Dart >= 3.2.3)
* **UI Components:** Material 3 Design
* figma

<br>

## 🏗 Front-End Highlights (개발 주안점)

**1. 위젯 모듈화를 통한 유지보수성 극대화**
* 복잡한 화면 구조를 단일 `build` 메서드에 작성하지 않고, `_buildAppBar`, `_buildDestinationCard`, `_buildHorizontalListSection` 등 논리적인 기능 단위로 분리했습니다. 이를 통해 코드의 가독성을 높이고 추후 다른 화면에서도 쉽게 재사용할 수 있는 구조를 만들었습니다.

**2. 에러 핸들링을 통한 방어적 UI (Defensive UI) 설계**
* 네트워크 지연이나 잘못된 URL로 인해 외부 이미지 로딩에 실패할 경우, 화면에 에러가 노출되거나 레이아웃이 깨지지 않도록 `Image.network`의 `errorBuilder`를 활용했습니다. 로딩 실패 시 플레이스홀더(대체 아이콘 및 회색 박스)를 띄워 사용자 경험(UX)이 저하되는 것을 방지했습니다.

**3. API 연동을 대비한 동적 렌더링 구조**
* 현재는 프론트엔드 검증을 위해 Mock Data를 사용하고 있으나, 향후 백엔드 개발자와의 협업 및 실제 API 연동이 즉시 가능하도록 데이터를 `List<Map<String, String>>` 구조로 캡슐화하여 `ListView.builder`에 연결했습니다.
