import 'package:flutter/material.dart';


class NativePage extends StatefulWidget {
  NativePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NativePageState createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      child: new Text('native')
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}