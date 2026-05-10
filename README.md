# ✈️ AI_TRAVEL (스마트 해외여행 가이드 앱) -마이크로스톤 팀프로젝트-

> **"사용자의 여행 성향을 분석하고 필요한 현지 정보를 제공하는 크로스 플랫폼 애플리케이션입니다."**

<br>

## 🙋‍♂️ My Role & Contribution
**Front-End Development **
-Flutter를 활용한 모바일 앱 전체 화면(UI) 및 인터랙션 구현
-위젯(Widget) 모듈화를 통한 코드 재사용성 및 가독성 개선
-데이터 로딩 실패를 대비한 예외 처리 및 방어적 UI(Defensive UI) 설계
<br>

## 📱 Screen Preview
<img width="354" height="370" alt="Image" src="https://github.com/user-attachments/assets/db55a35b-936b-45b6-9084-277c95e82a35" />
<img width="172" height="372" alt="Image" src="https://github.com/user-attachments/assets/599c3ef6-889a-4b11-a7da-a6b9b6dc9b85" />
<img width="171" height="363" alt="Image" src="https://github.com/user-attachments/assets/3cbf3bc7-a2fe-4575-82d2-d5f51abce60b" />
<img width="169" height="368" alt="Image" src="https://github.com/user-attachments/assets/1e2c346a-39b0-443d-a59f-f79269c98a57" />
<img width="173" height="380" alt="Image" src="https://github.com/user-attachments/assets/aa1ceda1-cf15-47be-a2f8-de8efcd2d5dd" />
<img width="176" height="380" alt="Image" src="https://github.com/user-attachments/assets/50327349-8b3b-4078-9e79-6179ef9ba752" />

<br>
UI/UX Implementation
📝 성향 테스트 UI

7단계의 테스트 화면을 상태 관리(State)를 통해 전환되도록 구현했습니다.

테스트 결과 데이터에 맞춰 추천 여행지 화면이 동적으로 렌더링되도록 구성했습니다.

🗺️ 여행지 대시보드

수평 스크롤(ListView)을 활용해 제한된 화면 내에서 여러 목적지를 탐색할 수 있도록 구성했습니다.

Stack 위젯으로 배경 이미지 위에 국기와 텍스트를 겹쳐 배치해 공간 효율을 높였습니다.

상세 페이지 내 날씨, 시간, 관광지 리스트 등 각 정보 영역을 개별 컴포넌트로 분리하여 배치했습니다.

<br>

🛠 Front-End Tech Stack
Framework: Flutter (Dart >= 3.2.3)

UI Components: Material 3 Design

Design Tool: Figma
<br>

🏗 Front-End Highlights (개발 주안점)
1. 위젯 모듈화
화면 전체를 단일 build 메서드에 작성하지 않고, _buildAppBar, _buildDestinationCard 등 논리적인 기능 단위로 분리했습니다. 이를 통해 코드 가독성을 높이고 컴포넌트 재사용성을 개선했습니다.

2. 예외 처리 (Defensive UI)
네트워크 문제나 잘못된 URL로 인해 외부 이미지 로딩에 실패할 경우 레이아웃이 깨지지 않도록 Image.network의 errorBuilder를 적용했습니다. 로딩 실패 시 플레이스홀더(대체 아이콘 및 회색 박스)를 띄우도록 처리했습니다.

3. 데이터 구조 캡슐화
추후 실제 API 연동을 고려하여 프론트엔드 단에서 데이터 구조를 규격화했습니다. 현재 화면 검증을 위한 Mock Data를 List<Map> 형태로 캡슐화하고 ListView.builder와 연결하여, 실제 데이터 연동 시 즉각적인 교체가 가능하도록 설계했습니다.
