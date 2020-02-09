import 'package:flutter/material.dart';


class CompoentsPage extends StatefulWidget {
  CompoentsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CompoentsPageState createState() => _CompoentsPageState();
}

class _CompoentsPageState extends State<CompoentsPage> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: new Text('compoents')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}