import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPDrawer extends StatefulWidget {
  CPDrawer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDrawerState createState() => _CPDrawerState();
}

class _CPDrawerState extends State<CPDrawer> with AutomaticKeepAliveClientMixin {
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
              child: new Text('Drawer'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('drawer')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}