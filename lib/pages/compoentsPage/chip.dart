import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';


class CPChip extends StatefulWidget {
  CPChip({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPChipState createState() => _CPChipState();
}

class _CPChipState extends State<CPChip> with AutomaticKeepAliveClientMixin {
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
              child: new Text('Chip'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('chip')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}