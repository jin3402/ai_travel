import 'package:flutter/material.dart';

void main() {
  runApp(const EmergencyContactApp());
}

class EmergencyContactApp extends StatelessWidget {
  const EmergencyContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF3B82F6),
        fontFamily: 'Pretendard', 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 15, color: Color(0xFF666666)),
        ),
      ),
      home: const EmergencyContactScreen(),
    );
  }
}

// 긴급 연락처 화면을 구성하는 메인 위젯입니다.
class EmergencyContactScreen extends StatelessWidget {
  const EmergencyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('긴급 연락처'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 기능 (필요시 구현)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // 연락처 목록을 스크롤 가능하게 표시합니다.
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 16.0),
                children: const [
                  ContactCard(
                    name: '소방서',
                    phoneNumber: '119',
                  ),
                  SizedBox(height: 16),
                  ContactCard(
                    name: '경찰서',
                    phoneNumber: '112',
                  ),
                  SizedBox(height: 16),
                  ContactCard(
                    name: '병원',
                    phoneNumber: '1339',
                  ),
                  SizedBox(height: 16),
                  ContactCard(
                    name: '가족 연락처',
                    phoneNumber: '010-0000-0000',
                  ),
                ],
              ),
            ),
            // '연락처 추가' 버튼
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  '연락처 추가',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  // 연락처 추가 기능
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 개별 연락처 카드를 표시하는 재사용 가능한 위젯입니다.
class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const ContactCard({
    super.key,
    required this.name,
    required this.phoneNumber,
  });



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      shadowColor: Colors.black.withOpacity(0.1),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        title: Text(name, style: textTheme.titleLarge),
        subtitle: Text(phoneNumber, style: textTheme.bodyMedium),
        trailing: IconButton(
          icon:
              Icon(Icons.call, color: Theme.of(context).primaryColor, size: 28),
          onPressed: () {
            // _makePhoneCall(phoneNumber);
            print('$phoneNumber 번호로 전화를 겁니다.');
          },
        ),
      ),
    );
  }
}
