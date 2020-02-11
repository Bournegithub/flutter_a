import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPDataTable extends StatefulWidget {
  CPDataTable({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDataTableState createState() => _CPDataTableState();
}

class _CPDataTableState extends State<CPDataTable> with AutomaticKeepAliveClientMixin {
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
              child: new Text('DataTable'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('datatable')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}