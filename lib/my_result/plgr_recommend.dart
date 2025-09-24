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
      // 앱 시작 화면을 DubaiRecommendationScreen으로 설정
      home: const DubaiRecommendationScreen(),
    );
  }
}

// --- 추천 여행지 상세 화면 (두바이) ---
class DubaiRecommendationScreen extends StatelessWidget {
  const DubaiRecommendationScreen({super.key});

  // 화면에 표시할 두바이 데이터
  final Map<String, dynamic> destinationData = const {
    "name": "아랍에미리트 두바이",
    // 두바이의 상징적인 야경 이미지로 변경
    "image": "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=2070&auto=format&fit=crop",
    "description": "세계 최고 수준의 럭셔리 호텔과 리조트\n프라이빗한 해변과 최고급 스파에서의 휴양\n함께 즐길 수 있는 요트 투어, 사막 사파리 투어",
    "touristSpotsTitle": "추천 관광지",
    "touristSpots": [
      "팜 주메이라",
      "부르즈 할리파",
      "두바이몰",
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
              fontSize: 41, // Figma 디자인 기준 폰트 크기
              fontWeight: FontWeight.w800,
              shadows: [Shadow(blurRadius: 10.0, color: Colors.black)],
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

