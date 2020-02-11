import 'package:flutter/material.dart';


class CPRowCloumn extends StatefulWidget {
  CPRowCloumn({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPRowCloumnState createState() => _CPRowCloumnState();
}

class _CPRowCloumnState extends State<CPRowCloumn> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('rowcloumn')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}