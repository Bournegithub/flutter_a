import 'package:flutter/material.dart';


class CPPlaceholder extends StatefulWidget {
  CPPlaceholder({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPPlaceholderState createState() => _CPPlaceholderState();
}

class _CPPlaceholderState extends State<CPPlaceholder> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('placeholder')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}