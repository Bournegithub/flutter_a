import 'package:flutter/material.dart';
import '../routers/navigatorUtil.dart';


class LanguagePage extends StatefulWidget {
  LanguagePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
              child: new Text('语言'),
            ),
        leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // _goAbout();
            },
        ),
      ),
      body:  (
          Text('语言设置')
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}