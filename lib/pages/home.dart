import 'package:flutter/material.dart';
import '../service/service.dart';
import 'package:dio/dio.dart';
import 'dart:async';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInfo;
  String name = '1111';
  Future getUserInfo() async {
    print('aaaaa');
    userInfo = await Service.login({'user': 'aa','pwd':'123456'});
    return userInfo;
  }
  void initState() {
    // getUserInfo().then((val){
    //   print('val-----$val');
    //   setState((){
    //     name = userInfo['name'];
    //   });
    // });
    // setState((){
    //     name = userInfo['name'];
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(name),
        ),
      ),
    );
  }
}