import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPDatePickers extends StatefulWidget {
  CPDatePickers({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDatePickersState createState() => _CPDatePickersState();
}

class _CPDatePickersState extends State<CPDatePickers> with AutomaticKeepAliveClientMixin {
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
              child: new Text('Date & Time Pickers'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('datepickers')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}