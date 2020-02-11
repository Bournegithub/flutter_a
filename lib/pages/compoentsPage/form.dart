import 'package:flutter/material.dart';


class CPForm extends StatefulWidget {
  CPForm({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPFormState createState() => _CPFormState();
}

class _CPFormState extends State<CPForm> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('form')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}