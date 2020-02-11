import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPStepper extends StatefulWidget {
  CPStepper({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPStepperState createState() => _CPStepperState();
}

class _CPStepperState extends State<CPStepper> with AutomaticKeepAliveClientMixin {
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
              child: new Text('Stepper'),
            ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: new Text('stepper')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}