import 'package:flutter/material.dart';


class CPScaffold extends StatefulWidget {
  CPScaffold({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPScaffoldState createState() => _CPScaffoldState();
}

class _CPScaffoldState extends State<CPScaffold> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('scaffold')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}