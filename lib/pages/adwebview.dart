// 点击广告页面打开的webview, 在此页面上点击返回按钮，返回首页
import 'package:flutter/material.dart';
import '../routers/navigatorUtil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// android需在AndroidManifest.xml文件加入 <uses-permission android:name="android.permission.INTERNET" />
// ios需在Info.plist文件中加入 <key>io.flutter.embedded_views_preview</key> <string>YES</string>


class AdWebviewPage extends StatefulWidget {
  AdWebviewPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AdWebviewPageState createState() => _AdWebviewPageState();
}

class _AdWebviewPageState extends State<AdWebviewPage> {
  
  goHome(){
    NavigatorUtil.goHomePage(context);
  }
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
              child: new Text('广告h5页面'),
            ),
        leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              goHome();
            },
        ),
      ),
      body:  new WebviewScaffold(
          url: "https://www.baidu.com",
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}