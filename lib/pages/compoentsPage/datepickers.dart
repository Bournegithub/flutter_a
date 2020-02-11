import 'package:flutter/material.dart';


class CPDatePickers extends StatefulWidget {
  CPDatePickers({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPDatePickersState createState() => _CPDatePickersState();
}

class _CPDatePickersState extends State<CPDatePickers> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('datepickers')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}