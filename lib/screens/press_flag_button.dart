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

// --- 샘플 데이터 ---
const Map<String, dynamic> tokyoData = {
  "name": "도쿄 (Tokyo)",
  "image": "https://images.unsplash.com/photo-1542051841857-5f90071e7989?q=80&w=2070&auto=format&fit=crop",
  "description": "도쿄는 일본의 수도이자 문화, 경제, 정치의 중심지로, 고대와 현대가 조화를 이루는 도시입니다.\n\n추천 여행 시기: 5~6월, 10월~11월\n항공: 2시간 15분 소요 (도쿄 NRT기준)",
  "popularPlaces": [
     {
      "image": "https://images.unsplash.com/photo-1513407030348-c983a97b98d8?q=80&w=2072&auto=format&fit=crop",
      "title": "도쿄타워"
    },
    {
      "image": "https://images.unsplash.com/photo-1548651429-a4b5a26a3a4c?q=80&w=1964&auto=format&fit=crop",
      "title": "시부야 스카이"
    },
  ]
};

const Map<String, dynamic> bangkokData = {
   "name": "방콕 (Bangkok)",
  "image": "https://images.unsplash.com/photo-1528181304800-259b08848526?q=80&w=2070&auto=format&fit=crop",
  "description": "방콕은 태국의 수도로, 화려한 사원과 활기찬 거리, 맛있는 음식으로 유명한 매력적인 도시입니다.\n\n추천 여행 시기: 11월~2월\n항공: 5시간 30분 소요",
   "popularPlaces": [
    {
      "image": "https://images.unsplash.com/photo-1596531842813-d1672ce9a31a?q=80&w=1974&auto=format&fit=crop",
      "title": "왓 포 사원"
    },
     {
      "image": "https://images.unsplash.com/photo-1563492065599-3520f775ee09?q=80&w=1974&auto=format&fit=crop",
      "title": "왕궁"
    },
  ]
};

const List<Map<String, dynamic>> favoritePlaces = [tokyoData, bangkokData];
const List<Map<String, dynamic>> recommendedPlaces = [tokyoData, bangkokData];


// --- 홈 화면 ---
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
  
  // 홈 화면 위젯 빌더들은 이전과 동일 (생략)
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

  Widget _buildHorizontalListSection(String title, List<Map<String, dynamic>> places) {
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
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestinationDetailScreen(destination: place),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          place['image']!,
                          height: 120,
                          width: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 120, width: 150, color: Colors.grey[200],
                            child: const Icon(Icons.broken_image, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        place['name']!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

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


// --- 상세 화면 ---
class DestinationDetailScreen extends StatelessWidget {
  final Map<String, dynamic> destination;
  const DestinationDetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverContent(),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250.0,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          destination['name']!,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        background: Image.network(
          destination['image']!,
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.3),
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSliverContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination['description']!,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
             _buildHorizontalListSection(
              '많이 찾는 장소',
              (destination['popularPlaces'] as List).cast<Map<String, dynamic>>(),
            ),
          ],
        ),
      ),
    );
  }
  
    // 상세 화면의 가로 스크롤 목록 (홈 화면과 동일한 로직 사용)
   Widget _buildHorizontalListSection(String title, List<Map<String, dynamic>> places) {
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
              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        place['image']!,
                        height: 120,
                        width: 150,
                        fit: BoxFit.cover,
                         errorBuilder: (context, error, stackTrace) => Container(
                            height: 120, width: 150, color: Colors.grey[200],
                            child: const Icon(Icons.broken_image, color: Colors.grey),
                          ),
                      ),
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
}

