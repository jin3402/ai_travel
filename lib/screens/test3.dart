import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              const Spacer(flex: 2), 
              _buildQuestion(),
              const SizedBox(height: 40),
              _buildAnswerOptions(),
              const Spacer(flex: 3),
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
        // 아이콘 버튼으로 상호작용 추가
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            // 뒤로가기 로직
          },
        ),
        const Text(
          '여행 성향 테스트',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey),
          onPressed: () {
            // 메뉴 로직
          },
        ),
      ],
    );
  }

  // 2. 진행 상태 (Q3, 진행 바, 3/7)
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
            // Expanded를 사용해 남은 공간을 모두 차지하도록 함
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
        // 공통된 스타일의 버튼을 함수로 만들어 재사용
        _buildAnswerButton('가성비를 따져서 알뜰하게'),
        const SizedBox(height: 24),
        _buildAnswerButton('돈을 좀 쓰더라도\n하고 싶은 건 다 한다!'),
      ],
    );
  }

  Widget _buildAnswerButton(String text) {
    return SizedBox(
      width: double.infinity, // 너비를 최대로 설정
      child: ElevatedButton(
        onPressed: () {
          // 답변 선택 시 로직
          print('$text 선택!');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC3E0FC), // 배경색
          foregroundColor: Colors.black, // 글자색
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2, // 그림자 효과
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.5, // 줄 간격
          ),
        ),
      ),
    );
  }
}