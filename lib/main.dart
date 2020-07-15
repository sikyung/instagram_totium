import 'package:flutter/material.dart';
import 'package:instagramtotium/constants/materal_white_color.dart';
import 'package:instagramtotium/constants/size.dart';
import 'package:instagramtotium/main_page.dart';

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        primarySwatch: white
      ),
    );
  }
}


