import 'package:flutter/material.dart';
import 'package:flutter_kakao_app/screens/chat_screen.dart';
import 'package:flutter_kakao_app/screens/friend_screen.dart';
import 'package:flutter_kakao_app/screens/more_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: IndexedStack( // 여러페이지로 이동하기 위해 사용. 현재 인덱스에 해당하는 하나의 위젯만 보여줌.
        index: _selectedIndex, // 상태변수
        children: [
          FriendScreen(),
          ChatScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        // 현재 index 알려주기
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
            icon: Icon(FontAwesomeIcons.user),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisH),
            label: "",
          ),
        ],
      ),
    );
  }
}
