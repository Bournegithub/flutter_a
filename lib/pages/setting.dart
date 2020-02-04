import 'package:flutter/material.dart';
import '../routers/navigatorUtil.dart';
import '../routers/model/homeParams.dart';


class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  _goAbout(){
    int index = 3;
    HomeParams homeParms = new HomeParams(params1: 'github页面返回example1', params2: 'github页面返回example2');
    NavigatorUtil.backHomePage(context, index, homeParms);
  }

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
              child: new Text('设置'),
            ),
        leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goAbout();
            },
        ),
      ),
      body:  (
          Text('设置')
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}