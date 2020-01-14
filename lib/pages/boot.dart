import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../routers/application.dart';
import '../routers/routes.dart';
import '../routers/navigatorUtil.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    Observable.timer(0, Duration(seconds: 2)).listen((_){
      /// 然后看 NavigatorUtil.dart
      NavigatorUtil.gotransitionCustomDemoPage(context, Routes.home);
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent, //把appbar的背景色改成透明
            //   // elevation: 0,//appbar的阴影
            //   title: Text('test'),
            // ),
            body: Center(
              child: new Padding(
                padding: new EdgeInsets.only(top:200),
                child: new Column(
                  children: <Widget>[
                    Text(
                      'Link',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                      )
                    ),
                    Text(
                      'You have pushed the button',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      )
                    ),
                ]
              )
              ),
            )
            
        )
    );
  }
}