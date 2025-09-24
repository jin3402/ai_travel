import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

// 앱의 시작점
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // MyHomePage를 앱의 첫 화면으로 설정합니다.
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = '서버로부터 메시지를 기다리는 중...';

  // Mac(iOS 시뮬레이터, 웹 등)에서는 'localhost', 안드로이드 에뮬레이터에서는 '10.0.2.2'를 사용해야
  // 컴퓨터에서 실행 중인 스프링 부트 서버에 접속할 수 있습니다.
  final String _baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080';

  // 서버에 데이터를 요청하는 함수
  Future<void> _fetchMessage() async {
    try {
      // 스프링 부트 서버의 /api/hello 주소로 GET 요청을 보냅니다.
      final response = await http.get(Uri.parse('$_baseUrl/api/hello'));

      // 응답이 성공적이면 (상태 코드 200)
      if (response.statusCode == 200) {
        setState(() {
          // 화면에 표시될 _message 변수의 값을 서버가 보낸 메시지로 변경합니다.
          _message = response.body;
        });
      } else {
        // 서버 연결에 실패한 경우
        setState(() {
          _message = '서버 연결 실패: ${response.statusCode}';
        });
      }
    } catch (e) {
      // 그 외 오류가 발생한 경우
      setState(() {
        _message = '오류 발생: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter & Spring Boot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 서버로부터 받은 메시지를 표시하는 텍스트 위젯
            Text(
              _message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // 버튼을 누르면 _fetchMessage 함수가 실행됩니다.
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
