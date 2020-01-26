// 广告页 跟随启动页，在引导页启用时不启用
import 'package:flutter/material.dart';
import '../utils/sharedPreferenceUtil.dart';
import '../service/service.dart';
import '../routers/navigatorUtil.dart';
import 'dart:async';

class ADPage extends StatefulWidget {
  ADPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ADPageState createState() => _ADPageState();
}

//  请注意 'with TickerProviderStateMixin', 不加的话动画vsync参数报错
class _ADPageState extends State <ADPage> with TickerProviderStateMixin {
  int count = 3;
  final period = const Duration(seconds: 1);
  // AnimationController controller;
  goHome(){
    NavigatorUtil.goHomePage(context);
  }
  _getAdImage() async {
    var result = await Service.getAD();
    result.then((value){
      print('adimg: $result');
    });
  }
  @override
  void initState(){
    super.initState();
    Timer.periodic(period, (timer) {
      //到时回调
      print('afterTimer= $count');
      print('timer: $timer');
      count--;
      setState(() {
        count;
      });
      if (count <= 0) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        goHome();
      }
    });
    Future<bool> result = SharedPreferenceUtil.setBool('isFirstOpen', true);
    result.then((value){
      print('isFirstOpen已经存储');
    });
    _getAdImage();
    // controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     print("completed");
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     print("dismissed");
    //     controller.forward();
    //   } else if (status == AnimationStatus.forward) {
    //     print("forward");
    //   } else if (status == AnimationStatus.reverse) {
    //     print("reverse");
    //     controller.dispose();
    //   }
    // });
    // controller.forward();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          // 注意组件的子父级关系, 有可能会报 ‘position widgets must be placed directiy inside stack widgets’这个错误
          Positioned(
              right: 0,
              top: 0,
              left: 0,
              bottom: 0,
              child: new Image.network('https://img.zcool.cn/community/01d4545deb307ca801213853c06750.jpg@2o.jpg', fit: BoxFit.fill),
              // child: ScaleTransition(
              //   alignment: Alignment.center,
              //   scale: controller,
              //   child: new Container(
              //     width: double.infinity,
              //     height: double.infinity,
              //     child: new Image.network('https://img.zcool.cn/community/01d4545deb307ca801213853c06750.jpg@2o.jpg', fit: BoxFit.fill),
              //   ),
              // ),
          ),
          Positioned(
            right: 20,
            top: 40,
            child: new Text(
              '广告 $count',
              style: TextStyle(color: Colors.white),
            )
          ),
          Positioned(
            right: 40,
            bottom: 80,
            child: new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('跳过'),
              onPressed: () {
                  goHome();
              },
            )
          ),
        ],
      )
    );
  }
  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }
} 