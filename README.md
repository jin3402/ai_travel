# AI Travel — 해외여행 가이드 앱 (팀 프로젝트 프론트엔드 화면)

여행 성향 테스트로 여행지를 추천하고 긴급 연락처·환율 같은 현지 정보를 보여주는 해외여행 가이드 앱의 Flutter 화면 프로토타입입니다. 마이크로스톤 팀 프로젝트에서 프론트엔드 화면 구현을 맡았습니다.

- 상태: 화면 단위 UI 프로토타입입니다. 화면끼리 이어지는 흐름, 성향 테스트 채점, 백엔드 연동은 이 저장소에 없습니다.
- 데이터는 코드 안의 목(mock) 데이터이고, 이미지는 Unsplash·Wikimedia 외부 URL을 씁니다.
- 결과 화면 4개(`lib/my_result/result_*.dart`)와 Q6 화면은 Figma-to-Code 플러그인으로 생성한 코드입니다(파일 안에 생성 표시가 있습니다).

## 화면

<img width="354" height="370" alt="Image" src="https://github.com/user-attachments/assets/db55a35b-936b-45b6-9084-277c95e82a35" />
<img width="172" height="372" alt="Image" src="https://github.com/user-attachments/assets/599c3ef6-889a-4b11-a7da-a6b9b6dc9b85" />
<img width="171" height="363" alt="Image" src="https://github.com/user-attachments/assets/3cbf3bc7-a2fe-4575-82d2-d5f51abce60b" />
<img width="169" height="368" alt="Image" src="https://github.com/user-attachments/assets/1e2c346a-39b0-443d-a59f-f79269c98a57" />
<img width="173" height="380" alt="Image" src="https://github.com/user-attachments/assets/aa1ceda1-cf15-47be-a2f8-de8efcd2d5dd" />
<img width="176" height="380" alt="Image" src="https://github.com/user-attachments/assets/50327349-8b3b-4078-9e79-6179ef9ba752" />

| 영역 | 화면 | 파일 |
|---|---|---|
| 계정 | 로그인, 회원가입(소셜 로그인 버튼 SVG), 비밀번호 찾기, 인증 코드 4칸 입력 + 30초 재전송 타이머, 비밀번호 재설정 | `lib/screens/` |
| 여행 성향 테스트 | Q3~Q7 질문 화면 (Q1·Q2 화면은 저장소에 없음) | `lib/screens/survey/` |
| 결과·추천 | 성향 결과 4종(JLGA·JRSC·PLGR·PRSA), 유형별 추천 여행지(인터라켄·교토·두바이·치앙마이) | `lib/my_result/` |
| 메인 | 즐겨찾기·추천 여행지 가로 목록(국기 오버레이), 여행지 상세(SliverAppBar) | `main_screen.dart`, `press_flag_button.dart` |
| 도구 | 긴급 연락처 카드, 환율 계산기 레이아웃 | `emergency.dart`, `currency_converter.dart` |

## 기술 스택

Flutter 3.35.2 (Dart 3.9), Material, `flutter_svg`, `http`, `flutter_test`

## 문제와 해결

**1. `flutter run`을 하면 여행 앱 화면이 하나도 보이지 않음**
화면마다 자기 `main()`과 `MaterialApp`을 가진 독립 파일로 만들었고, `lib/main.dart`는 팀 백엔드(Spring Boot) 연결을 확인하는 테스트 화면이었습니다. `main.dart`를 전체 화면 목록으로 바꾸고, 항목을 누르면 그 파일의 앱 위젯을 그대로 띄워 각 화면의 테마가 유지되게 했습니다. 파일별 단독 실행(`flutter run -t`)도 그대로 됩니다.
관련: `lib/catalog/screen_catalog.dart`, `lib/dev/server_check_screen.dart`

**2. 외부 이미지 로딩 실패 시 레이아웃 깨짐**
여행지 카드와 상세 화면 장소 목록의 `Image.network`에 `errorBuilder`를 두어, 이미지를 못 받으면 같은 크기의 회색 박스와 아이콘을 보여줍니다.
관련: `lib/screens/main_screen.dart`, `lib/screens/press_flag_button.dart`

**3. 인증 코드 재전송 타이머가 두 개 도는 문제**
재전송 직후 화면이 1초간 갱신되지 않아 버튼을 한 번 더 누를 수 있었고, 그러면 `Timer.periodic`이 두 개 돌아 2초씩 줄었습니다. 이전 타이머를 취소하고 `setState` 안에서 다시 시작하도록 고쳤습니다.
관련: `lib/screens/verification.dart`, `test/verification_test.dart`

**4. 좁은 화면에서 하단 링크 넘침**
모든 화면을 393×852 크기로 여는 위젯 테스트를 만들었더니 로그인·회원가입 하단의 "Don't have an account? Register Now" 같은 줄이 넘쳤습니다. 공간이 모자라면 줄바꿈되도록 `Wrap`으로 바꿨습니다.
관련: `test/widget_test.dart`

## 구조

```text
lib/
├── main.dart                 # 화면 목록 앱 실행
├── catalog/screen_catalog.dart
├── screens/                  # 계정, 메인, 상세, 긴급 연락처, 환율 계산기
│   └── survey/               # 여행 성향 테스트 Q3~Q7
├── my_result/                # 성향 결과(Figma 생성) + 유형별 추천 여행지
└── dev/server_check_screen.dart   # 백엔드 연결 확인
test/                         # 전 화면 스모크 테스트, 인증 타이머 테스트
```

## 실행

```bash
flutter pub get
flutter run                                # 화면 목록
flutter run -t lib/screens/login.dart      # 화면 하나만
flutter test
flutter analyze
```

환경변수는 없습니다. "백엔드 연결 확인" 화면은 `http://localhost:8080/api/hello`(Android 에뮬레이터는 `10.0.2.2`)로 요청하며, 팀 백엔드 코드는 이 저장소에 없습니다.

## 한계와 다음 단계

- 화면 사이 이동이 없습니다. 성향 테스트 답변 → 결과 유형 → 추천 여행지로 이어지는 흐름과 채점 로직을 만들어야 합니다.
- 성향 테스트 Q3~Q7은 거의 같은 코드를 질문만 바꿔 복사한 화면입니다. 질문 목록 데이터와 화면 하나로 합칠 수 있습니다.
- 결과 화면은 393×852 절대 좌표 레이아웃이라 다른 크기의 기기에서는 배치가 맞지 않을 수 있습니다.
- 화면에서 `Urbanist`, `Inter`, `Pretendard` 글꼴을 지정하지만 폰트 파일이 등록돼 있지 않아 기본 글꼴로 보입니다.
- 환율 계산기는 레이아웃만 있고 계산·그래프는 없습니다. 뒤로가기·메뉴 버튼 대부분은 동작이 없습니다.
