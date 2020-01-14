import 'package:flutter/material.dart';

class ADPage extends StatefulWidget {
  ADPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ADPageState createState() => _ADPageState();
}

class _ADPageState extends State<ADPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('广告页面'),
        ),
      ),
    );
  }
}