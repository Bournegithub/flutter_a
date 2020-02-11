import 'package:flutter/material.dart';


class CPPanel extends StatefulWidget {
  CPPanel({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPPanelState createState() => _CPPanelState();
}

class _CPPanelState extends State<CPPanel> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('panel')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}