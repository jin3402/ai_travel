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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter', // 폰트 적용 (pubspec.yaml에 추가 필요)
      ),
      // 앱 시작 화면을 KyotoRecommendationScreen으로 설정
      home: const KyotoRecommendationScreen(),
    );
  }
}

// --- 추천 여행지 상세 화면 (교토) ---
class KyotoRecommendationScreen extends StatelessWidget {
  const KyotoRecommendationScreen({super.key});

  // 화면에 표시할 교토 데이터
  final Map<String, dynamic> destinationData = const {
    "name": "일본 교토",
    // 교토의 상징적인 후시미 이나리 신사 이미지로 변경
    "image": "https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=2070&auto=format&fit=crop",
    "description": "혼자 여유롭게 즐기기 좋은 사찰 및 신사\n저렴한 입장료, 대중교통비로 실속 있는 여행 계획에 적합\n잘 보존된 문화유산과 고즈넉한 분위기",
    "touristSpotsTitle": "추천 관광지",
    "touristSpots": [
      "기요미즈데라 (청수사)",
      "후시미 이나리 신사",
      "아라시야마 대나무 숲",
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: Colors.white70,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            print("뒤로가기 버튼 클릭");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '여행 정보',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    destinationData['description']!,
                    style: const TextStyle(fontSize: 16, height: 1.7, color: Colors.black87),
                  ),
                  const SizedBox(height: 32),
                  _buildTouristSpots(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          destinationData['image']!,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 300,
              color: Colors.grey,
              child: const Center(child: Icon(Icons.image_not_supported, color: Colors.white)),
            );
          },
        ),
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            destinationData['name']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
              shadows: [Shadow(blurRadius: 4, color: Colors.black54, offset: Offset(0, 4))],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTouristSpots() {
    final spots = destinationData['touristSpots'] as List<String>;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          destinationData['touristSpotsTitle']!,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: spots.map((spot) {
              return ListTile(
                leading: const Icon(Icons.location_on, color: Color(0xFFA791E7)),
                title: Text(spot, style: const TextStyle(fontSize: 16)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

