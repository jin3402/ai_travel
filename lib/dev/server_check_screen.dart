import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// 팀 백엔드(Spring Boot)의 `/api/hello`에 GET 요청을 보내 연결을 확인하는 개발용 화면.
///
/// Android 에뮬레이터에서는 호스트 PC의 localhost가 `10.0.2.2`로 보여서 주소를 나눠요.
class ServerCheckScreen extends StatefulWidget {
  const ServerCheckScreen({super.key, this.client});

  /// 테스트에서 가짜 클라이언트를 넣을 수 있게 열어 둬요.
  final http.Client? client;

  @override
  State<ServerCheckScreen> createState() => _ServerCheckScreenState();
}

String serverBaseUrl() {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    return 'http://10.0.2.2:8080';
  }
  return 'http://localhost:8080';
}

class _ServerCheckScreenState extends State<ServerCheckScreen> {
  String _message = '서버로부터 메시지를 기다리는 중...';

  Future<void> _fetchMessage() async {
    final client = widget.client ?? http.Client();
    String message;
    try {
      final response = await client
          .get(Uri.parse('${serverBaseUrl()}/api/hello'))
          .timeout(const Duration(seconds: 5));
      message = response.statusCode == 200
          ? response.body
          : '서버 연결 실패: ${response.statusCode}';
    } catch (e) {
      message = '오류 발생: $e';
    } finally {
      if (widget.client == null) client.close();
    }

    if (!mounted) return;
    setState(() => _message = message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter & Spring Boot')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchMessage,
              child: const Text('서버에 메시지 요청하기'),
            ),
          ],
        ),
      ),
    );
  }
}
