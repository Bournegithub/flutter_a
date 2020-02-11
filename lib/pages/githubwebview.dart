// 点击广告页面打开的webview, 在此页面上点击返回按钮，返回首页
import 'package:flutter/material.dart';
import '../routers/navigatorUtil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../routers/model/homeParams.dart';
// android需在AndroidManifest.xml文件加入 <uses-permission android:name="android.permission.INTERNET" />
// ios需在Info.plist文件中加入 <key>io.flutter.embedded_views_preview</key> <string>YES</string>


class GithubviewPage extends StatefulWidget {
  GithubviewPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _GithubviewPageState createState() => _GithubviewPageState();
}

class _GithubviewPageState extends State<GithubviewPage> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;
  _goAbout(){
    NavigatorUtil.goBack(context);
    // int index = 3;
    // HomeParams homeParms = new HomeParams(params1: 'github页面返回example1', params2: 'github页面返回example2');
    // NavigatorUtil.backHomePage(context, index, homeParms);
  }
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'https://github.com/Bournegithub',
          textAlign:TextAlign.center,
        ),
        leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goAbout();
            },
        ),
      ),
      body:  new WebviewScaffold(
          url: "https://github.com/Bournegithub",
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}