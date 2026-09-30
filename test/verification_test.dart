import 'package:ai_travel/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('30초가 지나야 재전송할 수 있고, 재전송하면 바로 00:30부터 다시 센다', (tester) async {
    await tester.pumpWidget(const VerificationCodeApp());
    final resend = find.widgetWithText(TextButton, '코드 다시 보내기');

    expect(find.text('00:30'), findsOneWidget);
    expect(tester.widget<TextButton>(resend).onPressed, isNull);

    await tester.pump(const Duration(seconds: 30));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('00:00'), findsOneWidget);
    expect(tester.widget<TextButton>(resend).onPressed, isNotNull);

    await tester.tap(resend);
    await tester.pump();
    // 이전에는 다음 초가 지나기 전까지 00:00과 활성화된 버튼이 그대로 보여서,
    // 한 번 더 누르면 타이머가 두 개 돌아 2초씩 줄어들었어요.
    expect(find.text('00:30'), findsOneWidget);
    expect(tester.widget<TextButton>(resend).onPressed, isNull);

    await tester.tap(resend, warnIfMissed: false);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('00:29'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });
}
