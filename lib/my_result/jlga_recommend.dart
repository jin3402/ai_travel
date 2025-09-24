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
      home: const InterlakenRecommendationScreen(),
    );
  }
}

// --- 추천 여행지 상세 화면 (인터라켄) ---
class InterlakenRecommendationScreen extends StatelessWidget {
  const InterlakenRecommendationScreen({super.key});

  // 화면에 표시할 데이터
  final Map<String, dynamic> destinationData = const {
    "name": "스위스 인터라켄",
    "image": "https://images.unsplash.com/photo-1519681393784-d120267933ba?q=80&w=2070&auto=format&fit=crop",
    "description": "세계적으로 유명한 럭셔리 호텔과 레스토랑\n알프스 산맥에서 즐기는 패러글라이딩\n푸른 초원 위를 달리는 하이킹 코스",
    "touristSpotsTitle": "추천 관광지",
    "touristSpots": [
      "융프라우",
      "피르스트",
      "하더 클룸",
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 투명한 AppBar와 뒤로가기 버튼
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
            // TODO: 뒤로가기 로직 (필요 시 Navigator.pop(context) 사용)
            print("뒤로가기 버튼 클릭");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. 배경 이미지와 제목이 포함된 헤더
            _buildHeaderImage(),
            // 3. 여행 정보 및 추천 관광지
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
        // 배경 이미지
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
        // 이미지 위에 어두운 오버레이 추가
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        // 여행지 이름 텍스트
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            destinationData['name']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFD2FDE5), // Figma 디자인의 텍스트 색상 적용
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
        // Card를 사용하여 UI에 입체감 추가
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: spots.map((spot) {
              // ListTile을 사용하여 아이콘과 텍스트를 깔끔하게 정렬
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

