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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// -- 화면에 표시할 샘플 데이터 --
const List<Map<String, String>> favoritePlaces = [
  {
    "image": "https://images.unsplash.com/photo-1542051841857-5f90071e7989?q=80&w=2070&auto=format&fit=crop",
    "title": "도쿄 (일본)",
    // --- 수정된 부분: 일본 국기 이미지 URL 추가 ---
    "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/320px-Flag_of_Japan.svg.png",
  },
  {
    "image": "https://images.unsplash.com/photo-1528181304800-259b08848526?q=80&w=2070&auto=format&fit=crop",
    "title": "방콕 (태국)",
    // --- 수정된 부분: 태국 국기 이미지 URL 추가 ---
    "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/320px-Flag_of_Thailand.svg.png",
  },
];

const List<Map<String, String>> recommendedPlaces = [
  {
    "image": "https://images.unsplash.com/photo-1513407030348-c983a97b98d8?q=80&w=2072&auto=format&fit=crop",
    "title": "도쿄타워"
  },
  {
    "image": "https://images.unsplash.com/photo-1712997230352-bed7a4c50ea9?fm=jpg&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdhdCUyMHBob3xlbnwwfHwwfHx8MA%3D%3D&ixlib=rb-4.1.0&q=60&w=3000",
    "title": "왓 포 사원"
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFab(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('메인화면'),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('KR', style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDestinationCard(),
            const SizedBox(height: 24),
            _buildHorizontalListSection('즐겨찾기', favoritePlaces),
            const SizedBox(height: 24),
            _buildHorizontalListSection('이런 여행지는 어떠세요?', recommendedPlaces),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDestinationCard() {
    return Card(
      elevation: 4,
      shadowColor: Colors.black38,
      color: const Color(0xFFF9F6FF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          children: [
            const Text(
              '여행지를 설정해주세요',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '클릭하여 여행 계획을 시작하세요',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('여행지 설정', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C2C2C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 수정된 부분: 국기 오버레이 기능 추가 ---
  Widget _buildHorizontalListSection(String title, List<Map<String, String>> places) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            itemBuilder: (context, index) {
              final place = places[index];
              // 국기 URL이 있는지 확인
              final bool hasFlag = place.containsKey('flag') && place['flag']!.isNotEmpty;

              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stack을 사용하여 이미지를 겹치게 함
                    Stack(
                      children: [
                        // 1. 배경 이미지
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            place['image']!,
                            height: 120,
                            width: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 120,
                                width: 150,
                                color: Colors.grey[200],
                                child: const Icon(Icons.broken_image, color: Colors.grey),
                              );
                            },
                          ),
                        ),
                        // 2. 국기 이미지 (조건부 표시)
                        if (hasFlag)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: Image.network(
                                  place['flag']!,
                                  width: 30,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      place['title']!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  // --- 수정 끝 ---

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.black,
      child: const Icon(Icons.add, color: Colors.white),
      shape: const CircleBorder(),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.call), label: '긴급 전화'),
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: '환율 계산기'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈 화면'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이 페이지'),
      ],
    );
  }
}

