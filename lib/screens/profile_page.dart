import 'package:flutter/material.dart';
import 'package:instagramtotium/constants/size.dart';
import 'package:instagramtotium/util/profile_img_path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  double menuWidth;
  int duration = 200;
  AlignmentGeometry tabAlign = Alignment.centerRight;

  @override
  Widget build(BuildContext context) {

    menuWidth = size.width / 1.5;
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
        _menuOpened ? size.width - menuWidth : size.width,
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
              FlatButton(
                child: Text('시스템 관리'),
                onPressed: null,
              )
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
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate([
                    _getProfileHeader,
                    _username(),
                    _userBio(),
                    _editProfileBtn(),
                        _getTabIconButtons,
                        _getAnimatedSelectBar,
                  ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.all(commond_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Text(
            'edit file',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.only(left: commond_gap),
      child: Text(
        "보행음성안내시스템",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: commond_gap),
      child: Text(
        '남구로초등학교',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row get _getProfileHeader => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(commond_gap),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(getProfileImagePath("crosswalk")),
            ),
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(children: [
                  _getStatusValueWiget('보행자'),
                  _getStatusValueWiget('무단횡단'),
                  _getStatusValueWiget('교통사고'),
                ]),
                TableRow(children: [
                  _getStatusLabelWiget('1,234'),
                  _getStatusLabelWiget('23'),
                  _getStatusLabelWiget('1'),
                ]),
              ],
            ),
          ),
        ],
      );

  Widget _getStatusValueWiget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: commond_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      );

  Widget _getStatusLabelWiget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: commond_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300),
              )),
        ),
      );

  Row _usernameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: commond_gap),
          child: Text(
            '스마트횡단보도 현황',
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

  Widget get _getTabIconButtons => Row(
    children: <Widget>[
      Expanded(
        child: IconButton(
          icon: ImageIcon(AssetImage("assets/grid.png")),
          onPressed: () {
            _setTab(true);
          },
        ),
      ),
      Expanded(
        child: IconButton(
          icon: ImageIcon(AssetImage("assets/saved.png")),
          onPressed: () {
            _setTab(false);
          },
        ),
      ),
    ],
  );

  Widget get _getAnimatedSelectBar =>
      AnimatedContainer(
          alignment: tabAlign,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          color: Colors.transparent,
          height: 1,
          width: size.width,
          child: Container(
            height: 1,
            width: size.width / 2,
            color: Colors.black45,
          ),
      );

  _setTab(bool tabLeft){
    setState(() {
      if (tabLeft) {
        this.tabAlign = Alignment.centerLeft;
      }else{
        this.tabAlign = Alignment.centerRight;
      }
    });
  }
}

