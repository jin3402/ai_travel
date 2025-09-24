import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // 링크를 열려면 이 패키지가 필요합니다.

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Noto Sans KR', // 폰트 적용 (pubspec.yaml에 추가 필요)
      ),
      home: const TokyoTowerDetailScreen(),
    );
  }
}

// --- 도쿄 타워 상세 정보 화면 ---
class TokyoTowerDetailScreen extends StatelessWidget {
  const TokyoTowerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar (상단 바)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // TODO: 뒤로가기 로직 (Navigator.pop(context))
            print("뒤로가기 버튼 클릭");
          },
        ),
        title: const Text(
          '관광지 정보',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // 2. Body (본문 내용)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2-1. 제목
              const Text(
                '도쿄타워 (Tokyo Tower)',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // 2-2. 메인 이미지
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?q=80&w=2072&auto=format&fit=crop',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // 2-3. 설명
              const Text(
                '도쿄타워는 일본 도쿄의 상징적인 랜드마크로, 1958년 완공된 333m 높이의 철골 구조물입니다. 에펠탑을 모델로 한 디자인으로, 방송 송전탑으로 시작해 현재는 전망대와 관광 시설로 유명합니다.',
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              // 2-4. 구분선
              const Divider(height: 48, thickness: 1),
              // 2-5. 상세 정보 (아이콘과 함께 재구성)
              _buildInfoRow(
                Icons.location_on,
                '위치',
                '4-chome 2-8, Shibakoen, Minato 105-0011 Tokyo Prefecture',
              ),
              _buildInfoRow(
                Icons.confirmation_number,
                '가격',
                '메인 데크(150m) 성인 : 1500엔\n탑데크 투어(150m & 250m) : 3300엔 (웹 예약 기준)',
              ),
              _buildInfoRow(
                Icons.access_time,
                '운영시간',
                '09:00 ~ 22:30 (최종 입장은 종료 30분전까지)',
              ),
              _buildInfoRow(
                Icons.phone,
                '전화번호',
                '+81 3-3433-5111',
              ),
              _buildLinkRow(
                Icons.public,
                '홈페이지',
                'https://www.tokyotower.co.jp',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 상세 정보를 깔끔하게 보여주기 위한 헬퍼 위젯
  Widget _buildInfoRow(IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[600], size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // 클릭 가능한 링크를 보여주기 위한 헬퍼 위젯
  Widget _buildLinkRow(IconData icon, String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[600], size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    // url_launcher 패키지를 사용하면 실제 웹사이트로 이동 가능합니다.
                    // final Uri uri = Uri.parse(url);
                    // launchUrl(uri);
                    print('홈페이지 링크 클릭: $url');
                  },
                  child: Text(
                    url,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

