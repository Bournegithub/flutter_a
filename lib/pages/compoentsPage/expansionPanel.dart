import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPPanel extends StatefulWidget {
  CPPanel({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPPanelState createState() => _CPPanelState();
}

class _CPPanelState extends State<CPPanel> with AutomaticKeepAliveClientMixin {
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
              child: new Text('ExpansionPanel'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('panel')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}