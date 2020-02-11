import 'package:flutter/material.dart';


class CPChip extends StatefulWidget {
  CPChip({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPChipState createState() => _CPChipState();
}

class _CPChipState extends State<CPChip> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('chip')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}