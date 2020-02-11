import 'package:flutter/material.dart';
import '../../routers/navigatorUtil.dart';

class CPRowColumn extends StatefulWidget {
  CPRowColumn({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CPRowColumnState createState() => _CPRowColumnState();
}

class _CPRowColumnState extends State<CPRowColumn> with AutomaticKeepAliveClientMixin {
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
          'Row & Column',
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
        child: ListView (
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Row-mainAxisAlignment: '),
                    subtitle: Text('MainAxisAlignment.spaceBetween'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: <Widget>[
                      Text('spaceBetween'),
                      Text('spaceBetween'),
                      Text('spaceBetween'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Row-mainAxisAlignment:'),
                    subtitle: Text('MainAxisAlignment.spaceAround'),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceAround, 
                    children: <Widget>[
                      Text('spaceAround'),
                      Text('spaceAround'),
                      Text('spaceAround'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Row-mainAxisAlignment:'),
                    subtitle: Text('MainAxisAlignment.spaceEvenly'),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: <Widget>[
                      Text('spaceEvenly'),
                      Text('spaceEvenly'),
                      Text('spaceEvenly'),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Row-mainAxisAlignment:'),
                    subtitle: Text('MainAxisAlignment.start'),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.start, 
                    children: <Widget>[
                      Text('start'),
                      Text('start'),
                      Text('start'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Row-mainAxisAlignment:'),
                    subtitle: Text('MainAxisAlignment.start'),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: <Widget>[
                      Text('center'),
                      Text('center'),
                      Text('center'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Row-mainAxisAlignment:'),
                    subtitle: Text('MainAxisAlignment.end'),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: <Widget>[
                      Text('end'),
                      Text('end'),
                      Text('end'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Column-crossAxisAlignment:'),
                    subtitle: Text('CrossAxisAlignment.start'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('We move under cover and we move as one'),
                      Text('Through the night, we have one shot to live another day'),
                      Text('We cannot let a stray gunshot give us away'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Column-crossAxisAlignment:'),
                    subtitle: Text('CrossAxisAlignment.center'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('We move under cover and we move as one'),
                      Text('Through the night, we have one shot to live another day'),
                      Text('We cannot let a stray gunshot give us away'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Column-crossAxisAlignment:'),
                    subtitle: Text('CrossAxisAlignment.end'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('We move under cover and we move as one'),
                      Text('Through the night, we have one shot to live another day'),
                      Text('We cannot let a stray gunshot give us away'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ]
        ),
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}