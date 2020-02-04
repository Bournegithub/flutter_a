// 引导页 首页启动或者版本更新时启动
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../routers/navigatorUtil.dart';
import '../utils/sharedPreferenceUtil.dart';
import '../routers/model/homeParams.dart';

class BootPage extends StatefulWidget {
  BootPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  bool visible = true;
  bool isFirstOpen;
  List bootImageList = [
    'assets/image/boot/boot_4.jpg',
    'assets/image/boot/boot_3.jpg',
    'assets/image/boot/boot_2.jpg',
    'assets/image/boot/boot_1.jpg',
  ];
  var timer;
  int count = 5;
  final period = const Duration(seconds: 1);
  goHome(){
    int index = 0;
    HomeParams homeParms = new HomeParams(params1: '引导页进入example1', params2: '引导页进入example2');
    NavigatorUtil.goHomePage(context, index, homeParms);
  }
  changeVisible(val){
    setState(() {
      if (val == 3) {
        visible = false;
      } else {
        visible = true;
      }
    });
  }
  saveIsFirstOpen() {
    Future<bool> result = SharedPreferenceUtil.setBool('isFirstOpen', false);
    result.then((value){
      // print('isFirstOpen已经存储');
      goHome();
    });
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(period, (timer) {
      //到时回调
      // print('afterTimer= $count');
      print('timer: $timer');
      count--;
      setState(() {
        count;
      });
      if (count <= 0) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        // 跳转home页面
        saveIsFirstOpen();
      }
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        alignment: const Alignment(0.0, 0.9),
        children: [
          new Swiper(
            itemBuilder: (BuildContext context,int index){
              // return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
              return new Image.asset(bootImageList[index], fit: BoxFit.fill);
              // if( bootImageList.length > 0) {
              //   return new Image.network(bootImageList[index], fit: BoxFit.fill);
              // } else {
              //   return new Image.network('http://via.placeholder.com/350x150', fit: BoxFit.fill);
              // }
              
            },
            itemCount: bootImageList.length,
            pagination: new SwiperPagination(),
            // control: new SwiperControl(),
            control: null,
            loop: false,
            onIndexChanged: (val){
              print('当前切换到: $val');
              changeVisible(val);
            },
            // 模拟调试不起作用
            onTap: (val){
              print('tap: $val');
            }
          ),
          Positioned(
            right: 20,
            top: 40,
            child: new Text('$count')
          ),
          new Offstage(
            offstage: visible,
            child: new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('进入首页'),
              onPressed: () {
                  saveIsFirstOpen();
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
  }
}