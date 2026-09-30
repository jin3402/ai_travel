import 'package:ai_travel/catalog/screen_catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_image_http_client.dart';

/// 목표 기기 크기(393×852, 결과 화면을 디자인한 Figma 프레임 크기)로 맞춰요.
void usePhoneViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(393 * 3, 852 * 3);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

/// 테스트 본문 동안만 `Image.network`가 가짜 클라이언트를 쓰게 해요.
/// (flutter_test는 테스트가 끝날 때 painting 디버그 변수가 원래대로인지 검사해요)
Future<void> withFakeNetworkImages(Future<void> Function() body) async {
  debugNetworkImageHttpClientProvider = FakeImageHttpClient.new;
  try {
    await body();
  } finally {
    debugNetworkImageHttpClientProvider = null;
  }
}

void main() {
  testWidgets('앱을 실행하면 화면 목록이 나온다', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(const AiTravelPrototypeApp());

    expect(find.text('AI Travel 화면 모음'), findsOneWidget);
    expect(find.text('로그인'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('백엔드 연결 확인'), 300);
    expect(find.text('백엔드 연결 확인'), findsOneWidget);
  });

  final entries = [for (final section in catalogSections) ...section.entries];

  test('목록의 화면 제목은 서로 겹치지 않는다', () {
    final titles = entries.map((entry) => entry.title).toList();
    expect(titles.toSet().length, titles.length);
  });

  for (final entry in entries) {
    testWidgets('${entry.title}(lib/${entry.file}) 화면이 목록에서 오류 없이 열린다', (tester) async {
      usePhoneViewport(tester);
      await withFakeNetworkImages(() async {
        await tester.pumpWidget(const AiTravelPrototypeApp());

        final tile = find.widgetWithText(ListTile, entry.title);
        await tester.scrollUntilVisible(tile, 300);
        await tester.tap(tile);
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        // 상단 바 제목 + 목록에 남아 있는 항목
        expect(find.text(entry.title), findsWidgets);

        // 화면을 치워서 타이머 같은 자원이 정리되게 해요.
        await tester.pumpWidget(const SizedBox());
      });
    });
  }
}
