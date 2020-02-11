import 'package:flutter/material.dart';


class CPTabBar extends StatefulWidget {
  CPTabBar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPTabBarState createState() => _CPTabBarState();
}

class _CPTabBarState extends State<CPTabBar> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('tabbar')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}