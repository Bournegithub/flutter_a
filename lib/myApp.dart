import 'package:flutter/material.dart';

import 'routers/application.dart';

class MyApp extends StatelessWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aaaaaa',
      /// 生成路由
      onGenerateRoute: Application.router.generator,
    );
  }
}