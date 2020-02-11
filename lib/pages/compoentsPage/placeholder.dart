import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPPlaceholder extends StatefulWidget {
  CPPlaceholder({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPPlaceholderState createState() => _CPPlaceholderState();
}

class _CPPlaceholderState extends State<CPPlaceholder> with AutomaticKeepAliveClientMixin {
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
              child: new Text('Placeholder'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('placeholder')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}