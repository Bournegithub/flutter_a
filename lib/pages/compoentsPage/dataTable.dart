import 'package:flutter/material.dart';


class CPDataTable extends StatefulWidget {
  CPDataTable({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDataTableState createState() => _CPDataTableState();
}

class _CPDataTableState extends State<CPDataTable> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('datatable')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}