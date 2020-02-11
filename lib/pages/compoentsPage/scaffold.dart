import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPScaffold extends StatefulWidget {
  CPScaffold({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPScaffoldState createState() => _CPScaffoldState();
}

class _CPScaffoldState extends State<CPScaffold> with AutomaticKeepAliveClientMixin {
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
        title: new Text(
          'Scaffold AppBar',
          textAlign:TextAlign.center,
        ),
        leading: new IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goback();
            },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Scaffold body'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          
        }),
        tooltip: 'floatingActionButton',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Center(child: Text('BottomAppBar'),),
        ),
      ),
      
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}