// 广告页 跟随启动页，在引导页启用时不启用
import 'package:flutter/material.dart';
import 'package:flutter_a/pages/native.dart';
import '../utils/sharedPreferenceUtil.dart';
import '../service/service.dart';
import '../routers/navigatorUtil.dart';
import '../routers/model/homeParams.dart';
import 'dart:async';

class ADPage extends StatefulWidget {
  ADPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ADPageState createState() => _ADPageState();
}

//  请注意 'with TickerProviderStateMixin', 不加的话动画vsync参数报错
class _ADPageState extends State <ADPage> with TickerProviderStateMixin {
  int count = 20;
  final period = const Duration(seconds: 1);
  var timer;
  // AnimationController controller;

  goHome() {
      int index = 0;
      HomeParams homeParms = new HomeParams(params1: '广告页进入example1', params2: '广告页进入example2');
      NavigatorUtil.goHomePage(context, index, homeParms);
  }
  goWebview() {
    NavigatorUtil.goAdWebview(context);
  }
  _getAdImage() {
    Future result =  Service.getAD();
    result.then((value){
      print('adimg: $value');
    });
  }
  @override
  void initState(){
    super.initState();
    timer = new Timer.periodic(period, (timer) {
      //到时回调
      // print('afterTimer= $count');
      count--;
      setState(() {
        count;
      });
      if (count <= 0) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        // 加判断token
        goHome();
      }
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
              child: GestureDetector( // 如果 widget 本身不支持事件监测，则在外面包裹一个 GestureDetector
                child: new Image.network('https://img.zcool.cn/community/01d4545deb307ca801213853c06750.jpg@2o.jpg',
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  goWebview();
                }
              ),
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
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
    // controller.dispose();
  }
} 