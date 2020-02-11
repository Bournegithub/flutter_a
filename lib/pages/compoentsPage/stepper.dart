import 'package:flutter/material.dart';


class CPStepper extends StatefulWidget {
  CPStepper({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPStepperState createState() => _CPStepperState();
}

class _CPStepperState extends State<CPStepper> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new Text('stepper')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}