import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPForm extends StatefulWidget {
  CPForm({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPFormState createState() => _CPFormState();
}

class _CPFormState extends State<CPForm> with AutomaticKeepAliveClientMixin {
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
              child: new Text('Form'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('form')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}