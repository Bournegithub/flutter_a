import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers/routes.dart';
import 'routers/application.dart';
import './myApp.dart';

void main() {
  // 注册 fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'test',
//       /// 生成路由
//       onGenerateRoute: Application.router.generator,
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//   void _removeCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       // bottomNavigationBar: BottomAppBar(
//       //   child: Container(
//       //     height: 50.0,
//       //   ),
//       // ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'Increment',
//       //   child: Icon(Icons.add),
//       // ), // This trailing comma makes auto-formatting nicer for build methods.
//       floatingActionButton: Stack(
//         children: <Widget>[
//           Padding(padding: EdgeInsets.only(left:31),
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: FloatingActionButton(
//               onPressed: _incrementCounter,
//               child: Icon(Icons.add),),
//           ),),

//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton(
//               onPressed: _removeCounter,
//             child: Icon(Icons.remove),),
//           ),
//         ],
//       )
//     );
//   }
// }
