import 'package:flutter/material.dart';


class CPDialog extends StatefulWidget {
  CPDialog({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDialogState createState() => _CPDialogState();
}

class _CPDialogState extends State<CPDialog> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('dialog')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}