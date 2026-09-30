import 'package:flutter/material.dart';

import '../dev/server_check_screen.dart';
import '../my_result/jlga_recommend.dart' as jlga_recommend;
import '../my_result/jrsc_recommend.dart' as jrsc_recommend;
import '../my_result/plgr_recommend.dart' as plgr_recommend;
import '../my_result/prsa_recommend.dart' as prsa_recommend;
import '../my_result/result_jlga.dart' as result_jlga;
import '../my_result/result_jrsc.dart' as result_jrsc;
import '../my_result/result_plgr.dart' as result_plgr;
import '../my_result/result_prsa.dart' as result_prsa;
import '../screens/create_account.dart' as create_account;
import '../screens/currency_converter.dart' as currency_converter;
import '../screens/emergency.dart' as emergency;
import '../screens/forgetpwd.dart' as forgetpwd;
import '../screens/login.dart' as login;
import '../screens/main_screen.dart' as main_screen;
import '../screens/press_flag_button.dart' as press_flag_button;
import '../screens/resetpwd.dart' as resetpwd;
import '../screens/survey/survey_q3.dart' as survey_q3;
import '../screens/survey/survey_q4.dart' as survey_q4;
import '../screens/survey/survey_q5.dart' as survey_q5;
import '../screens/survey/survey_q6.dart' as survey_q6;
import '../screens/survey/survey_q7.dart' as survey_q7;
import '../screens/tokyo_tower_detail.dart' as tokyo_tower_detail;
import '../screens/verification.dart' as verification;

class CatalogEntry {
  const CatalogEntry(this.title, this.file, this.builder);

  final String title;

  /// `flutter run -t lib/<file>`로 이 화면만 따로 실행할 수 있어요.
  final String file;
  final WidgetBuilder builder;
}

class CatalogSection {
  const CatalogSection(this.title, this.entries);

  final String title;
  final List<CatalogEntry> entries;
}

/// 저장소의 화면 프로토타입 목록.
/// 각 파일은 자기 테마를 가진 독립 앱이라, 테마까지 그대로 보이도록 앱 위젯째로 띄워요.
final List<CatalogSection> catalogSections = [
  CatalogSection('계정', [
    CatalogEntry('로그인', 'screens/login.dart', (_) => const login.AuthApp()),
    CatalogEntry(
      '회원가입',
      'screens/create_account.dart',
      (_) => const create_account.AuthApp(),
    ),
    CatalogEntry(
      '비밀번호 찾기',
      'screens/forgetpwd.dart',
      (_) => const forgetpwd.ForgotPasswordApp(),
    ),
    CatalogEntry(
      '인증 코드 입력',
      'screens/verification.dart',
      (_) => const verification.VerificationCodeApp(),
    ),
    CatalogEntry(
      '비밀번호 재설정',
      'screens/resetpwd.dart',
      (_) => const resetpwd.ResetPasswordApp(),
    ),
  ]),
  CatalogSection('여행 성향 테스트 (Q3~Q7)', [
    CatalogEntry(
      'Q3 지출 스타일',
      'screens/survey/survey_q3.dart',
      (_) => const survey_q3.TravelApp(),
    ),
    CatalogEntry(
      'Q4 숙소 기준',
      'screens/survey/survey_q4.dart',
      (_) => const survey_q4.TravelApp(),
    ),
    CatalogEntry(
      'Q5 여행 스타일',
      'screens/survey/survey_q5.dart',
      (_) => const survey_q5.TravelApp(),
    ),
    CatalogEntry(
      'Q6 여행 메이트',
      'screens/survey/survey_q6.dart',
      (_) => const survey_q6.FigmaToCodeApp(),
    ),
    CatalogEntry(
      'Q7 뜻밖의 상황',
      'screens/survey/survey_q7.dart',
      (_) => const survey_q7.TravelApp(),
    ),
  ]),
  CatalogSection('성향 결과', [
    CatalogEntry(
      '결과 JLGA',
      'my_result/result_jlga.dart',
      (_) => const result_jlga.FigmaToCodeApp(),
    ),
    CatalogEntry(
      '결과 JRSC',
      'my_result/result_jrsc.dart',
      (_) => const result_jrsc.FigmaToCodeApp(),
    ),
    CatalogEntry(
      '결과 PLGR',
      'my_result/result_plgr.dart',
      (_) => const result_plgr.FigmaToCodeApp(),
    ),
    CatalogEntry(
      '결과 PRSA',
      'my_result/result_prsa.dart',
      (_) => const result_prsa.FigmaToCodeApp(),
    ),
  ]),
  CatalogSection('추천 여행지', [
    CatalogEntry(
      '인터라켄 (JLGA)',
      'my_result/jlga_recommend.dart',
      (_) => const jlga_recommend.TravelApp(),
    ),
    CatalogEntry(
      '교토 (JRSC)',
      'my_result/jrsc_recommend.dart',
      (_) => const jrsc_recommend.TravelApp(),
    ),
    CatalogEntry(
      '두바이 (PLGR)',
      'my_result/plgr_recommend.dart',
      (_) => const plgr_recommend.TravelApp(),
    ),
    CatalogEntry(
      '치앙마이 (PRSA)',
      'my_result/prsa_recommend.dart',
      (_) => const prsa_recommend.TravelApp(),
    ),
  ]),
  CatalogSection('메인·여행지', [
    CatalogEntry(
      '메인 화면 (국기 표시)',
      'screens/main_screen.dart',
      (_) => const main_screen.TravelApp(),
    ),
    CatalogEntry(
      '메인 → 여행지 상세',
      'screens/press_flag_button.dart',
      (_) => const press_flag_button.TravelApp(),
    ),
    CatalogEntry(
      '도쿄타워 상세',
      'screens/tokyo_tower_detail.dart',
      (_) => const tokyo_tower_detail.TravelApp(),
    ),
  ]),
  CatalogSection('도구', [
    CatalogEntry(
      '긴급 연락처',
      'screens/emergency.dart',
      (_) => const emergency.EmergencyContactApp(),
    ),
    CatalogEntry(
      '환율 계산기',
      'screens/currency_converter.dart',
      (_) => const currency_converter.CurrencyConverterApp(),
    ),
    CatalogEntry(
      '백엔드 연결 확인',
      'dev/server_check_screen.dart',
      (_) => const ServerCheckScreen(),
    ),
  ]),
];

class AiTravelPrototypeApp extends StatelessWidget {
  const AiTravelPrototypeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Travel 화면 모음',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScreenCatalogPage(),
    );
  }
}

class ScreenCatalogPage extends StatelessWidget {
  const ScreenCatalogPage({super.key});

  void _open(BuildContext context, CatalogEntry entry) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(entry.title)),
          // 각 화면이 자기 MaterialApp을 가지고 있어서, 상단 여백이 두 번 들어가지 않게 해요.
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: entry.builder(context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Travel 화면 모음')),
      body: ListView(
        children: [
          for (final section in catalogSections) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
              child: Text(
                section.title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            for (final entry in section.entries)
              ListTile(
                title: Text(entry.title),
                subtitle: Text('lib/${entry.file}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _open(context, entry),
              ),
          ],
        ],
      ),
    );
  }
}
