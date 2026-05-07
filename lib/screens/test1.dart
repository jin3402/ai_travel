import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        ),
      ),
      home: const SurveyScreen(),
    );
  }
}

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final int currentQuestion = 3;
  final int totalQuestions = 7;
  final double progress = 0.29; // 29%

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 40),
              _buildProgress(),
              
              const Spacer(flex: 1), // 콘텐츠를 위에서 밀어내는 역할
              _buildQuestion(),
              const SizedBox(height: 40), // 질문과 답변 사이의 고정 간격
              _buildAnswerOptions(),
              const Spacer(flex: 2), // 콘텐츠를 아래에서 밀어올려 중앙에 오도록 함
              // --- 수정 끝 ---
            ],
          ),
        ),
      ),
    );
  }

  // 1. 헤더 (뒤로가기, 타이틀, 메뉴)
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            // TODO: 뒤로가기 로직 구현
            print('뒤로가기 버튼 클릭됨');
          },
        ),
        const Text(
          '여행 성향 테스트',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey),
          onPressed: () {
            // TODO: 메뉴 로직 구현
            print('메뉴 버튼 클릭됨');
          },
        ),
      ],
    );
  }

  // 2. 진행 상태 (질문 번호, 진행 바, 전체 질문 수)
  Widget _buildProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Q$currentQuestion.',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFB0BDF2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                '$currentQuestion / $totalQuestions',
                style: const TextStyle(
                  color: Color(0xFF393232),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 18,
                  backgroundColor: const Color(0xFFD9D9D9),
                  color: const Color(0xFFA791E7),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  // 3. 질문 텍스트
  Widget _buildQuestion() {
    return const Center(
      child: Text(
        '나의 지출 스타일은?',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // 4. 답변 선택지 버튼들
  Widget _buildAnswerOptions() {
    return Column(
      children: [
        _buildAnswerButton('가성비를 따져서 알뜰하게'),
        const SizedBox(height: 24),
        _buildAnswerButton('돈을 좀 쓰더라도\n하고 싶은 건 다 한다!'),
      ],
    );
  }

  Widget _buildAnswerButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: 답변 선택 시 로직 구현 (다음 질문으로 넘어가기 등)
          print('$text 선택!');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC3E0FC),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

