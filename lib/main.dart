import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 바텀네비게이션이랑 쌍으로 쓰는거
      body: IndexedStack(
        index: 1, // 상태변수
        children: [
          Center(child: Text("IndexedStack 1")),
          Center(child: Text("IndexedStack 2")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 현재 index 알려주기
        showSelectedLabels: false,
        // 레이블 표시 (디폴트값 true)
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        // 테마로 지정해주는게 더 좋음
        unselectedItemColor: Colors.black54,
        onTap: (value) {
          print("선택된 바텀 메뉴 $value");
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "22",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
