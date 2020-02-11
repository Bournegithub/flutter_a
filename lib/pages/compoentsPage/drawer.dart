import 'package:flutter/material.dart';


class CPDrawer extends StatefulWidget {
  CPDrawer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDrawerState createState() => _CPDrawerState();
}

class _CPDrawerState extends State<CPDrawer> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('drawer')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}