import 'package:flutter/material.dart';
import 'package:flutter_kakao_app/components/bottom_icon_button.dart';
import 'package:flutter_kakao_app/components/round_icon_button.dart';
import 'package:flutter_kakao_app/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          // 높이에 맞춰 이미지를 확대 혹은 축소하기 위해 fitHeight
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        // Scaffold가 배경을 가리지 않도록 투명도.
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // 배경 안가리게 투명도 설정
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.times,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            RoundIconButton(icon: FontAwesomeIcons.gift),
            SizedBox(width: 15),
            RoundIconButton(icon: FontAwesomeIcons.cog),
            SizedBox(width: 20),
          ],
        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(user.backgroundImage),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(
              user.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              user.intro,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 1,
            ),
            SizedBox(height: 20),
            Divider(color: Colors.white),
            if (user.name == me.name) _buildMyIcons() else _buildFriendIcons(),
          ],
        ),
      ),
    );
  }
}

Widget _buildMyIcons() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BottomIconButton(
          icon: FontAwesomeIcons.comment,
          text: "나와의 채팅",
        )
      ],
    ),
  );
}

Widget _buildFriendIcons() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BottomIconButton(
          icon: FontAwesomeIcons.comment,
          text: "1:1 채팅",
        ),
        SizedBox(
          width: 50,
        ),
        BottomIconButton(
          icon: FontAwesomeIcons.phone,
          text: "통화하기",
        )
      ],
    ),
  );
}
