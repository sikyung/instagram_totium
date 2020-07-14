import 'package:flutter/material.dart';
import 'package:instagramtotium/constants/size.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size _size;
  double menuWidth;
  int duration = 200;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      transform: Matrix4.translationValues(
        _menuOpened ? _size.width - menuWidth : _size.width,
        0,
        0,
      ),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(child: Text('시스템 관리'), onPressed: null ,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      color: Colors.transparent,
      transform: Matrix4.translationValues(
        _menuOpened ? -menuWidth : 0,
        0,
        0,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _usernameIconButton()
          ],
        ),
      ),
    );
  }

  Row _usernameIconButton() {
    return Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: commond_gap),
                child: Text(
                  '시스템 환경설정',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    _menuOpened = !_menuOpened;
                  });
                },
              )
            ],
          );
  }
}
