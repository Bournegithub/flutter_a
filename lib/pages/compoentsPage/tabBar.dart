import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPTabBar extends StatefulWidget {
  CPTabBar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPTabBarState createState() => _CPTabBarState();
}

class _CPTabBarState extends State<CPTabBar> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  _goback() {
    NavigatorUtil.goBack(context);
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
        title: new Center(
              child: new Text('TabBar & TabBarView'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('tabbar')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}